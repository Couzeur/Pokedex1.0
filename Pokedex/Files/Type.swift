//
//  Type.swift
//  Pokedex
//
//  Created by Axel Forgues on 04/02/2023.
//

import Foundation
import SwiftUI


class PokemonType: Codable, Identifiable, ObservableObject {
    let id = UUID()
    let name: String
    let color: Color
    let superEffectiveAgainst : [String]
    let notVeryEffectiveAgainst : [String]
    let noEffectAgainst : [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case color
        case superEffectiveAgainst
        case notVeryEffectiveAgainst
        case noEffectAgainst
        case red
        case green
        case blue
        case alpha
    }
    
    init(name: String, color: Color, superEffectiveAgainst: [String], notVeryEffectiveAgainst: [String], noEffectAgainst: [String]) {
        self.name = name
        self.color = color
        self.superEffectiveAgainst = superEffectiveAgainst
        self.notVeryEffectiveAgainst = notVeryEffectiveAgainst
        self.noEffectAgainst = noEffectAgainst
    }
    
    
    required init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           // Décodez les propriétés nécessaires et initialisez votre objet PokemonType
           name = try container.decode(String.self, forKey: .name)
           
           // Décodez les composants RGBA en tant que valeurs individuelles
           let red = try container.decode(Double.self, forKey: .red)
           let green = try container.decode(Double.self, forKey: .green)
           let blue = try container.decode(Double.self, forKey: .blue)
           let alpha = try container.decode(Double.self, forKey: .alpha)
           
           // Créez une couleur à partir des composants
           color = Color(red: red, green: green, blue: blue, opacity: alpha)
           
           superEffectiveAgainst = try container.decode([String].self, forKey: .superEffectiveAgainst)
           notVeryEffectiveAgainst = try container.decode([String].self, forKey: .notVeryEffectiveAgainst)
           noEffectAgainst = try container.decode([String].self, forKey: .noEffectAgainst)
       }

       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           // Encodez les propriétés nécessaires de votre objet PokemonType
           try container.encode(name, forKey: .name)
           
           // Extrayez les composants RGBA de la couleur
           let uiColor = UIColor(color)
           var red: CGFloat = 0
           var green: CGFloat = 0
           var blue: CGFloat = 0
           var alpha: CGFloat = 0
           uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
           
           // Encodez les composants RGBA en tant que valeurs individuelles
           try container.encode(Double(red), forKey: .red)
           try container.encode(Double(green), forKey: .green)
           try container.encode(Double(blue), forKey: .blue)
           try container.encode(Double(alpha), forKey: .alpha)
           
           try container.encode(superEffectiveAgainst, forKey: .superEffectiveAgainst)
           try container.encode(notVeryEffectiveAgainst, forKey: .notVeryEffectiveAgainst)
           try container.encode(noEffectAgainst, forKey: .noEffectAgainst)
       }
    
    
    func hash(into hasher: inout Hasher) {
        // Utilisez un ou plusieurs des propriétés de PokemonType pour calculer le hash
        name.hash(into: &hasher)
    }
    
    // Implémentation de l'égalité (==)
    static func == (lhs: PokemonType, rhs: PokemonType) -> Bool {
        // Comparez les propriétés de PokemonType pour déterminer l'égalité
        return lhs.name == rhs.name
    }
    
    
    
}

class PokemonTypesStored: ObservableObject {
    @Published var types : [PokemonType]
    
    init() {
        self.types = []
        let normal = PokemonType(name: "NORMAL",
                                 color: Color(red: 166/255, green: 159/255, blue: 143/255),
                                 superEffectiveAgainst: [],
                                 notVeryEffectiveAgainst: ["ROCK", "STEEL"],
                                 noEffectAgainst: ["GHOST"])
        self.types.append(normal)
        
        
        let fire = PokemonType(name: "FIRE",
                               color: Color(red: 199/255, green: 33/255, blue: 0/255),
                               superEffectiveAgainst: ["GRASS", "ICE", "BUG", "STEEL"],
                               notVeryEffectiveAgainst: ["FIRE", "WATER", "ROCK", "DRAGON"],
                               noEffectAgainst: [])
        self.types.append(fire)
        
        
        let water = PokemonType(name: "WATER",
                                color: Color(red: 11/255, green: 103/255, blue: 194/255),
                                superEffectiveAgainst: ["FIRE", "GROUND", "ROCK"],
                                notVeryEffectiveAgainst: ["WATER", "GRASS", "DRAGON"],
                                noEffectAgainst: [""])
        self.types.append(water)
        
        
        let electric = PokemonType(name: "ELECTRIC",
                                   color: Color(red: 235/255, green: 150/255, blue: 2/255),
                                   superEffectiveAgainst: ["WATER", "FLYING"],
                                   notVeryEffectiveAgainst: ["GRASS", "ELECTRIC", "DRAGON"],
                                   noEffectAgainst: ["GROUND"])
        self.types.append(electric)
        
        
        let grass = PokemonType(name: "GRASS",
                                color: Color(red: 48/255, green: 141/255, blue: 4/255),
                                superEffectiveAgainst: ["WATER", "GROUND", "ROCK"],
                                notVeryEffectiveAgainst: ["FIRE", "GRASS", "POISON", "FLYING", "BUG", "DRAGON", "STEEL"],
                                noEffectAgainst: [""])
        self.types.append(grass)
        
        
        let ice = PokemonType(name: "ICE",
                              color: Color(red: 109/255, green: 211/255, blue: 245/255),
                              superEffectiveAgainst: ["GRASS", "GROUND", "FLYING", "DRAGON"],
                              notVeryEffectiveAgainst: ["FIRE", "WATER", "ICE", "STEEL"],
                              noEffectAgainst: [""])
        self.types.append(ice)
        
        
        let fighting = PokemonType(name: "FIGHTING",
                                   color: Color(red: 97/255, green: 36/255, blue: 18/255),
                                   superEffectiveAgainst: ["NORMAL", "ROCK", "ICE", "DARK", "STEEL"],
                                   notVeryEffectiveAgainst: ["POISON", "FLYING", "PSYCHIC", "BUG", "FAIRY"],
                                   noEffectAgainst: ["GHOST"])
        self.types.append(fighting)
        
        
        let poison = PokemonType(name: "POISON",
                                 color: Color(red: 90/255, green: 25/255, blue: 92/255),
                                 superEffectiveAgainst: ["GRASS", "FAIRY"],
                                 notVeryEffectiveAgainst: ["POISON", "ROCK", "STEEL", "FAIRY"],
                                 noEffectAgainst: ["STEEL"])
        self.types.append(poison)
        
        
        let ground = PokemonType(name: "GROUND",
                                 color: Color(red: 170/255, green: 138/255, blue: 49/255),
                                 superEffectiveAgainst: ["FIRE", "ELECTRIC", "POISON", "ROCK", "STEEL"],
                                 notVeryEffectiveAgainst: ["GRASS", "BUG"],
                                 noEffectAgainst: ["FLYING"])
        self.types.append(ground)
        
        
        let flying = PokemonType(name: "FLYING",
                                 color: Color(red: 93/255, green: 115/255, blue: 212/255),
                                 superEffectiveAgainst: ["GRASS", "FIGHTING", "BUG"],
                                 notVeryEffectiveAgainst: ["ELECTRIC", "ROCK", "STEEL"],
                                 noEffectAgainst: [""])
        self.types.append(flying)
        
        
        let psychic = PokemonType(name: "PSYCHIC",
                                  color: Color(red: 220/255, green: 49/255, blue: 101/255),
                                  superEffectiveAgainst: ["FIGHTING", "POISON"],
                                  notVeryEffectiveAgainst: ["PSYCHIC", "STEEL"],
                                  noEffectAgainst: ["DARK"])
        self.types.append(psychic)
        
        
        let bug = PokemonType(name: "BUG",
                              color: Color(red: 136/255, green: 150/255, blue: 14/255),
                              superEffectiveAgainst: ["GRASS", "PSYCHIC", "DARK"],
                              notVeryEffectiveAgainst: ["FIRE", "FIGHTING", "POISON", "FLYING", "GHOST", "STEEL", "FAIRY"],
                              noEffectAgainst: [""])
        self.types.append(bug)
        
        
        let rock = PokemonType(name: "ROCK",
                               color: Color(red: 164/255, green: 140/255, blue: 66/255),
                               superEffectiveAgainst: ["FIRE", "ICE", "FLYING", "BUG"],
                               notVeryEffectiveAgainst: ["FIGHTING", "GROUND", "STEEL"],
                               noEffectAgainst: [""])
        self.types.append(rock)
        
        let ghost = PokemonType(name: "GHOST",
                                color: Color(red: 72/255, green: 72/255, blue: 151/255),
                                superEffectiveAgainst: ["PSYCHIC", "GHOST"],
                                notVeryEffectiveAgainst: ["DARK"],
                                noEffectAgainst: ["NORMAL"])
        self.types.append(ghost)
        
        
        let dragon = PokemonType(name: "DRAGON",
                                 color: Color(red: 68/255, green: 50/255, blue: 138/255),
                                 superEffectiveAgainst: ["DRAGON"],
                                 notVeryEffectiveAgainst: ["STEEL"],
                                 noEffectAgainst: [""])
        self.types.append(dragon)
        
        let dark = PokemonType(name: "DARK",
                               color: Color(red: 67/255, green: 50/255, blue: 39/255),
                               superEffectiveAgainst: ["PSYCHIC", "GHOST"],
                               notVeryEffectiveAgainst: ["FIGHTING", "DARK", "FAIRY"],
                               noEffectAgainst: [""])
        self.types.append(dark)
        
        let steel = PokemonType(name: "STEEL",
                                color: Color(red: 142/255, green: 142/255, blue: 158/255),
                                superEffectiveAgainst: ["ICE", "ROCK", "FAIRY"],
                                notVeryEffectiveAgainst: ["FIRE", "WATER", "ELECTRIC", "STEEL"],
                                noEffectAgainst: [""])
        self.types.append(steel
        )
        
        let fairy = PokemonType(name: "FAIRY",
                                color: Color(red: 226/255, green: 143/255, blue: 226/255),
                                superEffectiveAgainst: ["FIGHTING", "DARK", "DRAGON"],
                                notVeryEffectiveAgainst: ["FIRE", "POISON", "STEEL"],
                                noEffectAgainst: [""])
        self.types.append(fairy)
        
        
        self.types.sort {
            $0.name < $1.name
        }
    }
}


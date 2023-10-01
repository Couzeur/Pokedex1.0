//
//  Pokemon.swift
//  Pokedex
//
//  Created by Axel Forgues on 03/02/2023.
//

import Foundation
import SwiftUI


class Pokemon: Codable, Identifiable, ObservableObject {
    let id: Int
    let name: Name
    let type: [PokemonType]
    let base : Base
    
    
    init(id: Int, name: Name, base: Base, type: [PokemonType]) {
        self.id = id
        self.name = name
        self.base = base
        self.type = type
    }
}

    class Name: Codable {
        let english: String
        let japanese: String
        let chinese: String
        let french: String
    }
    
    class Base: Codable {
        let hp : Int
        let attack : Int
        let defense : Int
        let spAttack : Int
        let spDefense : Int
        let speed : Int
    }
    

    
    func displayedColorsTypes(types: [String]) -> [Color] {
        let allTypes = PokemonTypesStored().types
        var colors : [Color] = []
        for type in types {
            for possibility in allTypes {
                if type.uppercased() == possibility.name {
                    colors.append(possibility.color)
                }
            }
        }
        return colors
    }



struct Pokedex: Codable {
    var pokemons: [Pokemon]
}





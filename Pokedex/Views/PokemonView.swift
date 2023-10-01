//
//  PokemonView.swift
//  Pokedex
//
//  Created by Axel Forgues on 29/01/2023.
//

import SwiftUI

struct PokemonView: View {
    
    @ObservedObject var selectedPokemon: Pokemon
    let columns = [GridItem(.adaptive(minimum: 100))]
    let allTypes = PokemonTypesStored()
    
    var body: some View {
        ScrollView {
            VStack {
                
                Text("\(selectedPokemon.name.french)")
                    .font(.title).bold()
                    .padding()
                
                Image(String(format: "%03d", selectedPokemon.id))
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding()
                
                LazyVGrid(columns: columns) {
                    ForEach(selectedPokemon.type) { pokeType in
                        Text(pokeType.name.uppercased())
                            .font(.headline.bold())
                            .padding()
                            .foregroundColor(.black)
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 50)
                                        .fill(displayedColorTypeCapsule(type: pokeType.name))
                                })
                    }
                }
                
                
                
                Text("Description du pokémon...")
                    .italic()
                    .padding()
            }
        }
    }
        
        func displayedColorTypeCapsule(type: String) -> Color {
            let allTypes = PokemonTypesStored().types
            var color = Color(red: 0, green: 0, blue: 0, opacity: 1)
            
            for allType in allTypes {
                if type.uppercased() == allType.name {
                    color = allType.color
                }
            }
            
            return color
    }
        
    
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(selectedPokemon: Pokedex(pokemons: Bundle.main.decode("pokedex.json")).pokemons.randomElement()!)
    }
}

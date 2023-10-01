//
//  ContentView.swift
//  Pokedex
//
//  Created by Axel Forgues on 29/01/2023.
//

import SwiftUI



struct ContentView: View {
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    let pokemons : [Pokemon] = Pokedex(pokemons: Bundle.main.decode("pokedex.json")).pokemons
    @State var selectedPokemon : Pokemon?
    
    @State var types: [PokemonType] = PokemonTypesStored().types
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(pokemons, id: \.id) { pokemon in
                        NavigationLink(destination: PokemonView(selectedPokemon: pokemon), label: {
                            VStack {
                                Image(String(format: "%03d", pokemon.id))
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal)

                                
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(
                                            LinearGradient(gradient: Gradient(colors: multicolorTypeDisplay(types: pokemon.type)), startPoint: .leading, endPoint: .trailing))
                                        .frame(height: 50)
                                        .padding()
                                    VStack {
                                        Text(pokemon.name.french)
                                            .foregroundColor(.black)
                                            .font(.headline)
                                        Text(String(format: "%03d", pokemon.id))
                                            .foregroundColor(.black.opacity(0.5))
                                    }
                                }
                            }
                        })
                    }
                }
            }.navigationTitle("Pokédex")
            .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink("Types") {
                                TypesView()
                            }
                            .bold()
                    }
                }
            }
        }

    func multicolorTypeDisplay(types: [PokemonType]) -> [Color] {
        var colorTable = [Color]()
        for type in types {
            colorTable.append(type.color)
        }
        return colorTable
    }
    
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

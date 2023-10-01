//
//  TypeDetailView.swift
//  Pokedex
//
//  Created by Axel Forgues on 04/02/2023.
//

import SwiftUI

struct TypeDetailView: View {
     public var types = PokemonTypesStored().types
    @ObservedObject var selectedType : PokemonType
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [
                    Color(selectedType.color as! CGColor), .white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text(selectedType.name)
                        .font(.largeTitle).bold()
                    
                    Spacer()
                    
                    VStack {
                        Text("Strong against:")
                            .font(.title2)
                            .padding()
                            
                        LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(selectedType.superEffectiveAgainst, id: \.self) { type in
                                    Text(type)
                                        .padding()
                                        .font(.title2).bold()
                                        .minimumScaleFactor(0.8)
                                        .lineLimit(1)
                                        
                            }
                        }
                    }.padding()
                    
                    Spacer()
                    
                    VStack {
                        Text("Weak against:")
                            .font(.title2)
                            .padding()
                        
                        LazyVGrid(columns: columns, spacing: 20){
                                ForEach(selectedType.notVeryEffectiveAgainst, id: \.self) { type in
                                    Text(type)
                                        .padding()
                                        .font(.title2).bold()
                                        .minimumScaleFactor(0.8)
                                        .lineLimit(1)
                                        
                            }
                        }
                    }
                    Spacer()
                    
                    VStack {
                        Text("No effect against:")
                            .font(.title2)
                            .padding()
                        
                        LazyVGrid(columns: columns, spacing: 20){
                                ForEach(selectedType.noEffectAgainst, id: \.self) { type in
                                    Text(type)
                                        .padding()
                                        .font(.title2).bold()
                                        .minimumScaleFactor(0.1)
                                        .lineLimit(1)
                                    
                            }
                    }
                }
            }
        }
    }
    
}


struct TypeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TypeDetailView(types: PokemonTypesStored().types, selectedType: PokemonType(name: "NORMAL",
                                                               color: Color(red: 166/255, green: 159/255, blue: 143/255),
                                                               superEffectiveAgainst: [],
                                                               notVeryEffectiveAgainst: ["ROCK", "STEEL"],
                                                               noEffectAgainst: ["GHOST"]))
    }
}

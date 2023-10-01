//
//  TypesView.swift
//  Pokedex
//
//  Created by Axel Forgues on 01/02/2023.
//

import SwiftUI



struct TypesView: View {
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    let types: [PokemonType] = PokemonTypesStored().types
    @State var selectedType : PokemonType?
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black.opacity(0.5), .white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                LazyVGrid(columns: columns) {
                    ForEach(types) { type in
                        NavigationLink(destination: TypeDetailView(selectedType: type), label: {
                            
                            Text(type.name)
                                .font(.headline.bold())
                                .padding()
                                .foregroundColor(.white)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 50)
                                            .fill(LinearGradient(gradient: Gradient(colors: [
                                                Color(type.color as! CGColor).opacity(0.3),
                                                Color(type.color as! CGColor).opacity(1.0),
                                                Color(type.color as! CGColor).opacity(0.3)]),
                                                                 startPoint: .top, endPoint: .bottom))
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color(type.color as! CGColor), lineWidth: 2)
                                    })
                                .padding(.vertical)
                        }
                        )}
                    
                }.navigationTitle("Pokemon Types")
            }
        }
    }
    
    func displayedColor() -> Color {
        let allTypes = types
        let targetType = selectedType!
        
        for _ in allTypes {
            if targetType.name.uppercased() == selectedType!.name.uppercased() {
                return targetType.color
            }
        }
        return targetType.color
    }
}

struct TypesView_Previews: PreviewProvider {
    static var previews: some View {
        TypesView()
    }
}

//
//  SettingsView.swift
//  Pokedex
//
//  Created by Axel Forgues on 05/02/2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var language = "english"
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    VStack {
                        HStack{
                            Button {
                                language = "english"
                            } label: {
                                Image("english")
                                    .resizable()
                                    .frame(maxWidth: 200)
                                    .border(.black, width: 2)
                                
                                    .padding()
                                
                                Text("English")
                                
                                    .font(.title3)
                            }}
                        .overlay {
                            if language == "english" {
                                withAnimation {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(.green.opacity(0.2))
                                }}}
                        .padding()
                        
                        HStack{
                            Button {
                                language = "french"
                            } label: {
                                Image("france")
                                    .resizable()
                                    .frame(maxWidth: 200)
                                    .border(.black, width: 2)
                                
                                    .padding()
                                
                                Text("French")
                                
                                    .font(.title3)
                            }}
                        .overlay {
                            if language == "french" {
                                withAnimation {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(.green.opacity(0.2))
                                }}}
                        .padding()
                        
                        HStack{
                            Button {
                                language = "japan"
                            } label: {
                                Image("japan")
                                    .resizable()
                                    .frame(maxWidth: 200)
                                    .border(.black, width: 2)
                                
                                    .padding()
                                
                                Text("Japanese")
                                
                                    .font(.title3)
                            }}
                        .overlay {
                            if language == "japan" {
                                withAnimation {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(.green.opacity(0.2))
                                }}}
                        .padding()
                    }
                } label: {
                    Label("Languages", systemImage: "globe")
                        .font(.title3)
                        .foregroundColor(.primary)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.blue.opacity(0.2))}
                }
                    NavigationLink {
                        
                        Text("""
All pictures, names and other informations belong to The Pokemon Company.

Thanks to fanzeyi for the original document on GitHub.


App by Axel FORGUES.
""")
                        .padding()
                        
                    } label: {
                        Label("Informations", systemImage: "info.circle")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.blue.opacity(0.2))}
                    
                }.navigationTitle("Settings")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

//
//  ContentView.swift
//  Dragon_Pokemon_Decoder
//
//  Created by Sha'Marcus Walker on 1/24/23.
//

import SwiftUI

struct PokemonListView: View {
    
    var gradient =  LinearGradient(gradient: Gradient(stops: [
        .init(color: .white, location: 0.0),
        .init(color: .black, location: 0.5),
    ]), startPoint: .top, endPoint: .bottom)
    
    var detailGradient = LinearGradient(gradient: Gradient(stops: [
        .init(color: .white, location: 0.0),
        .init(color: .black, location: 1.0),
    ]), startPoint: .top, endPoint: .bottom)
    
    @ObservedObject var pvm: PokemonViewModel = PokemonViewModel()

    var body: some View {
        
        VStack(spacing: 0) {
            if let pokemonType = pvm.pokemonType {
                
                Text("\(pokemonType.name)")
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 42.0))
                    .fontWeight(.bold)
                    .background(.black)
                    .foregroundColor(Color("DragonColor"))
                    .textCase(.uppercase)
                
                Text("Pokemon")
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 42.0))
                    .fontWeight(.bold)
                    .background(.black)
                    .foregroundColor(Color("DragonColor"))
                    .textCase(.uppercase)
                
                NavigationStack {
                    ScrollView {
                        
                        ForEach(pokemonType.pokemon) { pokemon in
                            GeometryReader { geometry in
                                VStack {
                                    Spacer()
                                    HStack(alignment: .center) {
                                        
                                        NavigationLink(pokemon.pokemon.name, value: pokemon)
                                            .frame(maxWidth: .infinity)
                                            .textCase(.uppercase)
                                            .fontWeight(.bold)
                                            .background(gradient)
                                            .foregroundColor(Color("DragonColor"))
                                            .font(.system(size: 25.0))
                                            .containerShape(Capsule())
                                    }.navigationDestination(for: Pokemon.self) { pokemon in
                                        VStack(spacing: 20){
                                            Text("\(pokemon.pokemon.name)")
                                                .frame(maxWidth: .infinity)
                                                .font(.system(size: 40.0))
                                                .textCase(.uppercase)
                                                .foregroundColor(Color("DragonColor"))
                                            
                                            Text("Generation \(pokemon.slot)")
                                                .frame(maxWidth: .infinity)
                                                .font(.system(size: 36.0))
                                                .textCase(.uppercase)
                                                .foregroundColor(Color("DragonColor"))
                                        }
                                        .background(detailGradient)

                                    }
                                }
                            }
                            .padding()
                        }
                        
                        
                    }
                    .background(Color("DarkDragonColor"))
                }
                
            }
        }
        .onAppear {
            Task {
                do {
                    try await pvm.readJson()
                } catch let error {
                    print("JSON Error: \(error)")
                }
            }
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

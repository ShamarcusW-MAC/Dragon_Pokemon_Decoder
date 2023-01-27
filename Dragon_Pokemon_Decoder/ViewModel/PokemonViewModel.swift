//
//  PokemonViewModel.swift
//  Dragon_Pokemon_Decoder
//
//  Created by Sha'Marcus Walker on 1/24/23.
//

import Foundation

class PokemonViewModel: ObservableObject {
    
    @Published var pokemonType: PokemonType?
        
    lazy var decode: JSONDecoder = {
        JSONDecoder()
    }()
    
    func readJson() {
        if let jsonURL = Bundle.main.path(forResource: "SampleJSONDragon", ofType: "json") {
            do {                
                let jsonString =  try Data(contentsOf: URL(fileURLWithPath: jsonURL), options: .mappedIfSafe)
                        
                let jsonData = try decode.decode(PokemonType.self, from: jsonString)
                pokemonType = jsonData
            } catch let error {
                print("Parsing error: \(error)")
            }
        }
    }
}

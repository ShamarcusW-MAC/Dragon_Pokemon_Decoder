//
//  Pokemon.swift
//  Dragon_Pokemon_Decoder
//
//  Created by Sha'Marcus Walker on 1/24/23.
//

import Foundation

struct PokemonType: Decodable {
    
    let damage_relations: DamageRelations
    let game_indices: [GameIndices]
    let generation: Generation
    let id: Int
    let move_damage_class: Generation
    let moves: [Generation]
    let name: String
    let pokemon: [Pokemon]
}

struct DamageRelations: Decodable {
    let double_damage_from: [Generation]
    let double_damage_to: [Generation]
    let half_damage_from: [Generation]
    let half_damage_to: [Generation]
    let no_damage_from: [Generation]
    let no_damage_to: [Generation]
}

struct Generation: Decodable, Identifiable {
    let name: String
    let url: String
    var id: String {
        return name
    }
}

struct GameIndices: Decodable {
    let game_index: Int
    let generation: Generation
}

struct Pokemon: Decodable, Identifiable {
    let pokemon: Generation
    let slot: Int
    var id: String {
        return pokemon.name
    }
}

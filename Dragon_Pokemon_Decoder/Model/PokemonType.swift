//
//  Pokemon.swift
//  Dragon_Pokemon_Decoder
//
//  Created by Sha'Marcus Walker on 1/24/23.
//

import Foundation

struct PokemonType: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
        case gameIndices = "game_indices"
        case generation, id
        case moveDamageClass = "move_damage_class"
        case moves, name, pokemon
    }
    
    let damageRelations: DamageRelations
    let gameIndices: [GameIndices]
    let generation: Generation
    let id: Int
    let moveDamageClass: Generation
    let moves: [Generation]
    let name: String
    let pokemon: [Pokemon]
}

extension PokemonType: Hashable {
    
    var identifier: String {
        return UUID().uuidString
    }
    
    static func == (lhs: PokemonType, rhs: PokemonType) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

struct DamageRelations: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case doubleDamageTo = "double_damage_to"
        case halfDamageFrom = "half_damage_from"
        case halfDamageTo = "half_damage_to"
        case noDamageFrom = "no_damage_from"
        case noDamageTo = "no_damage_to"
    }
    
    let doubleDamageFrom: [Generation]
    let doubleDamageTo: [Generation]
    let halfDamageFrom: [Generation]
    let halfDamageTo: [Generation]
    let noDamageFrom: [Generation]
    let noDamageTo: [Generation]
}

struct Generation: Decodable, Identifiable {
    let name: String
    let url: String
    var id: String {
        return name
    }
}

struct GameIndices: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case generation
    }
    
    let gameIndex: Int
    let generation: Generation
}

struct Pokemon: Decodable, Identifiable {
    let pokemon: Generation
    let slot: Int
    var id: String {
        return pokemon.name
    }
}

extension Pokemon: Hashable {
    
    var identifier: String {
        return UUID().uuidString
    }
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

//
//  PokemonType.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/25/22.
//

import Foundation
import CloudKit



// MARK: - PokemonType
struct PokemonTypeModel : Codable, Identifiable {
    let damageRelations: TypeDamageRelations?
    let gameIndices: [TypeGameIndex]?
    let generation: TypeGeneration?
    let id: Int?
    let moveDamageClass: TypeGeneration?
    let moves: [TypeGeneration]?
    let name: String?
    let names: [TypeName]?
    let pokemon: [TypePokemon]?
    
    enum CodingKeys: String, CodingKey {
            case damageRelations = "damage_relations"
            case gameIndices = "game_indices"
            case generation, id
            case moveDamageClass = "move_damage_class"
            case moves, name, names
            case pokemon
        }
}

// MARK: - DamageRelations
struct TypeDamageRelations : Codable, Identifiable {
    let id = UUID()
    let doubleDamageFrom: [TypeGeneration]?
    let doubleDamageTo, halfDamageFrom: [TypeGeneration]?
    let halfDamageTo, noDamageFrom, noDamageTo: [TypeGeneration]?
    
    enum CodingKeys: String, CodingKey {
            case doubleDamageFrom = "double_damage_from"
            case doubleDamageTo = "double_damage_to"
            case halfDamageFrom = "half_damage_from"
            case halfDamageTo = "half_damage_to"
            case noDamageFrom = "no_damage_from"
            case noDamageTo = "no_damage_to"
        }
}

// MARK: - Generation
struct TypeGeneration : Codable, Identifiable {
    let id = UUID()
    let name: String?
    let url: String?
}

// MARK: - GameIndex
struct TypeGameIndex : Codable {
    let gameIndex: Int?
    let generation: TypeGeneration?
}



// MARK: - Name
struct TypeName : Codable {
    let language: TypeGeneration?
    let name: String?
}

// MARK: - Pokemon
struct TypePokemon : Codable {
    let pokemon: TypeGeneration?
    let slot: Int?
}

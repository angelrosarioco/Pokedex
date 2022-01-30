//
//  PokemonForm.swift
//  Pokedex
//
//  Created by Angel Rosario on 1/25/22.
//

import Foundation



// MARK: - PokemonForm
struct PokemonFormModel: Codable {
    let formName: String?
    let formNames: [String]?
    let formOrder, id: Int?
    let isBattleOnly, isDefault, isMega: Bool?
    let name: String?
    let names: [String]?
    let order: Int?
    let pokemon: FormName?
    let sprites: FormSprites?
    let types: [FormType]?
    let versionGroup: FormName?
    
    enum CodingKeys: String, CodingKey {
        case formName = "form_name"
        case formNames = "form_names"
        case formOrder = "form_order"
        case id
        case isBattleOnly = "is_battle_only"
        case isDefault = "is_default"
        case isMega = "is_mega"
        case name, names, order, pokemon, sprites, types
        case versionGroup = "version_group"
    }
    
    
        
}

// MARK: - Pokemon
struct FormName: Codable, Identifiable {
    var id = UUID()
    let name: String?
    let url: String?
    
    
}

// MARK: - Sprites
struct FormSprites: Codable {
    let backDefault, backFemale, backShiny, backShinyFemale: String?
    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

// MARK: - Form Type
struct FormType: Codable {
    let slot: Int?
    let type: FormName?
}

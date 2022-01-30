//
//  PokemonSpeciesModel.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/25/22.
//

import Foundation



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemonSpeciesModel = try? newJSONDecoder().decode(PokemonSpeciesModel.self, from: jsonData)

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemonSpeciesModel = try? newJSONDecoder().decode(PokemonSpeciesModel.self, from: jsonData)

import Foundation

// MARK: - PokemonSpeciesModel
struct PokemonSpeciesModel: Codable {
    let baseHappiness, captureRate: Int?
    let eggGroups: [EggGroups]?
    let evolutionChain: EvolutionChain?
    let evolvesFromSpecies: EvolvesFromSpecies?
    let flavorTextEntries: [FlavorTextEntry]?
    let formsSwitchable: Bool?
    let genderRate: Int?
    let genera: [Genus]?
    let growthRate :GrowthRate
    let habitat: Habitat?
    let hasGenderDifferences: Bool?
    let hatchCounter, id: Int?
    let isBaby, isLegendary, isMythical: Bool?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case baseHappiness = "base_happiness"
        case captureRate = "capture_rate"
        case eggGroups = "egg_groups"
        case evolutionChain = "evolution_chain"
        case evolvesFromSpecies = "evolves_from_species"
        case flavorTextEntries = "flavor_text_entries"
        case formsSwitchable = "forms_switchable"
        case genderRate = "gender_rate"
        case genera
        case growthRate = "growth_rate"
        case habitat
        case hasGenderDifferences = "has_gender_differences"
        case hatchCounter = "hatch_counter"
        case id
        case isBaby = "is_baby"
        case isLegendary = "is_legendary"
        case isMythical = "is_mythical"
        case name
    }
}

// MARK: - EvolvesFromSpecies
struct EvolvesFromSpecies: Codable {
    let name: String?
    let url: String?
}

// MARK: - GrowthRate
struct GrowthRate: Codable {
    let name: String?
    let url: String?
}

// MARK: - Habitat
struct Habitat: Codable {
    let name: String?
    let url: String?
}

// MARK: - EvolutionChain
struct EvolutionChain: Codable {
    let url: String?
}

// MARK: - EggGroups
struct EggGroups: Codable {
    let name: String?
    let url: String?
}
// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
    let flavorText: String?
    let language, version: EvolvesFromSpecies?

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language, version
    }
}

// MARK: - Genus
struct Genus: Codable {
    let genus: String?
    let language: EvolvesFromSpecies?
}

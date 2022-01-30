//
//  PokemonEvolution.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/29/22.
//

import Foundation

// MARK: - PokemonEvolution
struct PokemonEvolutionModel: Codable {
    let chain: Chain?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case chain, id
    }
}

// MARK: - Chain
struct Chain: Codable, Identifiable {
    let id = UUID()
    let evolutionDetails: [EvolutionDetail]?
    let evolvesTo: [Chain]?
    let isBaby: Bool?
    let species: Species?

    enum CodingKeys: String, CodingKey {
        case evolutionDetails = "evolution_details"
        case evolvesTo = "evolves_to"
        case isBaby = "is_baby"
        case species
    }
}

// MARK: - EvolutionDetail
struct EvolutionDetail: Codable {
    let gender: Int?
    let item: Species?
    let minHappiness: Int?
    let needsOverworldRain: Bool?
    let timeOfDay: String?
    let trigger: Species?
    let turnUpsideDown: Bool?

    enum CodingKeys: String, CodingKey {
        case gender
        case item
        case minHappiness = "min_happiness"
        case needsOverworldRain = "needs_overworld_rain"
        case timeOfDay = "time_of_day"
        case trigger
        case turnUpsideDown = "turn_upside_down"
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String?
    let url: String?
}

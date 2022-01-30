//
//  PokemonList.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/25/22.
//

import Foundation

/* PokemonList
 
 // MARK: - PokemonList
 struct PokemonList {
     let count: Int?
     let next: String?
     let previous: NSNull?
     let results: [Result]?
 }

 // MARK: - Result
 struct Result {
     let name: String?
     let url: String?
 }

*/



// MARK: - PokemonList
struct PokemonListModel: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable, Identifiable {
    let id = UUID()
    let name: String?
    let url: String?
}

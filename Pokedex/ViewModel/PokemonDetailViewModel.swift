//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/25/22.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    @Published var pokemon : PokemonModel?
    @Published var specie : PokemonSpeciesModel?
    @Published var type : PokemonTypeModel?
    @Published var evolution : PokemonEvolutionModel?
    
    func fetchDetail(pokemon: PokemonModel) {
        Task {
            try? await fetchEvolution(from: await fetchSpecie(from: pokemon)!)
            try? await fetchType(from: pokemon)
            
        }
    }
    func fetchEvolutionTask() {
        
    }
    /**
     FetchSepecie gathers information for the specific species of the pokemon.
     */
    func fetchSpecie(from pokemon: PokemonModel) async throws -> PokemonSpeciesModel? {
        
        let urlString = baseURL + speciesURL + "\(pokemon.id!)"
        guard let url = URL(string: urlString) else { return nil }
        
        let (data, response) = try await URLSession.shared.data(from: url)
            
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("specie")
            throw ErrorHandlers.invalidResponse
        }
        
        let specie = try JSONDecoder().decode(PokemonSpeciesModel.self, from: data)
    
        print(specie.flavorTextEntries?.filter { $0.language!.name! == "en"}.first!.flavorText!)
        DispatchQueue.main.async {
            self.specie = specie
        }
        return specie
            
    }
    
    func fetchType(from pokemon: PokemonModel) async throws {
        guard let url = URL(string: pokemon.types!.first!.type!.url!) else { return }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("type")
            throw ErrorHandlers.invalidResponse
        }
        let type = try JSONDecoder().decode(PokemonTypeModel.self, from: data)
        DispatchQueue.main.async {
            self.type = type
        }
    }
    
    func fetchEvolution(from specie: PokemonSpeciesModel ) async throws {
        
        guard let url = URL(string: specie.evolutionChain!.url!) else { return }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("evolution")
            throw ErrorHandlers.invalidResponse
        }
        let evolution = try JSONDecoder().decode(PokemonEvolutionModel.self, from: data)
        DispatchQueue.main.async {
            print("Profile: \(evolution.chain!.species!.url)")
            print("Image: \(imageUrl + evolution.chain!.species!.url!.getID() + imageExt)")
            self.evolution = evolution
        }
        
    }
    
    
}


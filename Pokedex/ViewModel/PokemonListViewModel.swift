//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/25/22.
//

import SwiftUI

class PokemonListViewModel: ObservableObject {
    @Published var results : [Result]?
    @Published var pokemons : [PokemonModel]?
    @Published var pokemon : PokemonModel?
    @Published var species : [PokemonSpeciesModel]?
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var i = 0
    func startUp() {
        Task {
            try? await fetchResult()
        }
    }
    
    func fetchPokemon(result: Result) {
        Task {
            try? await self.fetchPokemonFrom(result: result)
        }
    }
    
    func fetchResult() async throws -> [Result]? {
        DispatchQueue.main.async {
            self.results = []
        }
        
        let urlString = baseURL + "pokemon?offset=0&limit=900"
        guard let url = URL(string: urlString) else { return nil }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ErrorHandlers.invalidResponse
        }
        
        let pokemonList = try JSONDecoder().decode(PokemonListModel.self, from: data)
        
        DispatchQueue.main.async {
            self.results = pokemonList.results
        }
        return pokemonList.results
        
    }
    
    func fetchPokemonsFrom(result: Result) async throws {
        
        
        DispatchQueue.main.async {
            if self.pokemons == nil {
                self.pokemons = []
            }
        }
        
        guard let name = result.name else {return}
        let urlString = baseURL + pokemonURL + name
        guard let url = URL(string: urlString) else { return }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ErrorHandlers.invalidResponse
        }
        
        let pokemon = try JSONDecoder().decode(PokemonModel.self, from: data)
        
        DispatchQueue.main.async {
            
            self.pokemons!.append(pokemon)
            print(self.pokemons!.count)
        }
    }
    
    func fetchPokemonFrom(result: Result) async throws {
        
        guard let name = result.name else {return}
        let urlString = baseURL + pokemonURL + name
        guard let url = URL(string: urlString) else { return }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ErrorHandlers.invalidResponse
        }
        
        let pokemon = try JSONDecoder().decode(PokemonModel.self, from: data)
        
        DispatchQueue.main.async {
            self.pokemon = pokemon
        }
    }
    
    func fetchResults() {
        self.results = []
        
        
        
        
        
        
        let urlString = baseURL + "pokemon?offset=0&limit=900"
        guard let url = URL(string: urlString) else { return }
        
        
        
        
        
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
                print("error1")
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
                print("error2")
            guard let data = data else {
                return
            }
            
            
                print("error3")
            do {
                let pokemonList = try JSONDecoder().decode(PokemonListModel.self, from: data)
                
                DispatchQueue.main.async {
                    
                        print("error3a")
                    self.results = pokemonList.results
                    
                }
            } catch let error {
                
                print(error.localizedDescription)
            }
            
            
        }
        
        dataTask.resume()
    }
    
    func fetchPokemons(id: String) {
        if self.pokemons == nil {
            self.pokemons = []
        }
        
        let urlString = baseURL + pokemonURL + id
        guard let url = URL(string: urlString) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            print("success1")
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            print("success2")
            guard let data = data else {
                return
            }
            print("success3")
            do {
                let pokemon = try JSONDecoder().decode(PokemonModel.self, from: data)
                
                DispatchQueue.main.async {
                    print("success4")
                    self.pokemons?.append(pokemon)
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
            
            
            
            
            
        }
        
        dataTask.resume()
    }
    
}

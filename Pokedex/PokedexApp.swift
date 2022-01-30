//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Angel Rosario on 12/5/21.
//

import SwiftUI

@main
struct PokedexApp: App {

    @ObservedObject var plvm = PokemonListViewModel()
    
    
    
    var body: some Scene {
        WindowGroup {
            
            MainListView()
                .environmentObject(plvm)
                .onAppear {
                    plvm.startUp()
                }
            
        }
        
    }
                            
    
}

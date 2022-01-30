//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/25/22.
//

import SwiftUI



/**
 
 */
struct MainListView: View {
    
    @EnvironmentObject var listViewModel : PokemonListViewModel
    @State var text = ""
    
    
    var body: some View {
        NavigationView {
            
            VStack (spacing: 0) {
                
                SearchBar(text: $text)
                
                if listViewModel.results != nil {
                    if text != "" {
                        if listViewModel.results!.filter {$0.name!.lowercased().contains(self.text.lowercased())}.sorted(by: {Int($0.url!.getID())! < Int($1.url!.getID())!}).isEmpty {
                            
                            NoColumn(text: text)
                            
                        } else {
                              
                            ColumnView(results: listViewModel.results!, text: $text)
                                
                        }
                    } else {
                        
                        ColumnView(results: listViewModel.results!.sorted {Int($0.url!.getID())! < Int($1.url!.getID())!}, text: $text)
                        
                    }
                }
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("mainBackground"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ZStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                    HStack {
                        // Buttons

                    }
                    .padding(.horizontal, 4)
                }
            }
            
        }
    }
    
    
}


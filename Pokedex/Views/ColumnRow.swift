//
//  ColumnRow.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/30/22.
//

import SwiftUI

struct ColumnRow: View {
    
    let result : Result
    @ObservedObject var cellViewModel = PokemonListViewModel()
    
    @State var image = UIImage()
    
    var body: some View {
        
        ZStack {
            if cellViewModel.pokemon != nil {
                NavigationLink {
                    if cellViewModel.pokemon!.name == result.name {
                        DetailView(pokemon: cellViewModel.pokemon!)
                            .navigationBarBackButtonHidden(true)
                    }
                } label: {
                    VStack (alignment: .leading) {
                        Text("\(result.name!.capitalized.makeString())")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 4)
                            .padding(.leading)
                        
                        
                        HStack {
                            Text("\(cellViewModel.pokemon!.types!.first!.type!.name!.capitalized)")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.white.opacity(0.25))
                                )
                                .frame(width: 100, height: 24)
                            
                            OnlineImage(urlString: "\(imageUrl + result.url!.getID() + imageExt)")
                                .scaledToFit()
                                .frame(width: 68, height: 68)
                                .padding(.bottom, 4)
                                .padding(.trailing)
                            
                        }
                    }
                    .background(cellViewModel.pokemon != nil ? Color("\(cellViewModel.pokemon!.types!.first!.type!.name!)Background") : .white)
                    .cornerRadius(12)
                }

                
            }
                
        }
        .shadow(color: cellViewModel.pokemon != nil ? Color("\(cellViewModel.pokemon!.types!.first!.type!.name!)Background") : .black, radius: 3, x: 0, y: 0)
        .padding()
        .onAppear {
            if cellViewModel.pokemon == nil || cellViewModel.pokemon!.name! != result.name! {
                
                cellViewModel.fetchPokemon(result: result)
                
            }
        }
        
    }
    
    
    
}


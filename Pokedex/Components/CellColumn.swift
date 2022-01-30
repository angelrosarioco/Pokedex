//
//  Cell.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/29/22.
//

import SwiftUI

struct CellColumn: View {
    
    let pokemon : PokemonModel
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                HStack {
                    Text("\(pokemon.name!.capitalized.makeString())")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                HStack {
                    Text("\(pokemon.types!.first!.type!.name!.capitalized.makeString() )")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    OnlineImage(urlString: pokemon.sprites!.other!.officialArtwork!.frontDefault!)
                        .frame(width: 68, height: 68)
                        .shadow(radius: 3)
                        .padding([.bottom, .trailing], 4)
                }
            }
            .background(Color("\(pokemon.types!.first!.type!.name!)Background"))
            .cornerRadius(10)
            .shadow(color: Color("\(pokemon.types!.first!.type!.name!)Background"), radius: 4, x: 0, y: 0)
        }
    }
}

//struct Cell_Previews: PreviewProvider {
//    static var previews: some View {
//        Cell()
//    }
//}

//
//  SectionType.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/27/22.
//

import SwiftUI

struct TypeSection: View {
    
    let species : [PokemonType]
    
    var body: some View {
        HStack {
            ForEach(species) { specie in
                Text("\(specie.type!.name ?? "")")
                    .font(.headline)
                    .foregroundColor(Color("\(specie.type!.name ?? "")Foreground"))
                    .padding(8)
                
                    .background(Capsule().fill(Color("\(specie.type!.name ?? "")Background")).shadow(color: .black.opacity(1), radius: 1, x: 0, y: 0))
                
                
            }
            Spacer()
        }
        .padding()
    }
}

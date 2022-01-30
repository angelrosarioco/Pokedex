//
//  SearchBar.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/25/22.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: self.$text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                
            
            
            if text != "" {
                Button {
                        
                    self.text = ""
                    
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.body)
                        .foregroundColor(Color.black)
                }

                
            }
        }
        .frame(height: 44)
        .padding()
    }
}

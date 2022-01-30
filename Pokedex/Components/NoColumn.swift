//
//  NoColumn.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/29/22.
//

import SwiftUI

struct NoColumn: View {
    let text : String
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                Text("That's interesting, it appears that \(text) is not in how database. Try Again.")
                .font(.system(.headline, design: .serif))
                .frame(width: 350)
            }
            Image("professor1")
                .resizable()
                .scaledToFit()
                .frame(height: 350)
                .padding()
                .shadow(radius: 4)
            
            
            Spacer()
        }
        .frame(width: screen.width, height: screen.height)
        .background(Color.white)
    }
}

//struct NoColumn_Previews: PreviewProvider {
//    static var previews: some View {
//        NoColumn()
//    }
//}

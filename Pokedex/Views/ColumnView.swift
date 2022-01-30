//
//  ColumnView.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/29/22.
//

import SwiftUI

struct ColumnView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @EnvironmentObject var listViewModel : PokemonListViewModel
    
    let results : [Result]
    
    @Binding var text : String
    
    let timer = Timer.publish(every: 1,on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                
                if listViewModel.results!.filter {$0.name!.lowercased().contains(self.text.lowercased())}.sorted(by: {Int($0.url!.getID())! < Int($1.url!.getID())!}).isEmpty {
                    ForEach(listViewModel.results!.sorted {Int($0.url!.getID())! < Int($1.url!.getID())!}) {result in
                        ColumnRow(result: result)
                    }
                } else {
                    ForEach(listViewModel.results!.filter {$0.name!.lowercased().contains(self.text.lowercased())}.sorted(by: {Int($0.url!.getID())! < Int($1.url!.getID())!})) {result in
                        ColumnRow(result: result)
                    }
                }
                
                
                
                
            }
        }
        .background(Color.white)
        
    }
}



//    if listViewModel.results != nil {
//        if text != "" {
//            if listViewModel.results!.filter {text.prefix(1).first!.isNumber ? $0.url!.getID().contains(self.text.lowercased()) : $0.name!.contains(self.text.lowercased())}.sorted(by: {$0.name! < $1.name!}).isEmpty {
//                NoColumn(text: text)
//            } else {
//
//                LazyVGrid(columns: columns) {
//                    ForEach(listViewModel.results!.filter {text.prefix(1).first!.isNumber ? $0.url!.getID().contains(self.text.lowercased()) : $0.name!.contains(self.text.lowercased())}.sorted(by: {Int($0.url!.getID())! < Int($1.url!.getID())!})) {result in
//
//                        ColumnRow(result: result)
//
//                    }
//                }
//            }
//        } else {
//
//        }
//    }

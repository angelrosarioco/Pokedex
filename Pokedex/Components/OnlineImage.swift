//
//  OnlineImage.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/28/22.
//

import SwiftUI

struct OnlineImage: View {
    let urlString : String?
    @State var image : UIImage?
    
    var body: some View {
        Image(uiImage: image ?? UIImage())
            .resizable()
            .scaledToFit()
            .onAppear {
                fetchImage(urlString: urlString!)
            }
        
    }
    func fetchImage(urlString: String) {
        Task {
            try? await download(urlString: urlString)
        }
    }
    
    func download(urlString: String) async throws {
        guard let url = URL(string: urlString) else { return }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        self.image = UIImage(data: data)
    }
}

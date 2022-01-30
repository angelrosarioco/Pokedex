//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Daniela Rosario on 12/5/21.
//

import SwiftUI
import AVFoundation

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var pokemonListViewModel : PokemonListViewModel
    @ObservedObject var detailViewModel = PokemonDetailViewModel()
    
    let synthesizer = AVSpeechSynthesizer()
    let pokemon : PokemonModel
    
    @State var isKg = false
    

    var body: some View {
        VStack (alignment: .leading) {
            
                    
                        ScrollView {
                            VStack (alignment: .leading) {
                                HStack {
                                    OnlineImage(urlString: pokemon.sprites!.other!.officialArtwork!.frontDefault!)
                                        .scaledToFit()
                                        .shadow(radius: 4)
                                        .padding()
                                        .frame(width: screen.width * 0.40, height: screen.width * 0.40)
                                    HStack {
                                        VStack (alignment: .leading, spacing: 0) {
                                            HStack {
                                                Text("# \(pokemon.id!)")
                                            }
                                            Text("Height:")
                                                .fontWeight(.semibold)
                                            Text("\(pokemon.height!.convertIntoMetric().convertIntoFeet())")
                                            
                                            Text("Weight")
                                                .fontWeight(.semibold)
                                            Text("\(pokemon.weight!.convertIntoMetric().convertLbsFrom()) lbs")
                                            
                                        }
                                        
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 4)
                                .padding()
                                
                                
                                HStack {
                                    VStack (alignment:.leading, spacing: 8) {
                                        Text("Type")
                                            .fontWeight(.semibold)
                                        HStack {
                                            ForEach(pokemon.types!) {type in
                                                Image("\(type.type!.name!)")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width:33, height: 33)
                                                    .shadow(radius: 3)
                                            }
                                        }
                                    }
                                    Spacer()
                                    
                                    if detailViewModel.type != nil {
                                        VStack (alignment:.leading, spacing: 8) {
                                            Text("Weaknesses")
                                                .fontWeight(.semibold)
                                            HStack {
                                                
                                                ForEach(detailViewModel.type!.damageRelations!.doubleDamageFrom!) { weakness in
                                                    Image("\(weakness.name!)")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width:33, height: 33)
                                                        .shadow(radius: 3)
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 4)
                                .padding()
                                
                                
                                if detailViewModel.specie != nil {
                                    HStack {
                                        Text("\(detailViewModel.specie!.flavorTextEntries!.filter { $0.language!.name! == "en"}.first!.flavorText!.makeString())")
                                            .frame(maxWidth: .infinity)
                                            .multilineTextAlignment(.center)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 4)
                                    .padding()
                                }
                                
                                
                                if detailViewModel.evolution != nil {
                                    ScrollView(.horizontal) {
                                        HStack () {
                                            ScrollView {
                                                OnlineImage(urlString: "\(imageUrl + detailViewModel.evolution!.chain!.species!.url!.getID() + imageExt)")
                                                    .scaledToFit()
                                                    .frame(width: 150, height: 150)
                                                Text("\(detailViewModel.evolution!.chain!.species!.name!.capitalized.makeString())")
                                            }
                                            
                                            if detailViewModel.evolution!.chain!.evolvesTo != nil {
                                                Image(systemName: "chevron.right")
                                                    .font(.title2)
                                                ScrollView {
                                                    ForEach(detailViewModel.evolution!.chain!.evolvesTo!) { evolveTo in
                                                        OnlineImage(urlString: "\(imageUrl + evolveTo.species!.url!.getID() + imageExt)")
                                                            .scaledToFit()
                                                            .frame(width: 150, height: 150)
                                                        Text("\(evolveTo.species!.name!.capitalized.makeString())")
                                                    }
                                                }
                                                
                                                ForEach(detailViewModel.evolution!.chain!.evolvesTo!) { evolveTo in
                                                    
                                                    if evolveTo.evolvesTo!.first?.evolvesTo != nil {
                                                        Image(systemName: "chevron.right")
                                                            .font(.title2)
                                                        ScrollView {
                                                            ForEach(evolveTo.evolvesTo!) { evolveTo in
                                                                OnlineImage(urlString: "\(imageUrl + evolveTo.species!.url!.getID() + imageExt)")
                                                                    .scaledToFit()
                                                                    .frame(width: 150, height: 150)
                                                                Text("\(evolveTo.species!.name!.capitalized.makeString())")
                                                            }
                                                        }
                                                    }
                                                    
                                                }
                                            }
                                            
                                            
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 4)
                                    .padding()
                                    
                                }
                                
                                
                            }
                            
                            
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                        
                        .background(LinearGradient(colors: detailViewModel.type != nil ? [Color("\(detailViewModel.type!.name!)Background"), Color("\(detailViewModel.type!.name!)Background").opacity(0.75), .white] : [.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                        
            
                
            
        
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                detailViewModel.fetchDetail(pokemon: pokemon)
            }
            
        }
        .toolbar {
            ZStack {
                Text("\(pokemon.name!.capitalized)")
                    .font(.headline)
                HStack {
                    // Buttons
                    
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .padding()
                            .onTapGesture {
                                dismiss.callAsFunction()
                            }
                    
                    Spacer()
                    
                    Button {
                        speak()
                    } label: {
                        Image(systemName: "speaker.wave.3")
                            .font(.title3)
                            .foregroundColor(.black)
                    }

                }
            }
            .padding(.horizontal, 4)
            .frame(width: screen.width)
        }
        
    }
    
    func speak() {
        
        let text = "\(pokemon.name!), a \(pokemon.types!.first!.type!.name!) pokemon. \(detailViewModel.specie!.flavorTextEntries!.filter { $0.language!.name! == "en"}.first!.flavorText!.makeString())"
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice.speechVoices().filter({$0.name == "Fred"}).first
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1.5
        

        synthesizer.speak(utterance)
    }
}


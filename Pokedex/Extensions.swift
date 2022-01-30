//
//  Extensions.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/28/22.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        if UIApplication.shared.isFirstResponder {
            if UIApplication.shared.canResignFirstResponder {
                UIApplication.shared.resignFirstResponder()
            }
        }
    }
}

extension Int {
    
    func convertIntoMetric() -> Double {
        return Double(self / 10)
    }
    
    
    
}

extension Double {
    func convertLbsFrom() -> String {
        print("To lbs: \(self)")
        return String(format: "%.2f", self * mass)
    }
    
    func convertIntoFeet() -> String {
        print("To Feet: \(self)")
        return String(format: "%.2f", self * length)
    }
}



extension String {
    
    func getID() -> String{
        return self.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon", with: "").replacingOccurrences(of: "-species", with: "").replacingOccurrences(of: "/", with: "")
    }
    
    
    
    
    
    func makeString() -> String {
        return self.capitalized.replacingOccurrences(of: "-", with: " ").replacingOccurrences(of: " \n", with: " ").replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: "\n ", with: " ").replacingOccurrences(of: "\u{0C}", with: " ")
    }
    
    
    
    
    func isID() -> Bool {
        for character in self.prefix(1) {
            return character.isNumber
        }
        
        return false
    }
}


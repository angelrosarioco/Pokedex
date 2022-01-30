//
//  ErrorHandlers.swift
//  Pokedex
//
//  Created by Daniela Rosario on 1/29/22.
//

import Foundation

enum ErrorHandlers : Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String  {
        switch self {
        case .apiError : return "Failed to fetch data"
        case .invalidEndpoint : return "Invalid Endpoint"
        case .invalidResponse : return "Invalid Response"
        case .noData : return "No Data"
        case .serializationError : return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey : localizedDescription]
    }
}

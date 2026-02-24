//
//  NetworkManager.swift
//  DogBreedsSwiftUI
//
//  Created by Surya Rayala on 2/23/26.
//

import Foundation

// MARK: - Network Service Protocol

protocol NetworkServiceProtocol {
    func fetchDogBreeds() async -> DogModel?
    func fetchDogImage(breedName: String) async -> Data?
}

// MARK: - Network Manager Implementation

class NetworkManager: NetworkServiceProtocol {
    
    private let urlSession: URLSession
    private let decoder: JSONDecoder
    
    init(urlSession: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.urlSession = urlSession
        self.decoder = decoder
    }
    
    func fetchDogBreeds() async -> DogModel? {
        guard let url = URL(string: Server.dogDataURL.rawValue) else {
            print("Error: Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let result = try decoder.decode(DogModel.self, from: data)
            
            return result
        }
        catch {
            print("Error: \(error)")
            return nil
        }
    }
    
    func fetchDogImage(breedName: String) async -> Data? {
        let urlString = Server.dogImageURLPart1.rawValue + breedName + Server.dogImageURLPart2.rawValue
        
        guard let url = URL(string: urlString) else {
            print("Error: Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let result = try decoder.decode(DogImageResponse.self, from: data)
            
            guard let imageURL = URL(string: result.message ?? "") else {
                print("Error: Invalid image URL")
                return nil
            }
            
            let (imageData, _) = try await urlSession.data(from: imageURL)
            return imageData
        }
        catch {
            print("Error: \(error)")
            return nil
        }
    }
}

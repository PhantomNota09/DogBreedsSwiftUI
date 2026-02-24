//
//  DogListViewModel.swift
//  DogBreedsSwiftUI
//
//  Created by Surya Rayala on 2/23/26.
//

import Foundation

// MARK: - Dog List View Model Protocol

protocol DogListViewModelProtocol: AnyObject {

    func fetchBreeds() async
}

// MARK: - Dog List View Model Implementation

@Observable
class DogListViewModel: DogListViewModelProtocol {
    
    var breeds: [String: [String]] = [:]
    var breedNames: [String] = []
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkManager()) {
        self.networkService = networkService
    }
    
    func fetchBreeds() async {
        if let dogModel = await networkService.fetchDogBreeds() {
            if let message = dogModel.message {
                breeds = message
                breedNames = message.keys.sorted()
            }
        }
    }
}

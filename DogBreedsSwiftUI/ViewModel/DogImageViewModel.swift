//
//  DogImageViewModel.swift
//  DogBreedsSwiftUI
//
//  Created by Surya Rayala on 2/24/26.
//

import Foundation
import SwiftUI

// MARK: - Dog Image View Model Protocol

protocol DogImageViewModelProtocol: AnyObject {
    func loadImage(for breedName: String) async
}

// MARK: - Dog Image View Model Implementation

@Observable
class DogImageViewModel: DogImageViewModelProtocol {
    
    var imageData: Data?
    var isLoading = false
    var errorMessage: String?
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkManager()) {
        self.networkService = networkService
    }
    
    func loadImage(for breedName: String) async {
        isLoading = true
        errorMessage = nil
        imageData = nil
        
        if let data = await networkService.fetchDogImage(breedName: breedName) {
            imageData = data
        } else {
            errorMessage = "Failed to load image"
        }
        
        isLoading = false
    }
}

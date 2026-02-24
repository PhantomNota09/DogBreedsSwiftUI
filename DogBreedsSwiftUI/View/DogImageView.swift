//
//  DogImageView.swift
//  DogBreedsSwiftUI
//
//  Created by Surya Rayala on 2/23/26.
//

import SwiftUI

struct DogImageView: View {
    
    let breedName: String
    @State private var viewModel: DogImageViewModel
    
    init(breedName: String, viewModel: DogImageViewModel = DogImageViewModel()) {
        self.breedName = breedName
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let imageData = viewModel.imageData,
                      let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                Text(viewModel.errorMessage ?? "Failed to load image")
                    .foregroundStyle(.red)
            }
        }
        .navigationTitle(breedName.capitalized)
        .task {
            await viewModel.loadImage(for: breedName)
        }
    }
}

#Preview {
    NavigationStack {
        DogImageView(breedName: "husky")
    }
}


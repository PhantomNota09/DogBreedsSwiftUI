//
//  DogListView.swift
//  DogBreedsSwiftUI
//
//  Created by Surya Rayala on 2/23/26.
//


import SwiftUI

struct DogListView: View {
    
    @State private var viewModel = DogListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.breedNames, id: \.self) { breedName in
                    NavigationLink(destination: DogImageView(breedName: breedName)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(breedName.capitalized)
                                .font(.headline)
                            
                            if let subBreeds = viewModel.breeds[breedName], !subBreeds.isEmpty {
                                Text("Sub-breeds: \(subBreeds.joined(separator: ", "))")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Dog Breeds")
            .task {
                await viewModel.fetchBreeds()
            }
        }
    }
}

#Preview {
    DogListView()
}

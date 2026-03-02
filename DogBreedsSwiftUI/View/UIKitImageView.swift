//
//  UIKitImageView.swift
//  DogBreedsSwiftUI
//
//  Created by Surya Rayala on 3/2/26.
//

import SwiftUI
import UIKit

struct UIKitImageView: UIViewRepresentable {
    
    let breedName: String
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        
        // Load image
        Task {
            let viewModel = DogImageViewModel()
            await viewModel.loadImage(for: breedName)
            
            if let imageData = viewModel.imageData {
                imageView.image = UIImage(data: imageData)
            }
        }
        
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        
    }
}

/*
 What this does:
 • UIViewRepresentable is the bridge between UIKit and SwiftUI
 • makeUIView creates the UIKit view (called once)
 • updateUIView updates it when your data changes (called whenever SwiftUI needs to refresh)
*/

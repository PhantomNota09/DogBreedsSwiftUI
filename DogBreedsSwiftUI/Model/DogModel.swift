//
//  DogModel.swift
//  DogBreedsSwiftUI
//
//  Created by Surya Rayala on 2/23/26.
//

import Foundation

struct DogModel: Codable {
    let message: [String: [String]]?
}

struct DogImageResponse: Codable {
    let message: String?
    let status: String?
}

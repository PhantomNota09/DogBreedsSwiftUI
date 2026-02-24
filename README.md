# Dog Breeds SwiftUI

A simple iOS app that displays a list of dog breeds and shows random images for each breed using the [Dog API](https://dog.ceo/dog-api/).

## Features

- Browse a complete list of dog breeds
- View sub-breeds for each main breed
- Display random images of selected breeds
- Built with SwiftUI and Swift Concurrency

## Demo
![Simulator Screen Recording - iPhone 17 Pro - 2026-02-24 at 08 52 51](https://github.com/user-attachments/assets/f10ff40e-bbb9-4453-a9a1-b56cf433142d)

## How It Works

The app uses the [Dog CEO API](https://dog.ceo/dog-api/) to:
1. Fetch all available dog breeds and their sub-breeds
2. Load random images for each breed when selected

## Architecture

- **SwiftUI** for the user interface
- **MVVM pattern** with ViewModels for business logic
- **Swift Concurrency** (async/await) for network requests
- **URLSession** for API communication

## Usage

1. Launch the app to see a list of all dog breeds
2. Tap on any breed to view a random image
3. Each breed shows its available sub-breeds in gray text

## API Reference

This app uses the free Dog CEO API:
- List all breeds: `https://dog.ceo/api/breeds/list/all`
- Random breed image: `https://dog.ceo/api/breed/{breed}/images/random`



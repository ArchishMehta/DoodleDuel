//
//  Misc.swift
//  DoodleDuel
//
//  Created by Archish Mehta on 2025-01-07.
//

import Foundation

// list of objects that user may draw
let everydayObjects = [
    "chair",
    "pen",
    "laptop",
    "water bottle",
    "smartphone",
    "backpack",
    "notebook",
    "watch",
    "glasses",
    "keys",
    "headphones",
    "wallet",
    "mug",
    "lamp",
    "shoes",
    "umbrella",
    "book",
    "scissors",
    "candle",
    "remote control",
    "television",
    "mirror",
    "towel",
    "spoon",
    "fork",
    "knife",
    "plate",
    "pillow",
    "blanket",
    "clock",
    "toothbrush",
    "soap",
    "hairbrush",
    "bag",
    "bicycle",
    "camera",
    "fan",
    "refrigerator",
    "oven",
    "microwave",
    "vacuum cleaner"
]

// cases for logging into Game Center
enum PlayerAuthState: String {
    // if the account is fine and is logging in
    case authenticating = "Logging in to Game Center ..."
    // user needs to log in
    case unauthenticated = "Please sign in to the Game Center to play."
    
    // user runs into an error logging in
    case error = "There was an error logging into Game Center."
    // parental restriction
    case restricted = "You're not allowed to play multiplayer games!"
}

// structure for all of the past guesses
// xcode needs it to be identifiable
struct PastGuess: Identifiable {
    let id = UUID()
    var message: String
    var correct: Bool
}

// have 100 seconds to guess + draw
let maxTimeRemaining = 100

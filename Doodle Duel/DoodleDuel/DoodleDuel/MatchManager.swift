//
//  MatchManager.swift
//  DoodleDuel
//
//  Created by Archish Mehta on 2025-01-07.
//

import Foundation

//swiftui is able to observe the object and update the view manually
class MatchManager: ObservableObject {
    // controls which screen to currently show
    @Published var inGame = false
    @Published var isGameOver = false
    //published means swify ui will be updating it
    @Published var authenticationState = PlayerAuthState.authenticating
    
    
    @Published var currentlyDrawing = false
    // current item to draw
    @Published var drawPrompt = ""
    // list of past guesses
    @Published var pastGuesses = [PastGuess]()
    // the score
    @Published var score = 0
    
    @Published var remainingTime = maxTimeRemaining
}

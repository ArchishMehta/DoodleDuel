//
//  GameOverView.swift
//  DoodleDuel
//
//  Created by Archish Mehta on 2025-01-07.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var matchManager: MatchManager
    
    var body: some View {
        VStack {
            Spacer()
            
            // Display the game over image with padding and scaling
            Image("gameOver")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 70)
                .padding(.vertical)
            
            // Display the score
            Text("Score: \(matchManager.score)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color("primaryYellow"))
            
            Spacer()
            
            // Menu button with dynamic styling
            Button {
                // TODO: Go back to menu
            } label: {
                Text("Menu")
                    .foregroundColor(Color("menuBtn"))
                    .brightness(-0.4)
                    .font(.largeTitle)
                    .bold()
            }
            .disabled(matchManager.authenticationState != .unauthenticated || matchManager.inGame)
            .padding()
            .padding(.horizontal, 50)
            .background(
                Capsule(style: .circular)
                    .fill(Color("menuBtn"))
            )
            
            Spacer()
        }
        .background(
            Image("gameOverBg")
                .resizable()
                .scaledToFill()
        )
        .ignoresSafeArea()
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(matchManager: MatchManager())
    }
}

//
//  GameView.swift
//  DoodleDuel
//
//  Created by Archish Mehta on 2025-01-08.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var matchManager: MatchManager
    @State private var drawingGuess = ""
    @State private var eraserEnabled = false
    
    func makeGuess() {
        //TODO: guess
    }
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image(matchManager.currentlyDrawing ? "drawerBg" :"guessBg" )
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .scaleEffect(1.1)
                
                VStack {
                    topBar
                    
                    ZStack {
                        DrawingView(matchManager: matchManager, eraserEnabled: $eraserEnabled)
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(
                                RoundedRectangle (cornerRadius: 10)
                                    .stroke(.black, lineWidth: 10)
                            
                            )
                        
                        VStack {
                            HStack {
                                Spacer()
                                if matchManager.currentlyDrawing {
                                    Button {
                                        eraserEnabled.toggle()
                                    } label: {
                                        Image(systemName: eraserEnabled ? "eraser.fill" : "eraser")
                                            .font(.title)
                                            .foregroundColor(Color("primaryPurple"))
                                            .padding(.top, 10)
                                         
                                        
                                    }
                                }
                            }
                            
                            Spacer()
                            
                        }
                        .padding()
                    }
                    //maybe should be pastguesses
                    pastGuess
                }
                .padding(.horizontal, 30)
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
            VStack {
                Spacer()
                
                promptGroup
                
            }
            .ignoresSafeArea(.container)
        }
    }
    var topBar: some View {
        ZStack {
            HStack {
                Button {
                    // TODO: Disconnect from game
                } label: {
                    Image(systemName: "arrowshape.turn.up.left.circle.fill")
                        .font(.largeTitle)
                        .tint(Color(matchManager.currentlyDrawing ? "primaryYellow" : "primaryPurple"))
                }
                Spacer()
                
                Label("\(matchManager.remainingTime)", systemImage: "clock.fill")
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color(matchManager.currentlyDrawing ? "primaryYellow" : "primaryPurple"))
            }
        }
        .padding(.vertical, 15)
    }
    
    var pastGuess: some View {
        ScrollView {
            ForEach(matchManager.pastGuesses) { guess in
                HStack {
                    Text(guess.message)
                        .font(.title2)
                        .bold(guess.correct)
                    if guess.correct {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(matchManager.currentlyDrawing ? Color(red: 0.808, green: 0.345, blue: 0.776) : Color(red:0.243, green: 0.733, blue:0.745)
                            )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 1)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background((matchManager.currentlyDrawing ? Color(red:0.243, green: 0.733, blue:0.745) :
        Color("primaryYellow")
                    
        )
        .brightness(-0.2)
        .opacity(0.5)
    )
    .cornerRadius(20)
    .padding(.vertical)
    .padding(.bottom, 130)
    }
    var promptGroup: some View {
        VStack {
            if matchManager.currentlyDrawing {
                Label("DRAW:", systemImage: "exclamationmark.bubble.fill")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text(matchManager.drawPrompt.uppercased())
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(Color("primaryYellow"))
            } else {
                HStack {
                    Label("GUESS THE DRAWING:", systemImage: "exclamationmark.bubble.fill")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("primaryPurple"))
                    Spacer()
                }
                HStack {
                    TextField("Type your guess", text: $drawingGuess)
                        .padding()
                        .background(
                            Capsule(style: .circular)
                                .fill(.white)
                        )
                        .onSubmit(makeGuess)
                    
                    Button{
                        makeGuess()
                    } label: {
                        Image(systemName: "chevron.right.circle.fill")
                            .renderingMode(.original)
                            .foregroundColor(Color("primaryPurple"))
                            .font(.system(size: 50))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding([.horizontal, .bottom], 30)
        .padding(.vertical)
        .background((matchManager.currentlyDrawing ? Color(red:0.243, green: 0.733, blue:0.745) : Color("primaryYellow")
            )
            .opacity(0.5)
            .brightness(-0.2)
        )
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(matchManager: MatchManager())
    }
}

//
//  ContentView.swift
//  tic-tac-toe
//
//  Created by Rafa on 5/11/23.
//

import SwiftUI

struct StartView: View {
    
    
    // Declares state variables to hold the game type, player names, and focus state
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus:Bool
    @State private var startGame = false
    
    var body: some View {
        VStack {
            // A Picker object to let the user select the game type
            Picker("Select Game", selection: $gameType){
                Text("Select Game Type").tag(GameType.undetermined)
                Text("Two sharing device").tag(GameType.single)
                Text("Challange your device").tag(GameType.bot)
                Text("Challang a friend").tag(GameType.peer)
            }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))            
            // Displays the game type description
            Text(gameType.description)
                .padding()
            
            // Displays input fields based on the game type

            VStack{
                
                switch gameType {
                case .single:
                    VStack{
                        TextField("Your Name", text: $yourName)
                        TextField("Opponent Name", text: $opponentName)
                    }
                case .bot:
                    TextField("Your Name",text:$yourName)
                case .peer:
                    EmptyView()
                case .undetermined:
                    EmptyView()
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            //Add button if not playing agianst peer
            if gameType != .peer {
                Button("Start Game"){
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undetermined ||
                    gameType == .bot && yourName.isEmpty ||
                    gameType == .single && (yourName.isEmpty || opponentName.isEmpty)
                )
                Image("LaunchScreen")
            }
            Spacer()
        }
        .padding()
        //Adds navigation title to VStack
        .navigationTitle("Tic Tac Toe")
        // Fullscreen cover when the user taps the "Start Game" button

        .fullScreenCover(isPresented: $startGame){
            GameView()
        }
        // Puts the view in a navigation stack

        .inNavigationStack()
    }
    
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

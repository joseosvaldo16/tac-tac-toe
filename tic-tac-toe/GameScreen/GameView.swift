//
//  GameView.swift
//  tic-tac-toe
//
//  Created by Rafa on 5/11/23.
//

import SwiftUI

struct GameView: View {
    
    // Access the `dismiss` method provided by the environment
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Hello World")
        }
        
        // Add a toolbar to the view
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                // Call the `dismiss` method to dismiss the view
                Button("End Game"){
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
        // Set the navigation title for the view
        .navigationTitle("Tic Tac Toe")
        .inNavigationStack()
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

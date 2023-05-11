//
//  ViewModifiers.swift
//  tic-tac-toe
//
//  Created by Rafa on 5/11/23.
//
// A collection of custom SwiftUI view modifiers


import SwiftUI

struct NavStackContainer: ViewModifier {
    
    func body(content: Content) -> some View {
        
        // Use the new NavigationStack view if available on iOS 16 and later
        if #available(iOS 16, *){
            NavigationStack {
                content
            }
        } else {
            // Otherwise, fall back to using a NavigationView with the stack navigation view style

            NavigationView {
                content
            }
            
            .navigationViewStyle(.stack)// Set the navigation view style to stack style
        }
    }
}

// An extension on View that applies the NavStackContainer view modifier

extension View {
    public func inNavigationStack() -> some View {
        return self.modifier(NavStackContainer())
    }
}


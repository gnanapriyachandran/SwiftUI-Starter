//
//  ContentView.swift
//  SwiftUI Starter
//
//  Created by gnanapriya.chandran on 15/11/22.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifer() -> some View {
        self
            .imageModifier()
            .frame(width: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
    
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
    // MARK: - BASIC
       // AsyncImage(url: URL(string: imageURL))
        
        // MARK: - SCALE
        //AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        //MARK: - PLACEHOLDER
//
//        AsyncImage(url: URL(string: imageURL),scale: 3.0) { image in
//            image.imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifer()
//        }
//        .padding(40)
        
        
        //MARK: - phase
//
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            //SUCCESS: image loaded
//            //FAILURE: image failed to load
//            //EMPTY: No image loaded
//
//            if let image = phase.image {
//                image.imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifer()
//            } else {
//                Image(systemName: "photo.circle.fill").iconModifer()
//            }
//
//        }.padding(40)
        
        //MARK: - Animation
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
                    .transition(.slide)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifer()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifer()
            @unknown default:
                ProgressView()
            }
       
        }.padding(40)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

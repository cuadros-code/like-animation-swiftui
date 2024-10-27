//
//  ContentView.swift
//  like-animation-swiftui
//
//  Created by Kevin Cuadros on 25/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var positionTap = CGPoint.zero
    @State private var showingLike = false
    @State private var likeScale = 1.0
    @State private var likeSize = 0.0
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .onTapGesture(count: 1){ i in
                    onTapLike(i)
                }
            
            Image("img")
                .resizable()
                .frame(width: likeSize, height: likeSize)
                .position(positionTap)
                .opacity(showingLike ? 1 : 0)
                .transition(.opacity)
                .animation(.spring(duration: 1, bounce: 0.2), value: likeSize)
                .animation(.spring(response: 1, dampingFraction: 0.5), value: positionTap)
                .animation(.spring(duration: 1, bounce: 0.2), value: showingLike)
            
        }
       
    }
    
    func onTapLike(_ location: CGPoint) {
        likeSize = 70
        showingLike = true
        positionTap = location
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            positionTap = CGPoint(x: location.x, y: -5)
            likeSize = 40
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                showingLike = false
            }
        }
        
        
    }
    
}

#Preview {
    ContentView()
}

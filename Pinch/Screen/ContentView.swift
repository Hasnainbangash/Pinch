//
//  ContentView.swift
//  Pinch
//
//  Created by Elexoft on 14/02/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    @State private var isAnimating: Bool = false
    
    // MARK: - FUNCTION
    
    // MARK: - CONTENT
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
            } //: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            }
        } //: NAVIGATION
        // Stack navigation style will avoid using the sidebar on iPad devices
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}

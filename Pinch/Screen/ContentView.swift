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
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    // MARK: - FUNCTION
    
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    // MARK: - CONTENT
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                
                // MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                // MARK: - 1. TAP GESTURE
                // Double tap gesture
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    }
                // MARK: - 2. DRAG GESTURE
                    .gesture(
                        DragGesture()
                            .onChanged{ gesture in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = gesture.translation
                                }
                            }
                            .onEnded{ _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
            } //: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            }
            // MARK: - INFO PANEL
            .overlay (
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
            // MARK: - CONTROLS
            .overlay (
                Group {
                    HStack {
                        // SCALE DOWN
                        Button {
                            // Some action
                        } label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        
                        // RESET
                        Button {
                            // Some action
                        } label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        // SCALE UP
                        Button {
                            // Some action
                        } label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                        
                    }  //: CONTROLS
                }
                    .padding(.bottom, 30)
                , alignment: .bottom
            )
        } //: NAVIGATION
        // Stack navigation style will avoid using the sidebar on iPad devices
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}

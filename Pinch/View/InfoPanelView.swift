//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Elexoft on 14/02/2025.
//

import SwiftUI

struct InfoPanelView: View {
    var body: some View {
        HStack {
            // MARK: - HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
            
            Spacer()
            
            // MARK: - INFO PANEL
        }
    }
}

#Preview {
    InfoPanelView()
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
}

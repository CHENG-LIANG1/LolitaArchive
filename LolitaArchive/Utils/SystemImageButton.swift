//
//  SystemImageButton.swift
//  LolitaArchive
//
//  Created by 梁非凡 on 2025/1/31.
//

import SwiftUI
struct SystemImageButton: View {
    @State private var isTapped = false
    var systemName: String
    var body: some View {


        Image(systemName:systemName)
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .frame(width: 20, height: 20)
            .offset(y: -2)
            .padding(4)
            .background(Color.black.opacity(0.4))
            .clipShape(Circle())
            .scaleEffect(isTapped ? 0.95 : 1.0) // Scale effect for tap
            .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.2), value: isTapped) // Smooth

    }
}

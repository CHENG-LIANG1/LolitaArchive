//
//  CapsuleButton.swift
//  LolitaArchive
//
//  Created by 梁非凡 on 2025/1/31.
//

import SwiftUI

struct CapsuleButton: View {
    var text: String
    var font: Font
    var textWeight: Font.Weight
    var textColor: Color
    var backgroundColor: Color
    let onTap: () -> Void  // 外部传入的点击事件
    var padding: EdgeInsets

    @State private var isTapped = false
    
    var body: some View {
        Text(text)
            .font(font.weight(textWeight))
            .foregroundColor(textColor)
            .padding(padding)
            .background(backgroundColor)
            .cornerRadius(16)
            .scaleEffect(isTapped ? 0.95 : 1.0) // Scale effect for tap

            .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.2), value: isTapped) // Smooth spring animation
            .onTapGesture {
                isTapped.toggle() // Toggle the tap state
                onTap()
            }
    }
}


//
//  imageModifier.swift
//  LolitaArchive
//
//  Created by 梁非凡 on 2025/1/31.
//

//
//  ImageModifiers.swift
//  ProtainCalc
//
//  Created by Cheng Liang(Louis) on 2022/12/10.
//

import SwiftUI

struct systemImageModifier: ViewModifier {
    var font: Font
    var forgroundColor: Color
    var backgroundColor: Color
    var renderingMode: SymbolRenderingMode

    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(forgroundColor)
            .background(backgroundColor)
            .symbolRenderingMode(renderingMode)

    }
}

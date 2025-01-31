//
//  DressDetail.swift
//  LolitaArchive
//
//  Created by 梁非凡 on 2025/1/31.
//

import SwiftUI
import MijickNavigationView

struct DressDetail: NavigatableView {
    let dress: LolitaProduct
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.backward")
                    .modifier(systemImageModifier(font: .system(size: 16, weight: .semibold), forgroundColor: .primary, backgroundColor: .clear, renderingMode: .hierarchical))
                 
                    
                    .padding(.leading, 8)
                Text(dress.name ?? "")
                    .modifier(defaultTextModifier(textSize: 16, weight: .semibold))
                Spacer()
            }
            .onTapGesture {
                Helper.viberate(feedbackStyle: .heavy)
                NavigationManager.pop()
            }
            Spacer()
        }
  
    }
}

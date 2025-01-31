//
//  PillButtons.swift
//
//  Created by Siddhant Mehta on 6/11/24
//  Twitter: @metasidd
//
//  Feel free to reuse, or remix.

import SwiftUI

struct Pill: Identifiable {
    let id: Int
    let text: String
    let systemIcon: String
    let color: Color
}

struct PillButtonRowView: View {
    private let pills: [Pill] = [
        Pill(id: 1, text: "Priority", systemIcon: "person", color: Color.blue),
        Pill(id: 2, text: "Shopping", systemIcon: "cart", color: Color.green),
        Pill(id: 3, text: "Social", systemIcon: "text.bubble", color: Color.indigo),
        Pill(id: 4, text: "Promotions", systemIcon: "horn", color: Color.red)
    ]
    
    @State private var selectedPillID: Int = 1
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(pills) { pill in
                PillButton(pill: pill, isSelected: selectedPillID == pill.id) {
                    withAnimation(.bouncy) {
                        self.selectedPillID = pill.id
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
    }
}

struct PillButton: View {
    let pill: Pill
    let isSelected: Bool
    let onSelect: () -> Void
    
    var body: some View {
        Button(action: {
            onSelect()
        }) {
            HStack {
                iconView
                textView
            }
            .frame(maxWidth: isSelected ? .infinity : nil, alignment: .center)
            .font(.body)
            .foregroundStyle(pillForeground)
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .background(pillBackground)
            .clipShape(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
            )
        }
        .buttonStyle(PlainButtonStyle()) // To remove the default button style
    }
    
    // MARK: - Properties
    
    private var pillIcon: String {
        isSelected ? "\(pill.systemIcon).fill" : pill.systemIcon
    }
    private var pillBackground: Color {
        isSelected ? pill.color : Color(UIColor.secondarySystemBackground)
    }
    private var pillForeground: Color {
        isSelected ? Color(UIColor.white) : Color(UIColor.label)
    }
    
    // MARK: - Subviews
    
    @ViewBuilder
    private var iconView: some View {
        // Intentionally layering two icons to remove any ghosting effect, or lagging views
        ZStack {
            Image(systemName: "\(pill.systemIcon).fill")
                .opacity(isSelected ? 1 : 0)
            
            Image(systemName:  pill.systemIcon)
                .opacity(isSelected ? 0 : 1)
        }
    }
    
    @ViewBuilder
    private var textView: some View {
        if isSelected {
            Text(pill.text)
                .offset(x: isSelected ? 0 : 100)
                .frame(maxWidth: isSelected ? nil : 0)
                .transition(.opacity)
        }
    }
}

#Preview {
    PillButtonRowView()
}

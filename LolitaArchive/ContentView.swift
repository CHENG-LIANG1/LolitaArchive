//
//  ContentView.swift
//  LolitaArchive
//
//  Created by 梁非凡 on 2025/1/28.
//

import SwiftUI
import ExyteMediaPicker
import BottomSheetSwiftUI
import MijickNavigationView

struct ContentView: NavigatableView {
    @State var bottomSheetPosition: BottomSheetPosition = .hidden
    let bottomSheetHeight = 625
    @State private var isPostTapped = false
    @State private var isAddTapped = false


    @State private var currentBottomSheet = "Add"
    var body: some View {
        TabView {
            HomeView(isAddTapped: $isAddTapped)
                .onChange(of: isAddTapped, { oldValue, newValue in
                    bottomSheetPosition = .absolute(CGFloat(bottomSheetHeight))
                    
                    currentBottomSheet = "Add"
                })
                .tabItem {
                    Label("Closet", systemImage: "heart.circle")
                }
            PreorderView()
                .tabItem {
                    Label("Preorder", systemImage: "list.bullet.circle.fill")
                }
            
            ProfileView(isPostTapped: $isPostTapped)
                .onChange(of: isPostTapped, { oldValue, newValue in
                    
                    currentBottomSheet = "Post"
                    bottomSheetPosition = .absolute(CGFloat(bottomSheetHeight))
                })
                .tabItem {
                    Label("Wanzhu", systemImage: "cat.circle.fill")
                }
            
    
        }
        .tint(Color("Primary"))
        .bottomSheet(bottomSheetPosition: self.$bottomSheetPosition, switchablePositions: [.hidden, .dynamicBottom, .dynamicTop, .absolute(CGFloat(bottomSheetHeight))], content: {
            
            if currentBottomSheet == "Add" {
                HomeBottomSheetView(showImagePicker: false)
            }
        })
        .enableTapToDismiss()
        .enableSwipeToDismiss()
        .enableBackgroundBlur()
        .backgroundBlurMaterial(.systemDark)
        .customBackground(Color.BackgroundColor.cornerRadius(24))
        
  
    }
   
}

#Preview {
    ContentView()
}

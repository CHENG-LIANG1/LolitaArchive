//
//  ProfileBottomSheetView.swift
//  LolitaArchive
//
//  Created by 梁非凡 on 2025/1/31.
//

import SwiftUI
import MijickNavigationView
struct SettingsView: NavigatableView {
    var body: some View {
        
        Helper.generateButton(title: "Edit Profile")
        
        VStack(alignment: .center) {
            Spacer()
            
            CircularButton(color: Color.Button, size: 44, imageName: "xmark", imageSize: 24, onTap: {
                Helper.viberate(feedbackStyle: .heavy)
                NavigationManager.pop()
            })
            .padding(.bottom, 24)
        }
    }
}

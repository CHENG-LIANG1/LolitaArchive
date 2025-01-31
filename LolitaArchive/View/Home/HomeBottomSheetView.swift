//
//  HomeBottomSheetView.swift
//  LolitaArchive
//
//  Created by 梁非凡 on 2025/1/31.
//

import SwiftUI
import ExyteMediaPicker
struct HomeBottomSheetView: View {
    @State var showImagePicker: Bool  // 绑定到外部状态
    @State var image: [UIImage]?
    var body: some View {
        VStack {
            Button {
                showImagePicker = true
            } label: {
                Text("ddd")
            }

        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(sourceType: .photoLibrary, allowsMultipleSelection: false) { image in
                self.image = image
            }
        }
   
    }
    
}

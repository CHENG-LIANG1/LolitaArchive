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
    @Environment(\.managedObjectContext) var moc

    func addDress() {
        let dress = LolitaProduct(context: moc)
        dress.productimage = image?[0].pngData()
        dress.id = UUID()
        dress.brand = "Dream Doll"
        dress.name = "Petty"
        dress.tags = "XXX, XXX"
        try? moc.save()
        
    }
    
    var body: some View {
        VStack {
            Button {
                showImagePicker = true
                addDress()
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

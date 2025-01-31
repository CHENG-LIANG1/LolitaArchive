//
//  Home.swift
//  ProtainCalc
//
//  Created by Cheng Liang(Louis) on 2022/11/22.
//

import SwiftUI
import ExyteGrid
import ExyteMediaPicker
import BottomSheetSwiftUI

struct HomeView: View {
    var screenWidth = UIScreen().bounds.size.width
    
    @State private var showingAdditionSheet = false
    @Environment(\.presentationMode) var presentationMode
    @State private var countries = [String]()
    @State private var presentFullScreen = false
    @State private var favCanNum = 0
    @State private var toolButtonText = "Grid"
    @Binding var isAddTapped: Bool  // 绑定到外部状态
   
    @State private var showMediaPicker = false

    var body: some View {
        ZStack {
            if toolButtonText == "Grid" {
                Grid(tracks: [.fit, .fit]) {
                    ColorView(color: .blue)
                        .frame(height: 300)
                    ColorView(color: .red)
                        .frame(height: 300)
                    ColorView(color: .red)
                        .frame(height: 300)
                    ColorView(color: .blue)
                        .frame(height: 300)
                    ColorView(color: .blue)
                        .frame(height: 300)
                }
                .gridContentMode(.scroll)
                .scrollIndicators(.hidden)
                .padding(.horizontal, 4)
            }
        
            
            else {
                List(content: {
                    ColorView(color: .blue)
                        .frame(height: 100)
                    ColorView(color: .red)
                        .frame(height: 100)
                    ColorView(color: .red)
                        .frame(height: 100)
                    ColorView(color: .blue)
                        .frame(height: 100)
                    ColorView(color: .blue)
                        .frame(height: 100)
                })
            }
            


            VStack {
                Spacer()
                HStack {
                    Spacer()
                    CircularButton(color: Color("Button"), size: 54, imageName: "plus", imageSize: 30) {
                        Helper.viberate(feedbackStyle: .heavy)
                        isAddTapped.toggle()
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("竹の衣柜")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                CapsuleButton(text: toolButtonText, font: .headline.italic(), textWeight: .bold, textColor: .white, backgroundColor: Color.DarkButton, onTap: {
                    Helper.viberate(feedbackStyle: .heavy)
                    if toolButtonText == "Grid" {
                        toolButtonText = "List"
                    } else {
                        toolButtonText = "Grid"
                    }
                }, padding: .init(top: 4, leading: 12, bottom: 4, trailing: 12))
            }
        }

    }
}

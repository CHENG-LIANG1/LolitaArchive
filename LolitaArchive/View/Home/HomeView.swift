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
import MijickNavigationView

struct HomeView: NavigatableView {
    var screenWidth = UIScreen().bounds.size.width
    
    @State private var showingAdditionSheet = false
    @Environment(\.presentationMode) var presentationMode
    @State private var countries = [String]()
    @State private var presentFullScreen = false
    @State private var favCanNum = 0
    @State private var toolButtonText = "Grid"
    @State private var imageSize = CGFloat(100)

    @Binding var isAddTapped: Bool  // 绑定到外部状态
   
    @State private var showMediaPicker = false
    @FetchRequest(sortDescriptors: []) var dresses: FetchedResults<LolitaProduct>

    
    
    var body: some View {
        NavigationView{
            ZStack {
                if toolButtonText == "Grid" {
                    Grid(tracks: [.fit, .fit]) {
                        ForEach(dresses) {dress in
                            DressCard(image: dress.productimage ?? Data(), title: dress.name ?? "", content: dress.brand ?? "", imageSize: imageSize)
                                .onTapGesture {
                                    Helper.viberate(feedbackStyle: .heavy)
                                    DressDetail(dress: dress).push(with: .dissolve)
                                }
                        }
                    }
                    .gridContentMode(.scroll)
                    .scrollIndicators(.hidden)
                    .padding(.horizontal, 4)
                }
            
                
                else {
                    List(content: {
         
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
            .background(Color.BackgroundColor)
            .onAppear {
                if dresses.count == 1 {
                    imageSize = Helper.getScreenWidth() - CGFloat(8)
                } else {
                    imageSize = (Helper.getScreenWidth() - CGFloat(24)) / 2
                }
            }
        }
 

    }
}

//
//  ProfileView.swift
//  ProfileHeaderLikeTwitter
//
//  Created by paku on 2023/10/23.
//

import SwiftUI
import BottomSheetSwiftUI
import MijickNavigationView

struct ProfileView: NavigatableView {
    
    @State private var offset: CGFloat = 0
    @State private var tabBarOffset: CGFloat = 0
    @State private var usernameOffset: CGFloat = 0
    
    let screenWidth = UIScreen.main.bounds.width
    let headerImageHeight: CGFloat = 170
    @Binding var isPostTapped: Bool  // 绑定到外部状态


    @Namespace var animation
    private static let viewId = "ProfileView"

    
    var body: some View {
    
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                GeometryReader { proxy -> AnyView in
                    let minY = proxy.frame(in: .global).minY
                    //これを囲まないと
                    //「Modifying state during view update, this will cause undefined behavior.」警告がでる
                    // 要は、scrollすると minY -> @State offsetに新しい値が代入され
                    // 代入による、再描画のupdateになるので再帰的呼び出し無限ループに陥る
                    // @State offset更新を非同期にすることで再描画が完了した後に状態を変更できる
                    onChanged(value: minY, state: $offset)
                    
                    return headerImage
                }
                .frame(height: headerImageHeight)
                .zIndex(-offset > 80 ? 1 : 0)
                
                HStack {
                    profileIcon
                        .scaleEffect(getScale())
                    
                    Spacer()
        
                }
                .padding(.horizontal)
                .padding(.vertical, -30)
                .zIndex(0)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("刘皖竹")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .overlay(
                            GeometryReader { proxy -> Color in
                                let minY = proxy.frame(in: .global).minY
                                
                                onChanged(value: minY, state: $usernameOffset)
                             
                                return .clear
                            }
                        )
                    
                    Text("@tikkuu_liu")
                        .foregroundStyle(.gray)
                                        
                    Text("Techinial Writer | Lolita | Sci-Fi | Hardcore Gamer (Farming & Soul-like) | Certified 'Most Adorable Girl' in the world")
                    
        
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
     
            }
        }
        .ignoresSafeArea()
        .overlay(naviHeader, alignment: .top)


    }
    
    private func onChanged(value: CGFloat, state: Binding<CGFloat>) {
        DispatchQueue.main.async {
            state.wrappedValue = value
        }
    }
    
    private func getScale() -> CGFloat {
        if -offset > 80 {
            // scroll量が80を超えたら 0.5のスケールを保つ
            return 0.5
        } else {
            // 下にscrollの場合スケールは1 それ以外、上にscrollした量が80まで、scrollの半分の量(1 * 0.5)でアイコンを縮小
            return offset > 0 ? 1 : 1 - ((-offset / 80) * 0.5)
        }
    }
    
    private func getOpacity() -> CGFloat {
        if offset <= 0 {
            return 0
        } else {
            return min(1, max(0, offset - offset * 0.985))
        }
    }
        
    private func getUsernameOffset() -> CGFloat {
        if usernameOffset < 60 {
            return -usernameOffset + 60
        }
        return 0
    }
    
    private func getUsernameOpacity() -> CGFloat {
        // Trigger Stated at 80
        // End at 60
        // 80 = 0
        // 60 = 1
        
        if usernameOffset < 80 {
            // 80未満からは 0...1 にopacityを変更していく
            let opacity = (80 / (usernameOffset ) - 1) * 2 // 2: scroll分の2倍速さにする
            return usernameOffset < 60 ? 1 : opacity
            
        } else {
            return 0
        }
    }
}

extension ProfileView {
    var naviHeader: some View {
            HStack {
       
                Spacer()
    
                Button(action: {
                    Helper.viberate(feedbackStyle: .heavy)
                    SettingsView().push(with: .dissolve)
                }){
                    SystemImageButton(systemName: "gearshape.fill")
                }

                
            }
            .padding(.horizontal)
        }
    
    
    var headerImage: AnyView {
        AnyView(
            
            ZStack(alignment: .bottom) {
                Image("BackgroundImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenWidth,
                           // 下にscrollした分 heightの高さをincrementする
                           height: offset > 0 ? headerImageHeight + offset : headerImageHeight, alignment: .center)
                    .clipShape(Rectangle())
                    .overlay(BlurView().opacity(getOpacity()))
                // 下にスクロール時はheaderを固定
                .offset(y:
                            // scroll down offset: 相殺して　y:0 positionを維持
                            offset > 0 ?  -offset :
                           
                            // scroll up
                            // (offset > -80 ? 0) 80までは offsetを0にしているので headerImageはScrollViewのスクロールに合わせて動く
                            // 80を超えた場合 (-80 - offset) y:-80の位置から （scrollした分 - offset分)で相殺し -80ポジションを維持させる
                            offset > -80 ? 0 : -80 - offset)
                
                
                HStack {
                    Text("刘皖竹")
                        .bold()
                        .foregroundStyle(.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 5)
                        .opacity(getUsernameOpacity())
                        .offset(y: getUsernameOffset())
                    
                    Spacer()
                }
                .padding(.horizontal, 50)
                .offset(y: 88)
                
            }
        )
    }
    
    var profileIcon: some View {
        Image("UserImage1")
            .resizable()
            .scaledToFill()
            .frame(width: 75, height: 75)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 6))
            .zIndex(0)

    }
    

}

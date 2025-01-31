import SwiftUI

struct CircularButton: View {
    let color: Color
    let size: CGFloat
    let imageName: String
    let imageSize: CGFloat
    let onTap: (() -> Void)?  // 外部传入的点击事件，改为可选

    @State private var isPressed = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: size, height: size)
                .scaleEffect(isPressed ? 0.92 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isPressed)
                
            Image(systemName: imageName)
                .font(.system(size: imageSize, weight: .medium))
                .foregroundColor(.white)
                .rotation3DEffect(
                    Angle(degrees: isPressed ? 8 : 0),
                    axis: (x: 1, y: -1, z: 0)
                )
                .animation(.easeOut(duration: 0.2), value: isPressed)
        }
        .opacity(isPressed ? 0.85 : 1.0)
        .modifier(TapGestureModifier(onTap: onTap))  // 使用自定义 modifier
    }
}

struct TapGestureModifier: ViewModifier {
    let onTap: (() -> Void)?
    
    func body(content: Content) -> some View {
        Group {
            if let onTap = onTap {
                content
                    .onTapGesture {
                        withAnimation {
                            onTap()
                        }
                    }
            } else {
                content
            }
        }
    }
}

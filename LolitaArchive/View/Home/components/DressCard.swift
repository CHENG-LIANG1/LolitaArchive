import SwiftUI
import MijickNavigationView

struct DressCard: NavigatableView {
    // 图片数据
    let image: Data
    // 标题
    let title: String
    // 内容
    let content: String

    let imageSize: CGFloat
    
    var body: some View {
        VStack(alignment:.leading, spacing: 2) {
            // 显示图片
            Image(uiImage: UIImage(data: image) ?? UIImage())
               .resizable()
               .aspectRatio(contentMode:.fill)
               .frame(width: imageSize, height: imageSize)
               .clipped()
               .cornerRadius(4, corners: [.topLeft, .topRight])
            
            // 标题
            Text(title)
                .modifier(defaultTextModifier(textSize: 14, weight: .medium))
                .lineLimit(1)
                .padding(.horizontal, 4)

            // 内容
            Text(content)
                .modifier(secondaryTextModifier(textSize: 12, weight: .medium))
                .lineLimit(1)
                .padding(.horizontal, 4)
                .padding(.bottom, 4)


        }
       .background(Color.white)
       .cornerRadius(4)
       .shadow(radius: 0.1)
  
    }
}

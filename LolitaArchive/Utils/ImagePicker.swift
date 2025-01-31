import SwiftUI
import PhotosUI

public struct ImagePickerView: UIViewControllerRepresentable {
    
    private let sourceType: UIImagePickerController.SourceType
    private let allowsMultipleSelection: Bool
    private let onImagesPicked: ([UIImage]) -> Void
    @Environment(\.presentationMode) private var presentationMode

    public init(sourceType: UIImagePickerController.SourceType, allowsMultipleSelection: Bool = false, onImagesPicked: @escaping ([UIImage]) -> Void) {
        self.sourceType = sourceType
        self.allowsMultipleSelection = allowsMultipleSelection
        self.onImagesPicked = onImagesPicked
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        if allowsMultipleSelection {
            // 使用 PHPickerViewController
            var configuration = PHPickerConfiguration()
            configuration.filter = .images
            configuration.selectionLimit = 0 // 0 表示无限制
            let picker = PHPickerViewController(configuration: configuration)
            picker.delegate = context.coordinator
            return picker
        } else {
            // 继续使用 UIImagePickerController
            let picker = UIImagePickerController()
            picker.sourceType = self.sourceType
            picker.delegate = context.coordinator
            return picker
        }
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    public func makeCoordinator() -> Coordinator {
        Coordinator(
            onDismiss: { self.presentationMode.wrappedValue.dismiss() },
            onImagesPicked: self.onImagesPicked
        )
    }

    final public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate, PHPickerViewControllerDelegate {
        
        private let onDismiss: () -> Void
        private let onImagesPicked: ([UIImage]) -> Void

        init(onDismiss: @escaping () -> Void, onImagesPicked: @escaping ([UIImage]) -> Void) {
            self.onDismiss = onDismiss
            self.onImagesPicked = onImagesPicked
        }

        // 处理 UIImagePickerController 结果（单选）
        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                self.onImagesPicked([image]) // 包装成数组，保持一致
            }
            self.onDismiss()
        }

        public func imagePickerControllerDidCancel(_: UIImagePickerController) {
            self.onDismiss()
        }

        // 处理 PHPickerViewController 结果（多选）
        public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            let dispatchGroup = DispatchGroup()
            var images: [UIImage] = []

            for result in results {
                dispatchGroup.enter()
                result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                    if let image = object as? UIImage {
                        images.append(image)
                    }
                    dispatchGroup.leave()
                }
            }

            dispatchGroup.notify(queue: .main) {
                self.onImagesPicked(images)
                self.onDismiss()
            }
        }
    }
}

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding fileprivate(set) var isPresented: Bool
    @Binding fileprivate(set) var image: UIImage?
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let imagePicker: ImagePicker
        
        init(_ imagePicker: ImagePicker) {
            self.imagePicker = imagePicker
            
            super.init()
        }
        
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            imagePicker.image = info[.originalImage] as? UIImage
            imagePicker.isPresented = false
        }
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

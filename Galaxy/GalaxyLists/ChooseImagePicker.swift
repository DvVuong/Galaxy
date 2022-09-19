import UIKit
public class ImagePicker: NSObject {

   private var rootViewController: AddNewPlanetViewController!
    
    public func setupActionSheet(on: UIViewController)  {
        let actionSheet = UIAlertController(title: "Choose Image",
                                            message: nil,
                                            preferredStyle: .actionSheet)
        let acction = UIAlertAction(title: "From libarbry",
                                    style: .default) { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.rootViewController?.present(imagePicker, animated: true)
        }
        actionSheet.addAction(acction)
        rootViewController?.present(actionSheet, animated: true)
    }
}
extension ImagePicker: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
        }
    }
}

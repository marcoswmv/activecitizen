//
//  MakeReportMapVС+ImagePicker.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 28.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension MakeReportMapViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func choosePhotoSourceAlertController() {
        let photoLibraryAction = UIAlertAction(title: "Галерея", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Камера", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.showImagePickerController(sourceType: .camera)
            } else {
                Alert.showAlert(on: self,
                                style: .alert,
                                title: "Камера недоступна",
                                message: "К сожалению камера на телефон недоступна сейчас\nПожалуйста попробуйте попозже!")
            }
        }
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        
        Alert.showAlert(on: self,
                        style: .actionSheet,
                        title: "Выбрать источник",
                        message: nil,
                        actions: [photoLibraryAction, cameraAction, cancelAction],
                        completion: nil)
    }
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
         let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
//            TO-DO: Somehow save the image as a JPG or PNG, to upload it to the server
            let image = originalImage.withRenderingMode(.alwaysOriginal)
            photoCollectionControllerDelegate?.addPhoto(with: image)
            
        } else if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            let image = editedImage.withRenderingMode(.alwaysOriginal)
            photoCollectionControllerDelegate?.addPhoto(with: image)
        }
        dismiss(animated: true, completion: nil)
    }
}

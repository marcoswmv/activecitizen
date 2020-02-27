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
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Take a Picture", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.showImagePickerController(sourceType: .camera)
            } else {
//                TODO: Show alert letting the user know the camera is unavailable
            }
        }
/*
         let cameraRollAction = UIAlertAction(title: "Camera Roll", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
                self.showImagePickerController(sourceType: .savedPhotosAlbum)
            } else {
/*
                 TODO: Show alert letting the user know the camera roll is unavailable
                        and then it will open the Photo Library
*/
            }
        }
*/
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        Alert.showAlert(style: .actionSheet,
                        title: "Choose a source",
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
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            TODO: Get the image and upload to server
            print(originalImage.withRenderingMode(.alwaysOriginal))
        } else if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//            TODO: Get the image and upload to server
            print(editedImage.withRenderingMode(.alwaysOriginal))
        }
        dismiss(animated: true, completion: nil)
    }
}

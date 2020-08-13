//
//  ViewController.swift
//  Messenger
//
//  Created by Gustavo on 11/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit
import ImagePicker
import TinyConstraints

class LoginViewController: UIViewController, ImagePickerDelegate {
    
    
    let profileImageViewWidth : CGFloat = 200
    let imageProfile = UIImage(named: "logo") as UIImage?
    
    lazy var profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = imageProfile
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = profileImageViewWidth / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let requestImageViewWidth : CGFloat = 200
    let imageRequest = UIImage(named: "logo") as UIImage?
    
    lazy var requestImageView : UIImageView = {
        let requestImage = UIImageView()
        requestImage.image = imageRequest
        requestImage.contentMode = .scaleAspectFill
        requestImage.layer.cornerRadius = requestImageViewWidth / 2
        requestImage.layer.masksToBounds = true
        return requestImage
    }()
    
    lazy var profileImageButton : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.cornerRadius = profileImageViewWidth / 2
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(profileImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var sendRequestButton : UIButton = {
        var sendButton = UIButton(type: .system)
        sendButton.backgroundColor = .clear
        sendButton.layer.cornerRadius = requestImageViewWidth / 2
        sendButton.layer.masksToBounds = true
        sendButton.addTarget(self, action: #selector(sendRequestButtonTapped), for: .touchUpInside)
        return sendButton
    }()
    
    @objc fileprivate func profileImageButtonTapped() {
        showImagePickerControllerActionSheet()
    }
    
    @objc fileprivate func sendRequestButtonTapped() {
        let contacts = ContactsViewController()
        navigationController?.pushViewController(contacts, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() {
        view.backgroundColor = .white
        addViews()
        constrainViews()
    }
    
    fileprivate func addViews() {
        view.addSubview(profileImageView)
        view.addSubview(requestImageView)
        view.addSubview(profileImageButton)
        view.addSubview(sendRequestButton)
    }
    
    fileprivate func constrainViews() {
        profileImageView.topToSuperview(offset: 36, usingSafeArea: true)
        profileImageView.centerXToSuperview()
        profileImageView.width(profileImageViewWidth)
        profileImageView.height(profileImageViewWidth)
        
        profileImageButton.edges(to: profileImageView)
        
        requestImageView.bottomToSuperview(offset: -30, usingSafeArea: true)
        requestImageView.centerXToSuperview()
        requestImageView.width(requestImageViewWidth)
        requestImageView.height(requestImageViewWidth)
        
        sendRequestButton.edges(to: requestImageView)
    }
}

extension LoginViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func showImagePickerControllerActionSheet() {
        
        let imagePickerController = ImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
        let photoLibraryAction = UIAlertAction(title: "Biblioteca", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.showImagePickerController(sourceType: .camera)
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        Alert.showAlert(style: .actionSheet, title: "Escolha uma imagem", message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
       if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileImageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageView.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        profileImageView.image = images[0]
            
        imagePicker.dismiss(animated: true, completion: nil)
    }
}

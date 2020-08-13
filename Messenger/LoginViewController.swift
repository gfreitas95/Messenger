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
    
    lazy var profileImageButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.cornerRadius = profileImageViewWidth / 2
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(profileImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let userNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Select your image profile \ntapping on a logo"
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
       return label
    }()
    
    let userNameTextField : UITextField = {
        let userName = UITextField()
        userName.placeholder = " Insert your user name"
        userName.borderStyle = UITextField.BorderStyle.line
        userName.layer.cornerRadius = 10
        userName.layer.masksToBounds = false
       return userName
    }()
    
    let emailTextField : UITextField = {
        let email = UITextField()
        email.placeholder = " Insert your email"
        email.borderStyle = UITextField.BorderStyle.line
        email.layer.cornerRadius = 10
        email.layer.masksToBounds = false
       return email
    }()
    
    let passwordTextField : UITextField = {
        let password = UITextField()
        password.placeholder = " Insert your password"
        password.isSecureTextEntry = true
        password.borderStyle = UITextField.BorderStyle.line
        password.layer.cornerRadius = 10
        password.layer.masksToBounds = false
       return password
    }()
    
    let loginButton : UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = false
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return loginButton
    }()
    
    let forgotPasswordButton : UIButton = {
        let forgotPassword = UIButton(type: .system)
        forgotPassword.setTitle("Forgot my password", for: .normal)
        forgotPassword.setTitleColor(.lightGray, for: .normal)
        return forgotPassword
    }()
    
    @objc fileprivate func profileImageButtonTapped() {
        showImagePickerControllerActionSheet()
    }
    
    @objc fileprivate func loginButtonTapped() {
        let contacts = ContactsViewController()
        navigationController?.pushViewController(contacts, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubViews()
        constraints()
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    fileprivate func addSubViews() {
        view.addSubview(loginButton)
        view.addSubview(userNameLabel)
        view.addSubview(emailTextField)
        view.addSubview(profileImageView)
        view.addSubview(passwordTextField)
        view.addSubview(profileImageButton)
        view.addSubview(forgotPasswordButton)
    }
    
    fileprivate func constraints() {
        profileImageView.topToSuperview(offset: 36, usingSafeArea: true)
        profileImageView.centerXToSuperview()
        profileImageView.width(profileImageViewWidth)
        profileImageView.height(profileImageViewWidth)
        
        profileImageButton.edges(to: profileImageView)
        
        userNameLabel.topToSuperview(offset: 250, usingSafeArea: true)
        userNameLabel.centerXToSuperview()
        userNameLabel.width(300)
        userNameLabel.height(50)
        
        emailTextField.topToSuperview(offset: 350, usingSafeArea: true)
        emailTextField.centerXToSuperview()
        emailTextField.width(300)
        emailTextField.height(50)
        
        passwordTextField.topToSuperview(offset: 405, usingSafeArea: true)
        passwordTextField.centerXToSuperview()
        passwordTextField.width(300)
        passwordTextField.height(50)
        
        loginButton.topToSuperview(offset: 460, usingSafeArea: true)
        loginButton.centerXToSuperview()
        loginButton.width(300)
        loginButton.height(50)
        
        forgotPasswordButton.topToSuperview(offset: 550, usingSafeArea: true)
        forgotPasswordButton.centerXToSuperview()
        forgotPasswordButton.width(300)
        forgotPasswordButton.height(50)
    }
}



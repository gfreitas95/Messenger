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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(label)
        view.addSubview(appVersion)
        view.addSubview(loginButton)
        view.addSubview(emailTextField)
        view.addSubview(profileImageView)
        view.addSubview(passwordTextField)
        view.addSubview(profileImageButton)
        view.addSubview(forgotPasswordButton)
        
        profileImageView.topToSuperview(offset: 0, usingSafeArea: true)
        profileImageView.centerXToSuperview()
        profileImageView.width(profileImageViewWidth)
        profileImageView.height(profileImageViewWidth)
        
        profileImageButton.edges(to: profileImageView)
        
        label.topToBottom(of: profileImageButton, offset: 10, relation: .equal, priority: .defaultHigh, isActive: true)
        label.centerXToSuperview()
        label.width(300)
        label.height(50)
        
        emailTextField.topToBottom(of: label, offset: 10, relation: .equal, priority: .defaultHigh, isActive: true)
        emailTextField.centerXToSuperview()
        emailTextField.width(300)
        emailTextField.height(40)
        
        passwordTextField.topToBottom(of: emailTextField, offset: 5, relation: .equal, priority: .defaultHigh, isActive: true)
        passwordTextField.centerXToSuperview()
        passwordTextField.width(300)
        passwordTextField.height(40)
        
        loginButton.topToBottom(of: passwordTextField, offset: 10, relation: .equal, priority: .defaultHigh, isActive: true)
        loginButton.centerXToSuperview()
        loginButton.width(300)
        loginButton.height(40)
        
        forgotPasswordButton.topToBottom(of: loginButton, offset: 10, relation: .equal, priority: .defaultHigh, isActive: true)
        forgotPasswordButton.centerXToSuperview()
        forgotPasswordButton.width(300)
        forgotPasswordButton.height(40)
        
        appVersion.width(100)
        appVersion.height(30)
        appVersion.bottomToSuperview()
        appVersion.trailingToSuperview(offset: 10, usingSafeArea: true)
    }
    
    // MARK: - ProfileImageView
    
    let profileImageViewWidth : CGFloat = 140
    let imageProfile = UIImage(named: "logo") as UIImage?
    
    lazy var profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = imageProfile
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = profileImageViewWidth / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // MARK: - ProfileImageButton
    lazy var profileImageButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.cornerRadius = profileImageViewWidth / 2
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(profileImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Label
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "Select your image profile \ntapping on a logo"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = .init(descriptor: .preferredFontDescriptor(withTextStyle: .subheadline), size: 15)
       return label
    }()
    
    // MARK: - UsernameTextField
    
    let emailTextField : UITextField = {
        let email = UITextField()
        email.placeholder = " Insert your email"
        email.borderStyle = UITextField.BorderStyle.roundedRect
        email.layer.cornerRadius = 10
        email.layer.masksToBounds = false
       return email
    }()
    
    // MARK: - PasswordTextField
    
    let passwordTextField : UITextField = {
        let password = UITextField()
        password.placeholder = " Insert your password"
        password.isSecureTextEntry = true
        password.borderStyle = UITextField.BorderStyle.roundedRect
        password.layer.cornerRadius = 10
        password.layer.masksToBounds = false
       return password
    }()
    
    // MARK: - LoginButton
    
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
    
    // MARK: - ForgotPasswordButton
    
    let forgotPasswordButton : UIButton = {
        let forgotPassword = UIButton(type: .system)
        forgotPassword.setTitle("Forgot my password", for: .normal)
        forgotPassword.setTitleColor(.lightGray, for: .normal)
        return forgotPassword
    }()
    
    // MARK: - AppVersion
    
    let appVersion : UILabel = {
        let appVersion = UILabel()
        appVersion.text = "Version 0.0.1"
        appVersion.textColor = .gray
        appVersion.font = .init(descriptor: .preferredFontDescriptor(withTextStyle: .subheadline), size: 12)
       return appVersion
    }()
    
    // MARK: - Segues
    
    @objc fileprivate func profileImageButtonTapped() {
        showImagePickerControllerActionSheet()
    }
    
    @objc fileprivate func loginButtonTapped() {
        let contacts = ContactsViewController()
        navigationController?.pushViewController(contacts, animated: true)
    }
}

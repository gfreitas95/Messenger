//
//  ForgotPasswordViewController.swift
//  Messenger
//
//  Created by Gustavo on 08/09/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit
import SCLAlertView
import TinyConstraints

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        cpfTextField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(recoverLabel)
        view.addSubview(cpfTextField)
        view.addSubview(recoverButton)
        view.addSubview(descriptionLabel)
        navigationController?.navigationBar.isTranslucent = false
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
            navigationController?.navigationBar.backgroundColor = .tertiarySystemBackground
        } else {
            view.backgroundColor = .white
            navigationController?.navigationBar.backgroundColor = .white
        }
        
        recoverLabel.topToSuperview(offset: 20, usingSafeArea: true)
        recoverLabel.centerXToSuperview()
        recoverLabel.width(300)
        recoverLabel.height(100)
        
        descriptionLabel.topToBottom(of: recoverLabel, offset: 10, relation: .equal, priority: .defaultHigh, isActive: true)
        descriptionLabel.centerXToSuperview()
        descriptionLabel.leadingToSuperview(offset: 40, usingSafeArea: true)
        descriptionLabel.trailingToSuperview(offset: 20, usingSafeArea: true)
        
        cpfTextField.topToBottom(of: descriptionLabel, offset: 30, relation: .equal, priority: .defaultHigh, isActive: true)
        cpfTextField.centerXToSuperview()
        cpfTextField.width(300)
        cpfTextField.height(40)
        
        recoverButton.topToBottom(of: cpfTextField, offset: 10, relation: .equal, priority: .defaultHigh, isActive: true)
        recoverButton.centerXToSuperview()
        recoverButton.width(300)
        recoverButton.height(40)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
            
    // MARK: - UITextFieldDelegate
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - UILabels
    
    let recoverLabel : UILabel = {
        let recover = UILabel()
        recover.text = "Recover Password"
        recover.textColor = .systemBlue
        recover.textAlignment = .left
        recover.font = .init(descriptor: .preferredFontDescriptor(withTextStyle: .headline), size: 35)
       return recover
    }()
    
    let descriptionLabel : UILabel = {
        let description = UILabel()
        description.text = "Inform the CPF where your account \nwas registered so that the password \nchange form can be sent."
        description.numberOfLines = 3
        description.textAlignment = .left
        description.textColor = .systemBlue
        description.lineBreakMode = .byWordWrapping
        description.font = .init(descriptor: .preferredFontDescriptor(withTextStyle: .subheadline), size: 15)
       return description
    }()
    
    // MARK: - CPFTextField
    
    let cpfTextField : UITextField = {
        let cpf = UITextField()
        cpf.layer.cornerRadius = 10
        cpf.keyboardType = .numberPad
        cpf.layer.masksToBounds = false
        cpf.placeholder = " Insert your CPF"
        cpf.borderStyle = UITextField.BorderStyle.roundedRect
        
        if #available(iOS 13.0, *) {
            cpf.textColor = .placeholderText
        } else {
            // Fallback on earlier versions
        }
       return cpf
    }()
    
    // MARK: - RecoverButton
    
    let recoverButton : UIButton = {
        let recover = UIButton(type: .system)
        recover.backgroundColor = .systemBlue
        recover.setTitle("Recover", for: .normal)
        recover.setTitleColor(.white, for: .normal)
        recover.layer.cornerRadius = 10
        recover.layer.masksToBounds = false
        recover.addTarget(self, action: #selector(recoverButtonTapped), for: .touchUpInside)
        return recover
    }()
    
    @objc fileprivate func recoverButtonTapped() {
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
            if cpfTextField.text == "" {
                shakeAnimation()
            } else {
                SCLAlertView().showSuccess("Success", subTitle: "Soon you will receive an e-mail with corfimation of the recovered data")
            }
        }
    }
    
    // MARK: - Animations
    
    func shakeAnimation() {
        
        let animation = CABasicAnimation(keyPath: "shake")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: cpfTextField.center.x - 4, y: cpfTextField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: cpfTextField.center.x + 4, y: cpfTextField.center.y))
        
        cpfTextField.layer.add(animation, forKey: "shake")
        cpfTextField.layer.borderWidth = 0.8
        cpfTextField.textColor = .systemRed
        cpfTextField.layer.borderColor = UIColor.systemRed.cgColor
    }
}

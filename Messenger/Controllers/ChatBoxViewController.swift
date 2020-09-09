//
//  ChatBox.swift
//  Messenger
//
//  Created by Gustavo on 31/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class ChatBoxViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarViewController()
        view.backgroundColor = .white
        messageTextField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(textView)
        view.addSubview(messageTextField)
        messageTextField.addSubview(sendMessageButton)
        
        NSLayoutConstraint.activate([
            messageTextField.width(300),
            messageTextField.height(50),
            messageTextField.leadingToSuperview(),
            messageTextField.trailingToSuperview(),
            messageTextField.bottomToSuperview(offset: -49, usingSafeArea: true),
            
            sendMessageButton.width(30),
            sendMessageButton.height(30),
            sendMessageButton.centerYToSuperview(),
            sendMessageButton.trailingAnchor.constraint(equalTo: messageTextField.trailingAnchor, constant: -20)
        ])
    }
    
    // MARK: - UITextFieldDelegate
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - UITabBarController
    
    func tabBarViewController() {
        
        let tabBar = UITabBarController()
        tabBar.tabBar.barTintColor = .white
        tabBar.tabBar.tintColor = .systemBlue
        
        let firstView = UIViewController()
        let secondView = UIViewController()
        let thirdView = UIViewController()
        let fourthView = UIViewController()
        let fifthView = UIViewController()
        
        let firstItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let secondItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        let thirdItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        let fourthItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 3)
        let fifthItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 4)
        
        firstView.tabBarItem = firstItem
        secondView.tabBarItem = secondItem
        thirdView.tabBarItem = thirdItem
        fourthView.tabBarItem = fourthItem
        fifthView.tabBarItem = fifthItem
        
        tabBar.viewControllers = [firstView, secondView, thirdView, fourthView, fifthView]
        
        view.addSubview(tabBar.view)
    }
    
    // MARK: - SendMessageTextField
    
    let messageTextField : UITextField = {
        let message = UITextField()
        message.placeholder = " Type your message ..."
        message.borderStyle = UITextField.BorderStyle.roundedRect
        message.layer.cornerRadius = 10
        message.layer.masksToBounds = false
       return message
    }()
    
    // MARK: - UITextViewController
    
    let textView : UITextView = {
        let textView = UITextView()
        textView.textColor = .white
        textView.textAlignment = .center
        textView.layer.cornerRadius = 10
        textView.layer.masksToBounds = false
        textView.backgroundColor = .systemBlue
        textView.font = .init(descriptor: .preferredFontDescriptor(withTextStyle: .subheadline), size: 15)
        textView.translatesAutoresizingMaskIntoConstraints = false
       return textView
    }()
    
    // MARK: - UIButtonSendMessage
    
    let sendMessageButton : UIButton = {
        let sendMessageButton = UIButton(type: .system)
        sendMessageButton.setImage(UIImage(named: "send"), for: .normal)
        sendMessageButton.setTitleColor(.blue, for: .normal)
        sendMessageButton.translatesAutoresizingMaskIntoConstraints = false
        sendMessageButton.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
        return sendMessageButton
    }()
    
    @objc func showMessage() {
        
        if textView.text == "" {
            adjustUITextViewHeight(adjust: textView)
            textView.text = "\(messageTextField.text!)"
            textView.topToSuperview(offset: 20, usingSafeArea: true)
            textView.trailingToSuperview(offset: 20, usingSafeArea: true)
        }
    }
    
    func adjustUITextViewHeight(adjust: UITextView) {
        adjust.sizeToFit()
        adjust.isScrollEnabled = false
        adjust.translatesAutoresizingMaskIntoConstraints = true
    }
}


//
//  ContactsViewController.swift
//  Messenger
//
//  Created by Gustavo on 12/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    let tabBar = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarViewController()
        view.backgroundColor = .lightGray
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(handleLogout))
    }
    
    @objc func handleLogout() {
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
    
    func tabBarViewController() {
        
        let firstView = UIViewController()
        firstView.view.backgroundColor = .green
        
        let secondView = UIViewController()
        secondView.view.backgroundColor = .yellow
        
        let firstItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let secondItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        firstView.tabBarItem = firstItem
        secondView.tabBarItem = secondItem
        
        tabBar.viewControllers = [firstView, secondView]
        
        self.view.addSubview(tabBar.view)
    }
}

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
        
        navigationButtons()
        tabBarViewController()
    }
    
    // MARK: - NavigationViewController
    
    func navigationButtons() {
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(.add, for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(logout))
    }
    
    @objc func logout() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - TabBarViewController
    
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

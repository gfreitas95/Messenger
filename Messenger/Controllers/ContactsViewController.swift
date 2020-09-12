//
//  ContactsViewController.swift
//  Messenger
//
//  Created by Gustavo on 12/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit
import TinyConstraints

class ContactsViewController: UIViewController, UISearchBarDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController()
        tabBarViewController()
        collectionView.delegate = self
        collectionView.dataSource = self
        searchController.searchBar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.height(100),
            collectionView.topToSuperview(offset: 10, usingSafeArea: true),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Target Action
    
    @objc func logout() {
        navigationController?.popViewController(animated: false)
    }
    
    // MARK: - UINavigationController
    
    func navigationController() {
        navigationItem.title = "Contacts"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    // MARK: - UISearchBarController
    
    let searchController = UISearchController(searchResultsController: nil)
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchTexte: String) {
        
    }
    
    // MARK: - TabBarController
    
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
    
    // MARK: - FriendsDictionary
        
    let friendsImage = [CustomData(image: #imageLiteral(resourceName: "alberto")), CustomData(image: #imageLiteral(resourceName: "renato")), CustomData(image: #imageLiteral(resourceName: "jaque")), CustomData(image: #imageLiteral(resourceName: "pedro")), CustomData(image: #imageLiteral(resourceName: "loren")), CustomData(image: #imageLiteral(resourceName: "renata")), CustomData(image: #imageLiteral(resourceName: "reis")), CustomData(image: #imageLiteral(resourceName: "felipe")), CustomData(image: #imageLiteral(resourceName: "fabio"))]

    // MARK: - UICollectionViewController
    
    let collectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ContactsCell.self, forCellWithReuseIdentifier: "ContactsCell")
        return collectionView
    }()
}

extension ContactsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactsCell", for: indexPath) as! ContactsCell
        cell.data = self.friendsImage[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
           let chatBox = ChatBoxViewController()
           self.navigationController?.pushViewController(chatBox, animated: true)
       }
}

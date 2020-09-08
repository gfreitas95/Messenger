//
//  ContactsCell.swift
//  Messenger
//
//  Created by Gustavo on 19/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

struct CustomData {
    var image : UIImage
}

class ContactsCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            friendsImage.image = data.image
        }
    }
    
    let friendsImage: UIImageView = {
        let friendsImage = UIImageView()
        friendsImage.image = UIImage(named: "logo")
        friendsImage.clipsToBounds = true
        friendsImage.layer.borderWidth = 5
        friendsImage.layer.masksToBounds = false
        friendsImage.contentMode = .scaleAspectFit
        friendsImage.layer.borderColor = UIColor.green.cgColor
        friendsImage.layer.cornerRadius = friendsImage.frame.size.width / 2
        friendsImage.translatesAutoresizingMaskIntoConstraints = false
       return friendsImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(friendsImage)
        friendsImage.frame = contentView.bounds
        friendsImage.layoutIfNeeded()
        
        NSLayoutConstraint.activate([
        friendsImage.topAnchor.constraint(equalTo: contentView.topAnchor),
        friendsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        friendsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        friendsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

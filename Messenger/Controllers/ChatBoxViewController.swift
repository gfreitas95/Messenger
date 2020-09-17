//
//  ChatBox.swift
//  Messenger
//
//  Created by Gustavo on 31/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit
import MessageKit

struct Message: MessageType {
    
    var sentDate: Date
    var messageId: String
    var kind: MessageKind
    var sender: SenderType
}

struct Sender: SenderType {
    
    var photoUrl: String
    var senderId: String
    var displayName: String
}

class ChatBoxViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        messages.append(Message(sentDate: Date(), messageId: "1", kind: .text("Hello"), sender: selfSender))
        messages.append(Message(sentDate: Date(), messageId: "1", kind: .text("It's me, Mario !"), sender: selfSender))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
            navigationController?.navigationBar.backgroundColor = .tertiarySystemBackground
        } else {
            view.backgroundColor = .white
            navigationController?.navigationBar.backgroundColor = .white
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    private var messages = [Message]()
    private let selfSender = Sender(photoUrl: "", senderId: "1", displayName: "")

    func currentSender() -> SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
}

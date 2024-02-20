//
//  MessageDataSource.swift
//  MyMessage
//
//  Created by palphone ios on 2/19/24.
//

import Foundation
import MessageKit


extension ChatViewController: MessagesDataSource {
    
    func currentSender() -> MessageKit.SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return mkMessages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        mkMessages.count
    }
    
}

//
//  IncomingMessage.swift
//  MyMessage
//
//  Created by palphone ios on 2/20/24.
//

import Foundation
import MessageKit
import CoreLocation


class IncomingMessage {
    
    var messageCollectionView: MessagesViewController
    init(_collectionView: MessagesViewController) {
        messageCollectionView = _collectionView
    }
    
    //MARK: - CreateMessage
    
    func createMessage(localMessage: LocalMessage) -> MKMessage? {
        
        
        let mkMessage = MKMessage(message: localMessage)
        //multimedia messages
        return mkMessage
        
        
        
    }
    
}

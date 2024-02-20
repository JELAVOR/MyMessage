//
//  FirebaseMessageListener.swift
//  MyMessage
//
//  Created by palphone ios on 2/20/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class FirebaseMessageListener {
    static let shared = FirebaseMessageListener()
    private init() {}
    
   
   //MARK: - Add, Update, Delete
    func addMessage(_ message: LocalMessage, memberId: String) {
        
        do {
            let _ = try FirebaseReference(.Message).document(memberId).collection(message.chatRoomId).document(message.id).setData(from: message)
            
        } catch {
            print("error saving message", error.localizedDescription)
        }
        
    }
    
    
    
    
}

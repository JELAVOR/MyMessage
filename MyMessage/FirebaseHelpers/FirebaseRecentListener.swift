//
//  FirebaseRecentListener.swift
//  MyMessage
//
//  Created by palphone ios on 2/17/24.
//

import Foundation
import Firebase




class FirebaseRecentListener {
    static let shared = FirebaseRecentListener()
    private init() {}
    
    func downloadRecentChatsFromFirestore(completion: @escaping (_ allRecents: [RecentChat]) -> Void) {
        FirebaseReference(.Recent).whereField(KSENDERID, isEqualTo: User.currentId).addSnapshotListener { (querySnapshot, error) in
            var recentChats:[RecentChat] = []
            guard let documents = querySnapshot?.documents else  {
                print("no doc for recent chats")
                return
            }
            let allRecents = documents.compactMap { (queryDocumentSnapshot) -> RecentChat? in
                return try? queryDocumentSnapshot.data(as: RecentChat.self)
            }

            for recent in allRecents {
                if recent.lastMessage != "" {
                    recentChats.append(recent)
                }
            }
            recentChats.sorted(by: { $0.date! > $1.date! })
            completion(recentChats)

        }
    }
    
    func resetRecentCounter(chatRoomId: String) {
        FirebaseReference(.Recent).whereField(KCHATROOMID, isEqualTo: chatRoomId).whereField(KSENDERID, isEqualTo: User.currentId).getDocuments { (querySnapshot, error) in
            
            guard let documents = querySnapshot?.documents else {
                print("no doc for recent")
                return
            }
            let allRecent = documents.compactMap { (queryDocumentSnapshot) -> RecentChat? in
                return try? queryDocumentSnapshot.data(as: RecentChat.self)
            }

            if allRecent.count > 0 {
                self.clearUnreadCounter(recent: allRecent.first!)
            }

        }
    }
    
    
    
    
   
    func clearUnreadCounter(recent: RecentChat) {
        var newRecent = recent
        
        newRecent.unreadCounter = 0
        self.saveRecent(newRecent)
    }
    
    
    
    
    
    func saveRecent(_ recent: RecentChat) {
        
        do {
         try FirebaseReference(.Recent).document(recent.id).setData(from: recent)

        }
        catch {
            print("error saving recent chat", error.localizedDescription)
        }
    }
    
    
    func deleteRecent(_ recent: RecentChat) {
        FirebaseReference(.Recent).document(recent.id).delete()
    }
    
    
    
    
    
    
    
    
    
}

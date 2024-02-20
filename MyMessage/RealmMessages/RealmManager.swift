//
//  RealmManager.swift
//  MyMessage
//
//  Created by palphone ios on 2/19/24.
//

import Foundation
import RealmSwift


class RealmManager {
    
    static let shared = RealmManager()
    let realm = try! Realm()
    
    private init() {}
    
    
    func saveToRealm <T: Object> (_ object: T) {
        
        do {
            try realm.write {
                realm.add(object, update: .all)
            }
        } catch {
            print("Error saving realm object", error.localizedDescription)
        }
    }
}

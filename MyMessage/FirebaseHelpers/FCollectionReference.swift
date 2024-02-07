//
//  FCollectionReference.swift
//  MyMessage
//
//  Created by palphone ios on 2/5/24.
//

import Foundation
import FirebaseFirestore



enum FCollectionReference: String {
    
    case User
    case Recent

}







func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference{
    
    return
    
    Firestore.firestore().collection(collectionReference.rawValue)
}

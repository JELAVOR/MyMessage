//
//  GlobalFunctions.swift
//  MyMessage
//
//  Created by palphone ios on 2/12/24.
//

import Foundation


func fileNameFrom(fileurl: String) -> String {
    
   
    return ((fileurl.components(separatedBy: "_").last)!.components(separatedBy: "?").first!).components(separatedBy: ".").first!
    
    
    
    
}

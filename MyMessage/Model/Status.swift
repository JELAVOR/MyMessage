//
//  Status.swift
//  MyMessage
//
//  Created by palphone ios on 2/13/24.
//

import Foundation

enum Status: String {
    
    case Available = "Available"
    case Busy = "Busy"
    case AtSchool = "At School"
    case AtTheMovie = "At The Movie"
    case AtWorks = "At Works"
    case BatteryAboutToDie = "Battery About to die"
    case CantTalk = "Cant Talk"
    case InAMeeting = "In a Meeting"
    case AtThegym = "At the gym"
    case Sleeping = "Sleeping"
    case UrgentCallsOnly = "Urgent calls only"
    
    
    static var array: [Status] {
        
        var a: [Status] = []
        switch Status.Available {
            
        case .Available:
            a.append(.Available); fallthrough
        case .Busy:
            a.append(.Busy); fallthrough
        case .AtSchool:
            a.append(.AtSchool); fallthrough
        case .AtTheMovie:
            a.append(.AtTheMovie); fallthrough
        case .AtWorks:
            a.append(.AtWorks); fallthrough
        case .BatteryAboutToDie:
            a.append(.BatteryAboutToDie); fallthrough
        case .CantTalk:
            a.append(.CantTalk); fallthrough
        case .InAMeeting:
            a.append(.InAMeeting); fallthrough
        case .AtThegym:
            a.append(.AtThegym); fallthrough
        case .Sleeping:
            a.append(.Sleeping); fallthrough
        case .UrgentCallsOnly:
            a.append(.UrgentCallsOnly);
        return a
        }
    }
}

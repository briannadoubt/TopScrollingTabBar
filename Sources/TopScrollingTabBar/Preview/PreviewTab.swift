//
//  PreviewTab.swift
//  TopScrollingTabBar
//
//  Created by Bri on 1/10/23.
//

import Foundation

enum PreviewTab: String, TopTab {
    case saved
    case booked
    case pending
    case confirmed
    case archived
    case reallyLong

    var id: String {
        rawValue
    }

    var title: String {
        switch self {
        case .saved:
            return "Saved"
        case .booked:
            return "Booked"
        case .pending:
            return "Pending"
        case .confirmed:
            return "Confirmed"
        case .archived:
            return "Archived"
        case .reallyLong:
            return "Really long title that is really super long"
        }
    }
}

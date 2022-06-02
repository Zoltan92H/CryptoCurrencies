//
//  HapticManager.swift
//  CryptoCurrencies
//
//  Created by Zoltán Hidegkuti on 2022. 05. 17..
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}

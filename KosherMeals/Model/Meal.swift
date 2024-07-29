//
//  Meal.swift
//  KosherMeals
//
//  Created by julie ryan on 29/07/2024.
//

import Foundation
import Foundation
import SwiftData

@Model
final class Meal {
    
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

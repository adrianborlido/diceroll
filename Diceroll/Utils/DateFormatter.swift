//
//  DateFormatter.swift
//  Diceroll
//
//  Created by Adrian Borlido on 3/8/20.
//  Copyright © 2020 Adrian Borlido. All rights reserved.
//

import Foundation

class Formatter {
    private var dateformatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter
    }
    
    func formatDate(_ date: Date) -> String {
        return dateformatter.string(from: date)
    }
}

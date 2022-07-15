//
//  Date.swift
//  ShoopCore
//
//  Created by Hesham Ali on 8/14/21.
//  Copyright © 2021 Shoop. All rights reserved.
//

import Foundation

extension Date {
    public func offsetFormatted(from date: Date) -> String {
        let components = Calendar.current.dateComponents([.day, .hour, .minute], from: self, to: date)
        let day = components.day ?? 0
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        var dayString = "", hoursString = "", minutesString = ""
        if day > 0 {
            dayString = "\(day) days "
        }
        
        if hour > 0 {
            hoursString = "\(hour) hrs "
        }
        
        if minute > 0 && dayString.isEmpty {
            minutesString = "\(minute) mins"
        }
        return dayString + hoursString + minutesString
    }
}

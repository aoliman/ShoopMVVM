//
//  Date+extension.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh on 9/10/21.
//  Copyright © 2021 Shoop. All rights reserved.
//

import Foundation

extension Date {
    /// Retruns the date formatter with the default configuration
    ///
    public static func formatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }
}

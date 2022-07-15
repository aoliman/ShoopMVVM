//
//  DateFormatter.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh on 9/10/21.
//  Copyright © 2021 Shoop. All rights reserved.
//

import Foundation

public struct ShoopDateFormatter {
    public static func formate(date: Date, with pattern: DatePattern) -> String {
        let dateFormatter        = DateFormatter()
        dateFormatter.locale     = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = pattern.rawValue
        return dateFormatter.string(from: date)
    }
    public static func date(from string: String, with pattern: DatePattern = DatePattern.json) -> Date? {
        let jsonDateFormat = pattern.rawValue
        let formatter = Date.formatter()
        formatter.dateFormat = jsonDateFormat
        return formatter.date(from: string)
    }
}
public enum DatePattern: String {
    /// format: "yyyy-MM-dd'T'HH:mm:ss" as a  default format from backend
    case json = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    case json2 = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    /// format: "yyyy-MM-dd"
    case yyyyDashMMDashdd = "yyyy-MM-dd"
    /// formate: "yyyy-MM-dd'T'HH:mm:ss"
    case yyyyDashMMDashddhhmmss = "yyyy-MM-dd'T'HH:mm:ss"
    /// format: "yyyy/MM/dd"
    case yyyySlashMMSlashdd = "yyyy/MM/dd"
    /// format: "MMMM yyyy"
    case MMMMSpaceyyyy = "MMMM yyyy"
    /// format: "MM/yyyy"
    case MMSlashyyyy = "MM/yyyy"
    /// format: "MMMM dd"
    case MMMMSpacedd = "MMMM dd"
    /// format: "dd/MM/yyyy"
    case ddMMYYYY = "dd/MM/yyyy"
    /// format: "dd/MM/yy"
    case ddMMYY = "dd/MM/yy"
    /// format: "ddMMyyyy"
    case ddMMyyyy = "ddMMyyyy"
    /// format: "MM/dd/yyyy"
    case MMddYYYY = "MM/dd/yyyy"
    /// format: "MMMM"
    case MMMM = "MMMM"
    /// format: "MMM"
    case MMM = "MMM"
    /// format: "dd MMM" 
    case ddMMM = "dd MMM"
    /// ex: 12
    case dd = "dd"
    case MMyyyy = "MM-yy"
    /// format: "MMM yyyy"
    case MMMSpaceyyyy = "MMM yyyy"
    /// ex: Monday
    case EEEE = "EEEE"
    /// ex: Saturday 25 February 2021 10:00 AM
    case EEEEddMMMMyyyHHmma = "EEEE dd MMMM yyyy HH:mm a"
    case time = "HH:mm a"
    case dateTime
}

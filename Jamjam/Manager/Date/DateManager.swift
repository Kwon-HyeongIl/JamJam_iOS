//
//  DateManager.swift
//  Jamjam
//
//  Created by 권형일 on 7/6/25.
//

import Foundation

class DateManager {
    // ex: "오후 12:00"
    static func isoToMinuteTime(_ isoString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withFullDate,
            .withTime,
            .withDashSeparatorInDate,
            .withColonSeparatorInTime,
            .withFractionalSeconds
        ]
        isoFormatter.timeZone = TimeZone.current
        
        let date = isoFormatter.date(from: isoString) ?? Date()
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "a hh:mm"
        return formatter.string(from: date)
    }
    
    // ex: "2025. 07. 06 (일)
    static func isoToDate(_ isoString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withFullDate,
            .withTime,
            .withDashSeparatorInDate,
            .withColonSeparatorInTime,
            .withFractionalSeconds
        ]
        isoFormatter.timeZone = TimeZone.current
        
        let date = isoFormatter.date(from: isoString) ?? Date()
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy. MM. dd (EEE)"
        return formatter.string(from: date)
    }
    
    static func isoToRelativeTime(_ isoString: String?) -> String {
        guard let isoString else { return "" }
        
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withFullDate,
            .withTime,
            .withDashSeparatorInDate,
            .withColonSeparatorInTime,
            .withFractionalSeconds
        ]
        isoFormatter.timeZone = TimeZone.current
        
        guard let date = isoFormatter.date(from: isoString) else {
            return isoString
        }
        
        let diff   = Date().timeIntervalSince(date)
        let minute = 60.0
        let hour   = 60 * minute
        let day    = 24 * hour
        
        switch diff {
        case 0..<minute:
            return "방금 전"
        case minute..<hour:
            return "\(Int(diff / minute))분 전"
        case hour..<day:
            return "\(Int(diff / hour))시간 전"
        case day..<(day * 7):
            return "\(Int(diff / day))일 전"
        default:
            let df = DateFormatter()
            df.locale = Locale(identifier: "ko_KR")
            df.dateFormat = "yyyy.MM.dd."
            return df.string(from: date)
        }
    }
}

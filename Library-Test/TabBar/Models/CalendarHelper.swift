//
//  CalendarHelper.swift
//  Library-Test
//
//  Created by sejin on 2022/07/08.
//

import Foundation

class CalendarHelper {
    
    let calendar = Calendar.current
    
    /// e.g.) 15 Jan 2022 -> 15 Feb 2022
    func plusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    /// e.g.) 15 Jan 2022 -> 15 Dec 2021
    func minusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    /// e.g.) 15 Jan 2022 -> January
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL" // "2022"
        return dateFormatter.string(from: date)
    }
    
    /// e.g.) 15 Jan 2022 -> 2022
    func yearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy" // "2022"
        return dateFormatter.string(from: date)
    }
    
    /// e.g.) 15 Jan 2022 -> 31
    func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    /// e.g.) 2 Jan 2022 -> 2
    func dayOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    /// e.g.) 15 Jan 2022 -> 1 Jan 2022
    func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    /// e.g.) 1 Jan 2022 -> 6 (saturday)
    func weekDay(date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
    
}

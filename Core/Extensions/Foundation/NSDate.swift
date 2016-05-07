//
//  NSDate.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public extension NSDate {
    
    convenience init(dateString: String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval:0, sinceDate:d)
    }
    
    convenience init(day: Int, month: Int, year: Int) {
        var monthString: String = "\(month)"
        var dayString: String = "\(day)"
        if month < 10 {
            monthString = "0\(month)"
        }
        if day < 10 {
            dayString = "0\(day)"
        }
        self.init(dateString: "\(year)-\(monthString)-\(dayString)")
    }
    
    public func getWeekDay() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
        return dateFormatter.stringFromDate(self)
    }
    
    public func addDays(daysToAdd: Int) -> NSDate {
        let secondsInDays: NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
        return self.dateByAddingTimeInterval(secondsInDays)
    }
    
    public func addHours(hoursToAdd: Int) -> NSDate {
        let secondsInHours: NSTimeInterval = Double(hoursToAdd) * 60 * 60
        return self.dateByAddingTimeInterval(secondsInHours)
    }
}

extension NSDate: Comparable {}

public func < (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedAscending
}

public func > (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedDescending
}

public func == (lhs: NSDate, rhs: NSDate) -> Bool {
    return NSCalendar.currentCalendar().compareDate(lhs, toDate: rhs, toUnitGranularity: NSCalendarUnit.Second) == .OrderedSame
}

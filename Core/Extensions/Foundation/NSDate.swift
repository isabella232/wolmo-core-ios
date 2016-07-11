//
//  NSDate.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public extension NSDate {
    
    /**
     Creates a Date from a string.
     
     - parameter dateString: The date string representation.
     */
    convenience init(dateString: String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval:0, sinceDate:d)
    }
    
    /**
     Creates a Date from a day, month and year.
     
     - seealso: init(dateString: String)
     */
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
    
    /**
     Returns the current day of the week (ex: Monday).
     */
    public func getWeekDay() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
        return dateFormatter.stringFromDate(self)
    }
    
    /**
     Returns a new date that is set to a given number of days relative to the date.
     
     - seealso: dateByAddingTimeInterval()
     */
    public func adding(days days: Int) -> NSDate {
        let secondsInDays = Double(days) * 60 * 60 * 24
        return dateByAddingTimeInterval(secondsInDays)
    }
    
    /**
     Returns a new date that is set to a given number of hours relative to the date.
     
     - seealso: dateByAddingTimeInterval()
     */
    public func adding(hours hours: Int) -> NSDate {
        let secondsInHours: NSTimeInterval = Double(hours) * 60 * 60
        return dateByAddingTimeInterval(secondsInHours)
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

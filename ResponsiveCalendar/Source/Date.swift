//
//  Date.swift
//  ResponsiveCalendar
//
//  Created by zzp on 15/7/27.
//  Copyright (c) 2015年 zzp. All rights reserved.
//

import Foundation

class Date : NSObject {//, Printable{
    
    var day: Int
    var month: Int
    var year: Int
    var weekday: Int
    
    init(date: NSDate){
//        let components = dayMonthYearComponents(date)
        day = date.day()
        month = date.month()
        year = date.year()
        weekday = date.weekday()
    }
    
    convenience init(day: Int, month: Int, year: Int){
//        var date = self.toNSDate(day, month: month, year: year)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let dateString = String(format: "%04d%02d%02d", arguments: [ year, month, day ])
        let date = dateFormatter.dateFromString(dateString)
        self.init(date: date!)
    }
    
    
    func toNSDate() -> NSDate?{
        return toNSDate(self.day, month: self.month, year: self.year)
    }
    private func toNSDate(day: Int, month: Int, year: Int) -> NSDate?{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let dateString = String(format: "%04d%02d%02d", arguments: [ year, month, day ])
        return dateFormatter.dateFromString(dateString)
    }
    
    override var description: String{
        return "\(self.year)-\(self.month)-\(self.day): \(self.weekday)"
    }
}

func ==(lhs: Date, rhs: Date) -> Bool{
    return (lhs.day == rhs.day && lhs.month == rhs.month && lhs.year == rhs.year)
}
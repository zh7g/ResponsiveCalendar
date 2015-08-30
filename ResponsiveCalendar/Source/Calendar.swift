//
//  Calendar.swift
//  ResponsiveCalendar
//
//  Created by zzp on 15/7/28.
//  Copyright (c) 2015年 zzp. All rights reserved.
//

import Foundation

class Calendar {
    
    private static let instance = Calendar()
    let numberOfDaysInPage = 42
    
    class func sharedCalendar() -> Calendar{
        return instance
    }
    
    var baseDate: NSDate
    
    private init(date: NSDate){
        baseDate = date
    }
    
    private convenience init(){
        self.init(date: NSDate())
    }
    
    var days: [Date]{
        var dates: [Date] =  []
        let calendar = NSCalendar.currentCalendar()
        var components = calendar.components([.Year, .Month, .Day], fromDate: baseDate)
        components.day = 1
        let firstDayOfMonth = Date(date: calendar.dateFromComponents(components)!)
        
        components = calendar.components([.Year, .Month], fromDate: baseDate)
        components.month += 1
        components.day = 0
        let lastDayOfMonth = Date(date: calendar.dateFromComponents(components)!)
        
        var numberOfLeadingDays = firstDayOfMonth.weekday - 1
        let numberOfTailingDays = numberOfDaysInPage - lastDayOfMonth.day - numberOfLeadingDays
        
        if numberOfLeadingDays > 0{
            let components = NSDateComponents()
            components.day = 0
            components.month = firstDayOfMonth.month
            components.year = firstDayOfMonth.year
            let lastDayOfPreviousMonth = Date(date: calendar.dateFromComponents(components)!)
            while --numberOfLeadingDays >= 0{
                dates.append(Date(day: lastDayOfPreviousMonth.day - numberOfLeadingDays, month: lastDayOfPreviousMonth.month, year: lastDayOfPreviousMonth.year))
            }
        }
        for day in firstDayOfMonth.day...lastDayOfMonth.day{
            dates.append(Date(day: day, month: firstDayOfMonth.month, year: firstDayOfMonth.year))
        }
        
        let firstDayOfNextMonth = Date(date: calendar.dateByAddingUnit(.Day, value: 1, toDate: lastDayOfMonth.toNSDate()!, options: [])!)
        
        for day in 1...numberOfTailingDays{
            dates.append(Date(day: day, month: firstDayOfNextMonth.month, year: firstDayOfNextMonth.year))
        }
        Swift.print(dates)
        return dates
    }
    
    func previousMonth() {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: baseDate)
        components.day = 1
        components.month -= 1
        baseDate = calendar.dateFromComponents(components)!
    }
    
    func nextMonth() {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: baseDate)
        components.day = 1
        components.month += 1
        baseDate = calendar.dateFromComponents(components)!
    }
    
}
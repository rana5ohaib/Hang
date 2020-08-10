//
//  DateManager.swift
//  Hang
//
//  Created by Devfactori II on 8/10/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import Foundation

class DateManager: NSObject {
    
    class var sharedInstance: DateManager {
        
        struct Static {
            static let instance: DateManager = DateManager()
        }
        return Static.instance
    }
    
    //MARK:- CurrentDateTimeFromString
    func currentDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from:Date())
        return dateString
    }
    
    //MARK:- StringToDateConversion
    func stringToDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        
        if let date = dateFormatter.date(from: dateString){
            return date
        }
        else {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: dateString){
                return date
            }
        }
        return Date()
    }
    
    //MARK:- StringToDateConversion
    func stringToDateShort(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        
        if let date = dateFormatter.date(from: dateString){
            return date
        }
        else {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: dateString){
                return date
            }
        }
        return Date()
    }
    
    //MARK:- DateToString
    func dateToString(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from:date)
        return dateString
    }
    
    func dateToStringFromServer(date:String) -> String {
        let dateFromString = self.stringToDate(dateString: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let dateString = dateFormatter.string(from:dateFromString)
        return dateString
    }
    
    func dateToStringFromServerOnHistoryEdit(date:String) -> String {
        let dateFromString = self.stringToDate(dateString: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from:dateFromString)
        return dateString
    }
    
    func dateToStringForPicker(date:String) -> String {
        let dateFromString = self.stringToDateForPicker(dateString: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let dateString = dateFormatter.string(from:dateFromString)
        return dateString
    }
    
    func dateToStringForDateDone(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from:date)
        return dateString
    }

    
    //MARK:- StringToDateConversion
    func stringToDateForPicker(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        if let date = dateFormatter.date(from: dateString){
            return date
        }
        return Date()
    }
    
    func stringToDateForHealthKit(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        if let date = dateFormatter.date(from: dateString){
            return date
        }
        return Date()
    }
    
    //MARK:- Date for sending Age in family API
    func dateToStringForFamilyAPI(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from:date)
        return dateString
    }
    
    //MARK:- Date for sending Age in family API
    func returnToWorkDateForChildCare(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        let dateString = dateFormatter.string(from:date)
        let selectedDate = self.stringToDate(dateString: dateString)
        return self.dateToStringForDateDone(date:selectedDate)
    }
    
    //MARK:- Date for sending in My info API
    func dateToStringForSendingMyInfoInAPI(date:String) -> String {
        let dateFromString = self.stringToDateForMyInfoAPI(dateString: date)
       return self.dateToStringForFamilyAPI(date: dateFromString)
    }
    
    func dateToCheckServerDate(date:String) -> String {
        let dateFromString = self.stringToDateForMyInfoAPI(dateString: date)
        return self.dateToStringForFamilyAPI(date: dateFromString)
    }
    
    func dateToStringWhenComparingServerDate(date:String) -> String {
        let dateFromString = self.stringToDate(dateString: date)
        return self.dateToStringForFamilyAPI(date: dateFromString)
    }
    
    func stringToDateForMyInfoAPI(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        
        if let date = dateFormatter.date(from: dateString){
            return date
        }
        return Date()
    }
    
    func stringToNSDate(dateFormat dateString: String?) -> NSDate {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        dateFormatter.timeZone = TimeZone.current
        if let dateStrings = dateFormatter.date(from: dateString!){
            return dateStrings as NSDate
        }
        return NSDate()
    }
    
    //MARK:- FormatedStringFromDateStringForAppointments
    func timeForAppointmentWhenAddedFormat(dateString:String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.timeZone = TimeZone(abbreviation:"UTC")
        let dateObj = dateFormatter.date(from: dateString!)
        if dateObj != nil {
            dateFormatter.dateFormat = "h:mm a"
            dateFormatter.timeZone = TimeZone.current
            return dateFormatter.string(from: dateObj!)
        }
        if let dateTimeStr = dateString {
            if dateTimeStr.count > 0 {
                return dateTimeStr
            }
        }
        return ""
    }
}

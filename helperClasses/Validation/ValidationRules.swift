//
//  ValidationRules.swift
//  Get Beep
//
//  Created by karan singh on 02/12/18.
//  Copyright © 2018 karan singh. All rights reserved.
//

import UIKit

public class ValidationRules: NSObject {

    public class func isBlank(_ object: Any) -> Bool {
        
        if object is UITextField {
            
            let text = (object as! UITextField).text!.trim()
            if text.isEmpty {
                return true
            }
        } else if object is UITextView {
            
            let text = (object as! UITextView).text.trim()
            if text.isEmpty {
                return true
            }
        }
        else if object is UILabel {
            
            let text = (object as! UILabel).text
            if text == "Select Current Trimester" {
                return true
            }
        }else if object is String {
            
            let text = (object as! String).trim()
            if text.isEmpty {
                return true
            }
        }
        return false
    }
    
    public class func isValid(name: String) -> Bool {
        // check the String is between 4 and 16 characters
        if !(4...16 ~= name.trim().count) {
            return false
        }
        
        return true
    }
    
    public class func isValid(email: String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let range = email.trim().range(of: emailRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return !result
    }
    
    public class func isNumber(string : String) -> Bool {
        
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
    public class func isValid(password: String) -> Bool {
        // Alternative Regexes
        
        // 8 characters. One uppercase
        // static let regex = "^(?=.*?[A-Z]).{8,}$"
        //
        // 8 characters. One uppercase. One Lowercase. One number.
        // static let regex = "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[a-z]).{8,}$"
        //
        // no length. One uppercase. One lowercae. One number.
        // static let regex = "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[a-z]).*?$"
        
        let regex = "^.{6,}$"
        
        let range = password.range(of: regex, options:.regularExpression)
        let result = range != nil ? true : false
        return !result
    }
    

    public class func isValid(phoneNumber: String) -> Bool {
        
        //let phoneRegEx = "^\\d{3}-\\d{3}-\\d{4}$"
        //let phoneRegEx = "^\\d{8}$"
        let phoneRegEx = "^\\d{8,14}$"
        let range = phoneNumber.range(of: phoneRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return !result
    }
    
    public class func isValid(url: String) -> Bool {
        
        //var urlRegEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        //let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[urlRegEx])
        //var urlTest = NSPredicate.predicateWithSubstitutionVariables(predicate)
        //return predicate.evaluateWithObject(stringURL)
        
        let urlRegEx = "((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let range = url.range(of: urlRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return !result
    }

    
    public class func isValidTime(startTime: String, endTime: String) -> Bool {
     
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm"
        var date = Date()
        let eventdate = startTime + " " + endTime
        date = formatter.date(from: eventdate)!
        let currentDate = Date()

        return !self.isGreaterThanDate(startDate: date, dateToCompare: currentDate)
    }
 
    
   public class  func isGreaterThanDate(startDate :Date , dateToCompare: Date) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if startDate.compare(dateToCompare as Date) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
}

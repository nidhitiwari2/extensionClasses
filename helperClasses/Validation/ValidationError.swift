//
//  ValidationError.swift
//  Get Beep
//
//  Created by karan singh on 02/12/18.
//  Copyright © 2018 karan singh. All rights reserved.
//

import UIKit

public class ValidationError: NSObject {

    public enum OfType : Error {
        
        case errorWithMessage(message: String)
        
        case empty
        case emptyEmail
        case emptyPassword
        case emptyFirstName
        case emptyLastName
        case emptyOldPassword
        case emptyNewPassword
        case emptyConfirmPassword
        case emptyName
        case emptyUserName
        case emptyMobileCode
        case emptyMobileNumber
        case emptyAddress
        case emptyCity
        case emptyState
        case emptyCountry
        case emptyPostalCode
        case emptyNoOfPassesnger

        
        case validEmail
        case validPassword
        case validConfirmPassword
        case validMobileNumber
        case alreadyExistMobile
        case emptyReviewDetail
        case emptyAccountRenterAccountNo
        case deleteContactAlert
        case deleteContactSuccess
    }
}

extension ValidationError.OfType {
    
    var description: String {
        switch self {
            
        case .errorWithMessage(let message):
            return message

        case .empty:
            return "Cannot be blank."
            
        case .emptyEmail:
            return "Please enter a email address."
        case .emptyPassword:
            return "Password cannot be blank and must be 6 characters long."
            
        case .emptyOldPassword:
            return "Old password cannot be blank."
        case .emptyNewPassword:
            return "New password cannot be blank and must be at least 6 characters long."
        case .emptyConfirmPassword:
            return "Confirm password cannot be blank and must be 6 characters long."
        case .emptyName:
            return "Name cannot be blank."
        case .emptyUserName:
            return "User name cannot be blank."
        case .emptyMobileNumber:
            return "Mobile number is required and can't be empty"
        case .emptyAddress:
            return "Building name or Postal code cannot be blank !"
        case .emptyCity:
            return "City cannot be blank."
        case .emptyState:
            return "State cannot be blank."
        case .emptyCountry:
            return "Country cannot be blank."
        case .emptyPostalCode:
            return "Zip code cannot be blank."
        case .emptyNoOfPassesnger:
            return "Please select number of passenger."
        case .validEmail:
            return "Please enter a valid email address."
        case .validPassword:
            return "Password cannot be blank and must be minimum 6 characters long."
        case .validConfirmPassword:
            return "Password and Confirm Password doesn't match."
            
        case .alreadyExistMobile:
            return "This mobile number already exist."
            
        case .emptyMobileCode:
            return "Mobile code cannot be blank."
        case .validMobileNumber:
            return "Please enter valid phone no. !"
            
        case .emptyFirstName:
            return "Please enter first name."
        case .emptyLastName:
            return "Please enter last name."
        case .emptyReviewDetail:
            return "please enter review."
        case .emptyAccountRenterAccountNo:
            return "Please enter re-enter account number."
        case .deleteContactAlert:
            return "Are You Sure you want to delete Contact ?"
        case .deleteContactSuccess:
            return "Record deleted successfully."


        }
    }
}


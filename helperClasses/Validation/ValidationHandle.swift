//
//  ValidationHandle.swift
//  Get Beep
//
//  Created by karan singh on 02/12/18.
//  Copyright © 2018 karan singh. All rights reserved.
//

import UIKit

public class ValidationHandle: NSObject {
    
    //MARK:-   Validate : Login Form
    
    class func validate(forLogin object: MobileViewController) -> Bool {
        
        if ValidationRules.isBlank(object.txtPhoneNumber) {
            return false
        } else if ValidationRules.isValid(phoneNumber: object.txtPhoneNumber.text ?? "") {
            return false
        }else {
            return true
        }
    }
    
    //MARK:- Validate : Social Login Passward
    class func validate(forSocial object: SocialViewController) -> Bool {
        
        if ValidationRules.isBlank(object.txtPhoneNumber) {
            return false
        } else if ValidationRules.isValid(phoneNumber: object.txtPhoneNumber.text ?? "") {
            return false
        }else {
            return true
        }
    }

    //MARK:-   Validate : Pasword Form

    class func validate(forPassword object: PasswordViewController) -> Bool {
        if ValidationRules.isBlank(object.txtPassword!) {
            return false
        }
        else {
            return true
        }
    }

    class func validate(forRegistration object: SignupViewController) -> Bool {
        if ValidationRules.isBlank(object.txtFirstName!) {
            return false
        }
        else if ValidationRules.isBlank(object.txtLastName!) {
            return false
        }
        else {
         //   object.view.endEditing(true)
            return true
        }
    }
    
    //MARK: Validate Email
    //***
    class func validate(forEmail object: EmailViewController) -> Bool {
        if ValidationRules.isBlank(object.txtEmail!) {
            return false
        }else if ValidationRules.isValid(email: object.txtEmail.text ?? "") {
            return false
        }
        else {
            return true
        }
    }
    
    // Validate for Emergency contact screen
    class func validate(forContact object: AddEmergencyContactViewController) -> Bool {
        if ValidationRules.isBlank(object.txtName!) {
            showAlert(message:ValidationError.OfType.emptyName.description )
            return false
        }
        else if ValidationRules.isBlank(object.txtEmail!) {
            showAlert(message:ValidationError.OfType.emptyEmail.description )
            return false
        }
        else if ValidationRules.isValid(email: object.txtEmail.text ?? "") {
            showAlert(message:ValidationError.OfType.validEmail.description )
            return false
        }
        else if ValidationRules.isBlank(object.txtPhone!) {
            showAlert(message:ValidationError.OfType.emptyAccountRenterAccountNo.description )
            return false
        }
        else if ValidationRules.isValid(phoneNumber: object.txtPhone.text ?? "") {
            showAlert(message:ValidationError.OfType.validMobileNumber.description )
            return false
        }
        else {
            object.view.endEditing(true)
            return true
        }
    }

    //MARK:-   Validate : Message Form
    class func validate(forMessage object: MessagesViewController) -> Bool {
        if ValidationRules.isBlank(object.txtRide!) {
            return false
        }
        else if ValidationRules.isBlank(object.txtReason!) {
            return false
        }
        else {
            return true
        }
    }

}

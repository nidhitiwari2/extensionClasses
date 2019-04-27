//
//  APIConstants.swift
//  Get Beep
//
//  Created by karan singh on 09/12/18.
//  Copyright © 2018 karan singh. All rights reserved.
//

import UIKit

let apiTimeOutTime                                              = 60 //seconds


//MARK:-Urls

//**********************************************************************************
//------------------------------------ All Urls used in API ----------------------------------
//**********************************************************************************


enum Urls : String {
    case baseUrl                                                = "http://52.14.85.175:3000/riders/"
    case rideBaseUrl                                            = "http://52.14.85.175:3000/ride/"

}


//MARK:-Subpath

//**********************************************************************************
//------------------------------------ All subpath used in API ----------------------------------
//**********************************************************************************


enum APISubPath: String {
    
    case login                                                   = "session"
    case signup                                                  = ""
    case exist                                                   = "exist"
    case social                                                  = "social"
    case riderDetail                                             = " "
    case transaction                                             = "transaction"
    case notification                                            = "notification"
    case rateRide                                                = "rateRide"
    case contact                                                 = "contact"
    case reasons                                                 = "reasons"
    case rides                                                   = "rides"
    case sendMsg                                                 = "sendMsg"
}


//MARK:-URLMethod

//**********************************************************************************
//------------------------------------ All URLMethod used in API ----------------------------------
//**********************************************************************************


enum URLMethod: String {
    case post                                                   = "POST"
    case get                                                    = "GET"
    case put                                                    = "PUT"
    case delete                                                 = "DELETE"
}

//MARK:-Messages

//**********************************************************************************
//------------------------------------ All Messages used in API ----------------------------------
//**********************************************************************************


enum APIMessages: String {
    case login                                                   = "user_login"
    case signup                                                  = "user_register"
    
}





//MARK:-Headers

//**********************************************************************************
//------------------------------------ All Headers used in API ----------------------------------
//**********************************************************************************


enum Headers {
    case contentType , allHeaders
    
}

enum APIParams: String {
    case mobile                         =       "mobile"
    case password                       =       "password"
    case userId                         =       "userId"
    case email                          =       "email"
    case fname                          =       "fname"
    case lname                          =       "lname"
    case role                           =       "role"
    case dob                            =       "dob"
    case image                          =       "image"
    case gender                         =       "gender"
    case socialType                     =       "socialType"
    case socialId                       =       "socialId"
    case deviceType                     =       "deviceType"
    case deviceToken                    =       "deviceToken"
    
    case transId                        =       "transId"
    case amount                         =       "amount"
    case state                          =       "state"
    case method                         =       "method"
    case rideId                         =       "rideId"
    case address                        =       "address"
    case fcmToken                       =       "fcmToken"
    case rating                         =       "rating"
    case comment                        =       "comment"
    case name                           =       "name"
    case notify                         =       "notify"
    case phone                          =       "phone"
    case reason                         =       "reason"


}

extension Headers : RawRepresentable {
    typealias RawValue                                          = [String : String]
    init?(rawValue: RawValue) {
        switch rawValue {
        case ["Content-Type": "application/json"] : self        = .contentType
        case ["Content-Type": "application/json"] : self        = .allHeaders
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .contentType: return ["Content-Type": "application/json"]
        case .allHeaders: return  ["Content-Type": "application/json"]
        }
    }
    
}



extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}


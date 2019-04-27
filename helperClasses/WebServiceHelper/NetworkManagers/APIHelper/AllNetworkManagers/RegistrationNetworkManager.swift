//
//  RegistrationNetworkManager.swift
//  Get Beep
//
//  Created by karan singh on 09/12/18.
//  Copyright © 2018 karan singh. All rights reserved.
//

import UIKit

class RegistrationNetworkManager: NSObject {
    
    class func login(credentials:[String:String], completion: @escaping ([String:Any]?, String?)->Void) {
        request(path: .login, method: .get, parameters: nil) { data, error in
            guard let dict = data as? NSDictionary else {
                completion(nil, error?.localizedDescription ?? "Unknown error")
                return
            }
            if let dictSample = dict["data"] as? [String:Any] {
                completion(dictSample , nil)
            } else if let message = dict["message"] as? String {
                completion(nil, message)
            } 
            else {
                completion(nil, "Error parsing response")
            }
        }
    }
    class func login(params:[String:Any], completion: @escaping (UserModel?, String?) -> Void) {
        request(path: .login, method: .post, parameters: params) { data, error in
            guard let dict = data as? NSDictionary else {
                completion(nil, error?.localizedDescription ?? "Unknown error")
                return
            }
            if let errorDict = dict["error"] as? [String:Any] {
                if let message = errorDict["message"] as? String{
                    completion(nil, message)
                }
            }else if let responseDict = dict["data"] as? [String:Any] {
                completion(UserModel(fromDictionary: responseDict), nil)
            }
            else {
                completion(nil, "Error parsing response")
            }
        }
    }

    class func updateFcmToken(params:[String:Any], completion: @escaping (UserModel?, String?) -> Void) {
        request(path: .riderDetail, method: .put, parameters: params) { data, error in
            guard let dict = data as? NSDictionary else {
                completion(nil, error?.localizedDescription ?? "Unknown error")
                return
            }
            if let errorDict = dict["error"] as? [String:Any] {
                if let message = errorDict["message"] as? String{
                    completion(nil, message)
                }
            }else if let responseDict = dict["data"] as? [String:Any] {
                completion(UserModel(fromDictionary: responseDict), nil)
            }
            else {
                completion(nil, "Error parsing response")
            }
        }
    }

    

  class func signUp(params:[String:Any], completion: @escaping (UserModel?, String?) -> Void) {
        request(path: .signup, method: .post, parameters: params) { data, error in
            guard let dict = data as? NSDictionary else {
                completion(nil, error?.localizedDescription ?? "Unknown error")
                return
            }
             if let errorDict = dict["error"] as? [String:Any] {
                if let message = errorDict["message"] as? String{
                    completion(nil, message)
                }
             }else if let responseDict = dict["data"] as? [String:Any] {
                completion(UserModel(fromDictionary: responseDict), nil)
                
             }
             else {
                completion(nil, "Error parsing response")
            }
        }
    }
    
    class func exist(params:[String:Any], completion: @escaping (Bool?, String?) -> Void) {
        request(path: .exist, method: .post, parameters: params) { data, error in
            guard let dict = data as? NSDictionary else {
                completion(nil, error?.localizedDescription ?? "Unknown error")
                return
            }
            if let errorDict = dict["error"] as? [String:Any] {
                if let message = errorDict["message"] as? String{
                    completion(nil, message)
                }
            }
            else if let responseDict = dict["data"] as? [String:Any] {
                if let result = responseDict["isExist"] as? Bool{
                    completion(result, nil)
                }

            }  else {
                completion(nil, "Error parsing response")
            }
        }
    }
    class func socialLogin(params:[String:Any], completion: @escaping (UserModel?, String?) -> Void) {
            request(path: .social, method: .post, parameters: params) { data, error in
            guard let dict = data as? NSDictionary else {
                completion(nil, error?.localizedDescription ?? "Unknown error")
                return
            }
            if let errorDict = dict["error"] as? [String:Any] {
                if let message = errorDict["message"] as? String{
                    completion(nil, message)
                }
            }else if let responseDict = dict["data"] as? [String:Any] {
                completion(UserModel(fromDictionary: responseDict), nil)
                
            }
            else {
                completion(nil, "Error parsing response")
            }
        }
    }

}

//
//  NetworkManager.swift
//  Get Beep
//
//  Created by karan singh on 09/12/18.
//  Copyright © 2018 karan singh. All rights reserved.
//

import UIKit

    //MARK: - Core network
    
     func request(path:APISubPath, method:URLMethod, parameters: [String:Any]?, completion: @escaping(Any?, Error?)->Void) {
        
        var stringUrl = "\(Urls.baseUrl.rawValue)\(path.rawValue)"
        if path == .riderDetail
        {
            stringUrl = "\(Urls.baseUrl.rawValue)\(SharedStorage.getUser().id!)"
        }
        else if path == .notification || path == .rateRide || path == .contact || path == .rides
        {
            stringUrl = "\(Urls.baseUrl.rawValue)\(SharedStorage.getUser().id!)/\(path.rawValue)"
        }

        else if path == .transaction{
                stringUrl = "\(Urls.rideBaseUrl.rawValue)\(parameters!["rideId"] as! String)/\(path.rawValue)"
        }
        else if path == .reasons
        {
            stringUrl = "http://52.14.85.175:3000/\(path.rawValue)"
        }

        if method == .get, let lastPath = parameters?.values.first as? String {
            stringUrl += lastPath
        }
        if (method == .put || method == .delete) && path == .contact {
            stringUrl += "/" + "\(parameters!["userId"] as! String)"
            
        }

        guard let url = URL(string: stringUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        if SharedStorage.accessToken != ""
        {
            request.addValue(SharedStorage.accessToken, forHTTPHeaderField: "access-token")
        }

        if method == .post, let parameters = parameters, let json = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
            request.httpBody = json
            let theJSONText = String(data: json,
                                     encoding: String.Encoding.ascii)
            print("JSON string = \n\(String(describing: theJSONText))")
        }
        if method == .put, let parameters = parameters, let json = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
            request.httpBody = json
            let theJSONText = String(data: json,
                                     encoding: String.Encoding.ascii)
            print("JSON string = \n\(String(describing: theJSONText))")
            
        }
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                completion(nil, error)
                return
            }
            print("response::::",json)
            if let dict = json as? [String:Any], let msg=dict["msg"] as? String
            {
                if msg.trim()=="Invalid token"
                {
                    dissmissHud()
                    DispatchQueue.main.async {
                        SharedStorage.accessToken = ""
                        SharedStorage.isLogin = false
                        SocketIOManager.sharedInstance.closeConnection()
                        
                        let appDel = UIApplication.shared.delegate as! AppDelegate
                        appDel.goToLogin()
                    }
                }
            }else{
                completion(json, nil)
            }
        }).resume()
    }



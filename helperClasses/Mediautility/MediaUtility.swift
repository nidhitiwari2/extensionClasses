//
//  MediaUtility.swift
//  Consumer App
//
//  Created by Vinod KUmar on 23/03/19.
//  Copyright © 2019 Vinod KUmar. All rights reserved.
//

import UIKit
import AVFoundation

class MediaUtility: NSObject,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Shared Instance
    static let shared : MediaUtility = {
        let instance = MediaUtility()
        // setup code
        return instance
    }()
    
    private override init() {}
    
    //MARK:- Local variable for hold completion block
    private var imageCompletionHandler: (UIImage?, Error?)-> Void = { image,error  in }
    
    //MARK:- Local instance property
    var imgPickerController : UIImagePickerController!
    
    
    func pickImage(completionHandler:  @escaping (_ image: UIImage?, _ error: Error?) -> ())
    {
        //Hold completion handler
        imageCompletionHandler = completionHandler
        
        //option selection
        let alert = UIAlertController.init(title: nil, message: "Select option", preferredStyle: .actionSheet)
        
        imgPickerController = UIImagePickerController()
        
        let photoAction = UIAlertAction.init(title: "Photo library", style: .default) { (alert: UIAlertAction) in
            //call helper function
            self.showImagePickerWith(type: .photoLibrary)
        }
        
        let cameraAction = UIAlertAction.init(title: "Camera", style: .default) { (alert: UIAlertAction) in
            //call helper function
            self.cameraOptionSelected()
        }
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel) { (alert: UIAlertAction) in
        }
        
        alert.addAction(photoAction)
        alert.addAction(cameraAction)
        alert.addAction(cancelAction)
        DispatchQueue.main.async(execute: {
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                
                topController.present(alert, animated: true, completion: nil)
                
            }
        })
    }
    
    
    func cameraOptionSelected(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {
                 self.showImagePickerWith(type: .camera)
            } else {
                AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                    if granted {
                         self.showImagePickerWith(type: .camera)
                    } else {
                       self.showCameraPermissionAlert()
                    }
                })
            }
        }
        else{
            showAlert(title: "", message: "Camera not found")
        }
    }
    
    //MARK:- Present Picker
    func showImagePickerWith(type:UIImagePickerController.SourceType){
        imgPickerController.sourceType = type
        imgPickerController.delegate   = self
        DispatchQueue.main.async(execute: {
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.present(self.imgPickerController, animated: true, completion: nil)
            }
        })
    }
    
    func showCameraPermissionAlert(){
        let systemVersion : NSString  = UIDevice.current.systemVersion as NSString
        if systemVersion.floatValue >= 8.0
        {
            let alert=UIAlertController(title: "", message: "Camera permission not enabled.Do you want to give permission?", preferredStyle: .alert)
            
            let yes=UIAlertAction(title: "Yes", style: .default) { (action) in
                self.openSettingApp()
            }
            
            let no=UIAlertAction(title: "No", style: .cancel, handler: nil)
            
            alert.addAction(no)
            alert.addAction(yes)
            DispatchQueue.main.async(execute: {
                if var topController = UIApplication.shared.keyWindow?.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    
                    topController.present(alert, animated: true, completion: nil)
                }
            })
        }
    }
    
    func openSettingApp()
    {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl)
        {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            } else {
                // Fallback on earlier versions
                let success = UIApplication.shared.openURL(settingsUrl)
                print("Open \(settingsUrl): \(success)")
            }
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async {
            picker.dismiss(animated: true, completion: nil)
            self.imageCompletionHandler(nil,nil)
        }
    }
    
    // MARK:- ImagePicker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            DispatchQueue.main.async {
                self.imageCompletionHandler(pickedImage,nil)
                 picker.dismiss(animated: true, completion: nil)
            }
        }else{
            DispatchQueue.main.async {
                self.imageCompletionHandler(nil,nil)
                 picker.dismiss(animated: true, completion: nil)
            }
        }
    }
}


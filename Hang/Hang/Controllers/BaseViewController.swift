//
//  BaseViewController.swift
//  Hang
//
//  Created by Devfactori II on 8/9/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    //==================================
    // MARK: - View Life Cycle
    //==================================
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//==================================
// MARK: - Common Functions
//==================================
extension BaseViewController {
    
    func popController() {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func removePreviousControllers() {
        (navigationController as? AppRootNavigationController)?.removePreviousControllers()
    }
    
    func load(_ flow: AppFlow) {
        
        (navigationController as? AppRootNavigationController)?.load(flow)
        
    }
    
    func initFlow() {
        
        (navigationController as? AppRootNavigationController)?.initSignedInFlow()
        
    }
    
    func statusCodeAlert(_ code: Int) {
        
//        showAlert(withMessage: "statusCode".localized().format(code))
        
    }
    
    func unAuthorizedCase(isPushed: Bool = true) {
        
//        if isPushed {
//            (navigationController as? AppRootNavigationController)?.unAuthorize()
//        } else {
//            (view.window?.rootViewController as? HostViewController)?.navigationBase?.unAuthorize()
//        }
        
    }
    
    func showAlert(withMessage message: String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
    }
    
    func showAlertWithCompletion(withMessage message: String, completion: @escaping (() -> Void)) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            completion()
        }))
        self.present(alert, animated: true)
        
    }
    
    func showAlertWithCustomMessageAndCompletion(withMessage message: String, alertMessage: String, completion: @escaping ((_ success: Bool) -> Void)) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: alertMessage, style: .cancel, handler: {_ in
            completion(true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: {_ in
            completion(false)
        }))
        self.present(alert, animated: true)
        
    }
    
    func checkNotification() {
//        if let notification = AppDefaults.getNotification() {
//            load(.Notification(notification))
//            AppDefaults.removeNotification()
//        }
    }
    
    func removeNotification() {
//        if let user = AppDefaults.getUser(),
//            let type = user.type, type != "primary" {
//            AppDefaults.removeNotification()
//        }
    }
    
    func showActivityIndicator(_ show: Bool) {
//        if show {
//            let size = CGSize(width: 150, height: 150)
//            let color = UIColor.AxiaPurple1
//            let type = NVActivityIndicatorType.ballScaleMultiple
//            let activityView = ActivityData(size: size, type: type, color: color)
//            if !NVActivityIndicatorPresenter.sharedInstance.isAnimating {
//                NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityView, nil)
//            }
//        } else {
//            if NVActivityIndicatorPresenter.sharedInstance.isAnimating {
//                NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
//            }
//        }
    }
}

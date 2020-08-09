//
//  AppRootViewController.swift
//  Hang
//
//  Created by Devfactori II on 8/9/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

enum AppFlow {
    case SignIn
    case SignUp
}

class AppRootNavigationController: UINavigationController {
    
    var onScreen: UIViewController? {
        return viewControllers.last
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupRouting()
    }

}

extension AppRootNavigationController {
    
    func setupRouting() {
        load(.SignUp)
    }
    
    func load(_ flow: AppFlow) {
        
        switch flow {
        case .SignIn:
            break
            
        case .SignUp:
            let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
            pushViewController(storyboard.instantiateInitialViewController(), removePrevious: false)
        }
    }
    
    func initSignedInFlow() {
            
//        if let user = AppDefaults.getUser() {
//            if let screenID = AppDefaults.getScreenIdentifier() {
//                switch screenID {
//                    case 1: load(.MyTasks)
//                    case 2: load(.Resources)
//                    case 3: load(.Questionnaires)
//                    case 4: load(.Profile)
//                    default: break
//                }
//                
//            } else {
//                if let type = user.type, type == "primary" {
//                    load(.MyTasks)
//                } else {
//                    load(.Resources)
//                }
//            }
//        }
        
    }
    
    func pushViewController(_ viewController: UIViewController?, removePrevious: Bool) {
        
        if let controller = viewController {
            pushViewController(controller, animated: !viewControllers.isEmpty)
            if removePrevious { removePreviousControllers() }
        }
    }
    
    func removePreviousControllers() {
        
        for controller in viewControllers {
            if controller != viewControllers.last {
                controller.removeFromParent()
            }
        }
        
    }
}

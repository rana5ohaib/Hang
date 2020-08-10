//
//  AddImagesViewController.swift
//  Hang
//
//  Created by Devfactori II on 8/10/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class AddImagesViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backBtn(_ sender: UIButton) {
        popController()
    }
    
    @IBAction func nextBtnActn(_ sender: Any) {
        performSegue(withIdentifier: "toPermissionsSegueID", sender: nil)
    }
}

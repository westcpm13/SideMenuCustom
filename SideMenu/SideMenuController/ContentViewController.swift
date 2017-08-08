//
//  MainViewController.swift
//  SideMenu
//
//  Created by ptrojan on 28.07.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBAction func menuButtonClicked(_ sender: UIButton) {
     NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.NotificationMenuKey), object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

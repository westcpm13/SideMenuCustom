//
//  MainViewController.swift
//  SideMenu
//
//  Created by ptrojan on 28.07.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func menuClicked(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "toggleMenu"), object: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//
//  ViewController.swift
//  SideMenu
//
//  Created by ptrojan on 28.07.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    private let leftMenuWidth: CGFloat = 108
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.closeMenu(false)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(MasterViewController.toggleMenu), name: NSNotification.Name(rawValue: Constants.NotificationMenuKey), object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(Constants.NotificationMenuKey), object: nil)
    }
    
    func toggleMenu(){
        scrollView.contentOffset.x == 0  ? closeMenu() : openMenu()
    }

    private func closeMenu(_ animated: Bool = true) {
        scrollView.setContentOffset(CGPoint(x: self.leftMenuWidth, y: 0), animated: animated)
    }
    
    private func openMenu() {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

}

extension MasterViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollView.isPagingEnabled = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollView.isPagingEnabled = false
    }
}

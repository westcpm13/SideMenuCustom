//
//  ViewController.swift
//  SideMenu
//
//  Created by ptrojan on 28.07.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    let leftMenuWidth: CGFloat = 108

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.closeMenu(false)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.toggleMenu), name: NSNotification.Name(rawValue: "toggleMenu"), object: nil)
    }
    
    func toggleMenu(){
        scrollView.contentOffset.x == 0  ? closeMenu() : openMenu()
    }

    private func closeMenu(_ animated: Bool = true) {
        scrollView.setContentOffset(CGPoint(x: leftMenuWidth, y: 0), animated: animated)
    }
    
    private func openMenu() {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

    
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollView.isPagingEnabled = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollView.isPagingEnabled = false
    }
}

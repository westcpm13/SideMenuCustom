//
//  MasterViewControllerTests.swift
//  SideMenu
//
//  Created by Pawel Trojan on 08.08.2017.
//  Copyright © 2017 ptrojan. All rights reserved.
//

import XCTest
@testable import SideMenu

class MasterViewControllerTests: XCTestCase {
    
    var masterViewController: MasterViewController?
    
    override func setUp() {
        super.setUp()
        self.masterViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MasterViewController") as? MasterViewController
    }
    
    override func tearDown() {
        self.masterViewController = nil
        super.tearDown()
    }
    
    func testCallAddObserverMethod_ShouldReturnTrue() {
        let mockNotificationCenter = MockNotificationCenter()
        masterViewController?.notifictionCenter = mockNotificationCenter
        _ = masterViewController?.view
        
        XCTAssertEqual(mockNotificationCenter.verifyName, Constants.NotificationMenuKey)
        XCTAssert(mockNotificationCenter.verifyAddObserver)
        
    }
    
    func testCallRemoveObserverMethod_ShouldReturnTrue() {
        var mockMasterViewController: MockMasterViewController? = MockMasterViewController()
        let mockNotificationCenter = MockNotificationCenter()
        mockMasterViewController?.notifictionCenter = mockNotificationCenter
        mockMasterViewController = nil
        
        XCTAssert(mockNotificationCenter.verifyRemoveObserver)
        
    }
    
    func testDeinitCall_ShouldReturnTrue() {
        var mockMasterViewController: MockMasterViewController? = MockMasterViewController()
        mockMasterViewController = nil
        XCTAssertEqual(mockMasterViewController?.calledDeinit, nil)
    }
    
    func testNotificationReceiveMasterViewController() {
        let mockMasterViewController = MockMasterViewController()
        let mockUIScrollView = MockUIScrollView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        mockUIScrollView.contentSize = CGSize(width: 500, height: 500)
        mockMasterViewController.scrollView = mockUIScrollView
        _ = mockMasterViewController.view.addSubview(mockUIScrollView)
        
        let expec = expectation(description: "waiting 5s than notification receive !!!!")
        
        expectation(forNotification: Constants.NotificationMenuKey, object: nil)
        {
            notification in
            expec.fulfill()
            return true
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(Constants.NotificationMenuKey), object: nil)
        
        waitForExpectations(timeout: 5)
        {
            error in
            if let e = error
            {
                XCTFail("\(e.localizedDescription)")
            }
        }
        XCTAssert(mockMasterViewController.notificationReceive)

    }
    
}

class MockUIScrollView: UIScrollView {
    
}

class MockNotificationCenter: NotificationCenter {
    var verifyAddObserver = false
    var verifyRemoveObserver = false
    var verifyName = ""
    
    override func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?) {
        self.verifyAddObserver = true
        self.verifyName = aName?.rawValue ?? ""
    }
    
    override func removeObserver(_ observer: Any, name aName: NSNotification.Name?, object anObject: Any?) {
        self.verifyRemoveObserver = true
    }
}

class MockMasterViewController: MasterViewController {
    var calledDeinit: Bool? = false
    var notificationReceive = false
    
    deinit {
        self.calledDeinit = nil
    }
    override func toggleMenu() {
        print("MockToggle")
        self.notificationReceive = true
    }
    
}



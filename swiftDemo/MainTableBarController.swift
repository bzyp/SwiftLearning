//
//  MainTableViewController.swift
//  swiftDemo
//
//  Created by 镭速iOS on 7/13/21.
//

import UIKit

class MainTableBarController: UITabBarController {

    var homeNav: MainNavigationViewController?
    var mvvmNav: MainNavigationViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController.init()
        homeVC.isShow = true
        homeNav = setupNavgationVC(homeVC)
        
        let mvvmVC = MVVMController.init()
        mvvmNav = setupNavgationVC(mvvmVC)
        
        self.setViewControllers([homeNav!,mvvmNav!], animated: false)
    }

    func setupNavgationVC(_ viewController: UIViewController) -> MainNavigationViewController {
        let nav = MainNavigationViewController(rootViewController: viewController);
        nav.title = "test"
        return nav
    }

}

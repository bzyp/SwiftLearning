//
//  testViewController.swift
//  swiftDemo
//
//  Created by 镭速iOS on 4/2/21.
//

import UIKit

class testViewController: UIViewController {

    let backView :UIView? = nil
    
    override func viewDidLoad() {
    }
    
    public func getName() -> String {
        var i = 0
        repeat{
            i += 1
        }while (i < 5)
        return "name"
    }
    
}

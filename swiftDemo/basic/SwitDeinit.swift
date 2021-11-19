//
//  deinit.swift
//  swiftDemo
//
//  Created by 镭速iOS on 11/12/21.
//  析构过程
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/15_deinitialization

import UIKit

class SwitDeinit: NSObject {

    //析构器只适用于类类型，当一个类的实例被释放之前，析构器会被立即调用。析构器用关键字 deinit 来标示，类似于构造器要用 init 来标示
    deinit {
        // 执行析构过程
    }
    
    
}

//
//  SwiftExtension.swift
//  swiftDemo
//
//  Created by 镭速iOS on 11/22/21.
//

import UIKit

class SwiftExtension: NSObject {

//    添加计算型实例属性和计算型类属性
//    定义实例方法和类方法
//    提供新的构造器
//    定义下标
//    定义和使用新的嵌套类型
//    使已经存在的类型遵循（conform）一个协议

    let home = 3.11.km
    let kfc = 50.m
    
    
    
}

//声明扩展
extension Int {
}

//扩展可以扩充一个现有类型，给他添加协议。
//extension Int: Protocol {
// 协议所需要的实现写在这里
//}

//计算型属性
extension Double {
    var km: Double { return self * 1000.0 }
    var m: Double { return self }
}


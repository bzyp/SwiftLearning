//
//  SwiftProperty.swift
//  swiftDemo
//
//  Created by 镭速iOS on 10/28/21.
//  属性
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/10_properties

import UIKit

class SwiftProperty: NSObject {
    
    func test() {
        //存储属性
        struct FixedLengthRange {
            var firstValue: Int
            let length: Int
        }
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        // 该区间表示整数 0，1，2
        rangeOfThreeItems.firstValue = 6
        // 该区间现在表示整数 6，7，8
        
        //常量结构体实例的存储属性
        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        //rangeOfFourItems.firstValue = 6// 尽管 firstValue 是个可变属性，但这里还是会报错
        
        //延时加载存储属性
        //必须将延时加载属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延时加
        //如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。
        
        
        //计算属性
        
        
        
    }
    
}

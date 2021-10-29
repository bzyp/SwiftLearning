//
//  SwiftClass.swift
//  swiftDemo
//
//  Created by 镭速iOS on 10/28/21.
//

import UIKit

class SwiftClass: NSObject {

    /*
     结构体和类对比
     Swift 中结构体和类有很多共同点。两者都可以：
     
     定义属性用于存储值
     定义方法用于提供功能
     定义下标操作用于通过下标语法访问它们的值
     定义构造器用于设置初始值
     通过扩展以增加默认实现之外的功能
     遵循协议以提供某种标准功能
     
     
     */
    
    //类型定义的语法
    struct Resolution {
        var width = 0
        var height = 0
    }
    
    class VideoMode {
        var frameRate = 0
    }
    
    
    func test() {
        
        //创建结构体和类实例的语法非常相似：
        var resolution = Resolution()
        let videoMode = VideoMode()
        
        //属性访问
        resolution.width = 10
        print(resolution.width,videoMode.frameRate)
        
        //结构体和枚举是值类型
        //值类型是这样一种类型，当它被赋值给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。
        //Swift 中所有的基本类型：整数（integer）、浮点数（floating-point number）、布尔值（boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，其底层也是使用结构体实现的
        
        //类是引用类型
        //与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，使用的是已存在实例的引用，而不是其拷贝
        
        //判定两个常量或者变量是否引用同一个类实例有时很有用。为了达到这个目的，Swift 提供了两个恒等运算符
        let video = videoMode
        
        if video === videoMode {
            print("video === videoMode")
        }
        //请注意，“相同”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同。“相同”表示两个类类型（class type）的常量或者变量引用同一个类实例。“等于”表示两个实例的值“相等”或“等价”
        
        
    }
    
}

//
//  SwiftInit.swift
//  swiftDemo
//
//  Created by 镭速iOS on 11/11/21.
//

import UIKit

class SwiftInit: NSObject {

    //构造过程
    
    
    //可选属性类型
    class SurveyQuestion {
        var text: String
        var response: String?//init可选类型的属性将自动化为nil
        init(text: String) {
            self.text = text
        }
        func ask() {
            print(text)
        }
    }
    
    
    //构造过程中常量属性的赋值
    //你可以在构造过程中的任意时间点给常量属性赋值，只要在构造过程结束时它设置成确定的值。一旦常量属性被赋值，它将永远不可更改。
    //注意
    //对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。
    class SurveyQuestion1 {
        let text: String
        var response: String?
        init(text: String) {
            self.text = text//在构造的时候给let类型的text赋值
        }
        func ask() {
            print(text)
        }
    }
    
    
//    结构体的逐一成员构造器
//    结构体如果没有定义任何自定义构造器，它们将自动获得一个逐一成员构造器
    struct Size {
        var width = 0.0, height = 0.0
    }
    
    private func testSize() {
        let size = Size(width: 0, height: 0)
        let size1 = Size(height: 100)//也可以单独为某个属性构造
        let size2 = Size()//属性都不赋值
    }
    
    
    override init() {

            }
    
    //便利构造器
//    convenience init() {
//    }
    
    
    
}

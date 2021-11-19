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
        super.init()
    }
    
    //便利构造器
    convenience init(name: String) {
        self.init()
    }
    convenience init(name: String, age: UInt) {
        self.init()
    }
    
    //必要构造器
    //在类的构造器前添加 required 修饰符表明所有该类的子类都必须实现该构造器：
//    required override init() {
//    }
    
    //通过闭包或函数设置属性的默认值
    //注意闭包结尾的花括号后面接了一对空的小括号。这用来告诉 Swift 立即执行此闭包。如果你忽略了这对括号，相当于将闭包本身作为值赋值给了属性，而不是将闭包的返回值赋值给属性。
    //注意
    //如果你使用闭包来初始化属性，请记住在闭包执行时，实例的其它部分都还没有初始化。这意味着你不能在闭包里访问其它属性，即使这些属性有默认值。同样，你也不能使用隐式的 self 属性，或者调用任何实例方法。
    let someProperty: String = {
        // 在这个闭包中给 someProperty 创建一个默认值
        // someValue 必须和 SomeType 类型相同
        return "test"
    }()
    
}

//可失败构造器
//有时，定义一个构造器可失败的类，结构体或者枚举是很有用的。这里所指的“失败” 指的是，如给构造器传入无效的形参，或缺少某种所需的外部资源，又或是不满足某种必要的条件等。
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}




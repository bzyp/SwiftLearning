//
//  SwiftGeneric.swift
//  swiftDemo
//
//  Created by 镭速iOS on 11/24/21.
//  泛型
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/22_generics

import UIKit

class SwiftGeneric: NSObject {
    func test() {
    }
    
    //泛型函数
    //请始终使用大写字母开头的驼峰命名法（例如 T 和 MyTypeParameter）来为类型参数命名，以表明它们是占位类型，而不是一个值。
    func swapTwoValues<T>(a: inout T, b: inout T) {
        let temp = a
        a = b
        b = temp
    }
    
    //函数使用泛型需要添加<T>
    //添加<T>后还是可以增加多种类型
    func testCreated<T>(a: T, b: Int, c: String) {
        
    }

    //命名类型参数
    //大多情况下，类型参数具有描述下的名称，例如字典 Dictionary<Key, Value> 中的 Key 和 Value 及数组 Array<Element> 中的 Element，这能告诉阅读代码的人这些参数类型与泛型类型或函数之间的关系。然而，当它们之间没有有意义的关系时，通常使用单个字符来表示，例如 T、U、V，例如上面演示函数 swapTwoValues(_:_:) 中的 T
    func testCreated1<U>(a: U) {
        
    }
    
    //泛型版本实现入栈出栈
    //Element 为待提供的类型定义了一个占位名
    struct Stack<Element> {
        var items: [Element] = []
        mutating func push(_ item: Element) {
            items.append(item)
        }
        mutating func pop(_ item: Element) -> Element {
            return items.removeLast()
        }
    }
    
    
    
}

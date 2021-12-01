//
//  SwiftGeneric.swift
//  swiftDemo
//
//  Created by 镭速iOS on 11/24/21.
//  泛型
//  https://gitbook.gitbook.io/swift/swift-jiao-cheng/22_generics

import UIKit

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

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
    
    
    //泛型 Where 语句
    //C1 必须符合 Container 协议（写作 C1: Container）。
//    C2 必须符合 Container 协议（写作 C2: Container）。
//    C1 的 Item 必须和 C2 的 Item 类型相同（写作 C1.Item == C2.Item）。
//    C1 的 Item 必须符合 Equatable 协议（写作 C1.Item: Equatable）
    func allItemMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
        
        // 检查两个容器含有相同数量的元素
        if someContainer.count != anotherContainer.count {
            return false
        }
        // 检查每一对元素是否相等
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }

        return true
    }
        

    
}

//具有泛型 Where 子句的扩展
//你也可以使用泛型 where 子句作为扩展的一部分。基于以前的例子，下面的示例扩展了泛型 Stack 结构体
//这个新的 isTop(_:) 方法首先检查这个栈是不是空的，然后比较给定的元素与栈顶部的元素。如果你尝试不用泛型 where 子句，会有一个问题：在 isTop(_:) 里面使用了 == 运算符，但是 Stack 的定义没有要求它的元素是符合 Equatable 协议的，所以使用 == 运算符导致编译时错误。使用泛型 where 子句可以为扩展添加新的条件，因此只有当栈中的元素符合 Equatable 协议时，扩展才会添加 isTop(_:) 方法
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        return true
    }
}


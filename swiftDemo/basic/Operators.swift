//
//  Operators.swift
//  swiftDemo
//
//  Created by 镭速iOS on 10/25/21.
//  运算符
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/02_basic_operators

import UIKit

class Operators: NSObject {
    
    //一元运算符对单一操作对象操作（如 -a）。一元运算符分前置运算符和后置运算符，前置运算符需紧跟在操作对象之前（如 !b），后置运算符需紧跟在操作对象之后（如 c!）。
    //二元运算符操作两个操作对象（如 2 + 3），是中置的，因为它们出现在两个操作对象之间。
    //三元运算符操作三个操作对象，和 C 语言一样，Swift 只有一个三元运算符，就是三目运算符（a ? b : c）
    
    //与 C 语言和 Objective-C 不同，Swift 的赋值操作并不返回任何值。所以下面语句是无效的：
    //通过将 if x = y 标记为无效语句，Swift 能帮你避免把 （==）错写成（=）这类错误的出现。
    
    /*
     
     if x = y {
     //此句错误，因为 x = y 并不返回任何值
     }
     
     */
    
    //与 C 语言和 Objective-C 不同的是，Swift 默认情况下不允许在数值运算中出现溢出情况。但是你可以使用 Swift 的溢出运算符来实现溢出运算（如 a &+ b, a &- b, a &* b)
    //加法运算符也可用于 String 的拼接
    let string = "hello" + "world"
    
    //空合运算符（Nil Coalescing Operator）
    //空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解包，否则就返回一个默认值 b。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致
    //空合运算符是对以下代码的简短表达方法：
    //a != nil ? a! : b
    
    func test() {
        //闭区间运算符
        for index in 1...5 {
            print("index = \(index)") // 1-5
        }
        
        //半开区间运算符
        //半开区间运算符（a..<b）定义一个从 a 到 b 但不包括 b 的区间
        for index in 1..<5 {
            print("index = \(index)") // 1-4
        }
        
        //单侧区间
        let names = ["Anna", "Alex", "Brian", "Jack"]
        //闭区间操作符有另一个表达形式，可以表达往一侧无限延伸的区间 —— 例如，一个包含了数组从索引 2 到结尾的所有值的区间。在这些情况下，你可以省略掉区间操作符一侧的值。这种区间叫做单侧区间，因为操作符只有一侧有值
        for name in names[0...] {
            print("name = \(name)")
        }
        
        for name in names[...2] {
            print("name = \(name)")
        }
        
        for name in names[..<2] {
            print("name = \(name)")
        }
        
        //逻辑运算符组合计算
        //注意
        //Swift 逻辑操作符 && 和 || 是左结合的，这意味着拥有多元逻辑操作符的复合表达式优先计算最左边的子表达式。
        //if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
           // print("Welcome!")
       // } else {
           // print("ACCESS DENIED")
        //}
        
    }
    
    
    
}

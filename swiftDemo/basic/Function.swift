//
//  Function.swift
//  swiftDemo
//
//  Created by 镭速iOS on 10/20/21.
//  swift函数

import UIKit

class Function: NSObject {

    override init() {
        super.init()
    }
    
    
    var name: String = ""
    
    /// 测试，定义一个无返回值无参数的函数
    /// 没有明确定义返回类型的函数的返回一个 Void 类型特殊值，该值为一个空元组，写成 ()
    /// 返回值可以被忽略，但定义了有返回值的函数必须返回一个值，如果在函数定义底部没有返回任何值，将导致编译时错误。
    func test() {
        print(greet(person: "mj"))
        print(introduce(name: "simon", age: 18))
        print("找出最大值最小值：\(minMax(arrar: [19,66,1,3,99,66,31]) ?? (0, 0))")
        print("找出最大值最小值：\(minMax(arrar: []) ?? (0, 0))")
        
        introduceAgain("simon", from: "gd")//忽略参数标签
//        introduceAgain(name: "simon", from: "guangdong")//保留参数标签
        
        self.say(name: "sun")//函数带有默认参数可以不传
        print(arithmeticMean(numbers: 1,55,13,3))
        
        var a = 10,b = 20
        print("修改前:\(a)  \(b)")
        swap(a: &a, b: &b)
        print("修改后:\(a)  \(b)")
        
        let mathFunction: (Int, Int) -> Int = addTowInts
        print("result :\(mathFunction(19, 22))")
        
        
        
    }
    
    /// 定义一个函数greet
    /// - Parameter person: 输入类型为String的函数参数
    /// - Returns: 返回类型为String
    func greet(person: String) -> String {
        let greeting = "hello" + person + "!"
        return greeting
    }
        
    /// 多参数函数，使用逗号隔开
    func introduce(name: String, age: UInt) -> String {
        return "My name is \(name),\(age)"//  使用\()拼接字符串
    }
    
    // 指定参数标签 from
    // 如果你不希望为某个参数添加一个标签，可以使用一个下划线（_）来代替一个明确的参数标签
    func introduceAgain(_ name: String, from hometown: String) {
        print("name:\(name),from:\(hometown)")
    }
    
    /// 多重返回值函数
    /// - Returns: 可选类型tuple元组
    func minMax(arrar: [Int]) -> (min: Int, max: Int)? {
        guard !arrar.isEmpty else {
            return nil
        }
        guard arrar.count > 1 else {
            return (arrar[0],arrar[0])
        }
        var min = arrar[0]
        var max = arrar[0]
        for value in arrar[1..<arrar.count] {
            if value < min {
                min = value
            }else if value > max {
                max = value
            }
        }
        return (min, max)
    }
    
    ///函数默认参数值,通常默认参数放在后面
    func say(name: String, age: Int = 12) {
        print("name:\(name) age: \(age)")
    }
    
    //可变参数,一个可变参数（variadic parameter）可以接受零个或多个值
    //一个函数能拥有多个可变参数。可变参数后的第一个行参前必须加上实参标签。实参标签用于区分实参是传递给可变参数，还是后面的行参。
    func arithmeticMean(numbers: Double...) -> Double {
        var total: Double = 0;
        
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    
    //输入输出参数
    //输入输出参数不能有默认值，而且可变参数不能用 inout 标记。
    func swap(a: inout Int, b: inout Int) {
        let temp = a;
        a = b
        b = temp
    }
    
    //使用函数类型
    func addTowInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    


    
}




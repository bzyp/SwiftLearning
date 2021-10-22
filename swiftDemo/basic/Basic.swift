//
//  basic.swift
//  swiftDemo
//
//  Created by 镭速iOS on 10/22/21.
//  Swift基础知识
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics#if

import UIKit

class Basic: NSObject {

    func test() {
        test2()
        test5()
        test6()
    }
    
    //类型安全和类型推断
    //Swift 是一个类型安全（type safe）的语言。类型安全的语言可以让你清楚地知道代码要处理的值的类型。如果你的代码需要一个 String，你绝对不可能不小心传进去一个 Int
    //由于 Swift 是类型安全的，所以它会在编译你的代码时进行类型检查（type checks），并把不匹配的类型标记为错误。这可以让你在开发的时候尽早发现并修复错误。
    let age = 29 //会被推断为int类型
    
    //当推断浮点数的类型时，Swift 总是会选择 Double 而不是 Float。
    let p = 3.1415926 //推断为double类型
    
    //如果表达式中同时出现了整数和浮点数，会被推断为 Double 类型：
    let pi = 3 + 0.1415926
    
    //整数字面量可以被写作：
    //一个十进制数，没有前缀一个二进制数，前缀是 0b一个八进制数，前缀是 0o一个十六进制数，前缀是 0x
    let decimal = 10 //十进制
    let dinary = 0b10001 //二进制
    let octal = 0o21 //八进制
    let hexadecimal = 0x11 //十六进制
    
    //浮点字面量可以是十进制（没有前缀）或者是十六进制（前缀是 0x ）。小数点两边必须有至少一个十进制数字（或者是十六进制的数字）。十进制浮点数也可以有一个可选的指数（exponent)，通过大写或者小写的 e 来指定；十六进制浮点数必须有一个指数，通过大写或者小写的 p 来指定
    //如果一个十进制数的指数为 exp，那这个数相当于基数和10^exp 的乘积：
    let exponent1 = 1.25e2 //表示 1.25 × 10^2，等于 125.0。
    let exponent2 = 1.25e-2 //表示 1.25 × 10^-2，等于 0.0125。

    //如果一个十六进制数的指数为 exp，那这个数相当于基数和2^exp 的乘积：
    let p2 = 0xFp2 //表示 15 × 2^2，等于 60.0。
    let p3 = 0xFp-2 //表示 15 × 2^-2，等于 3.75
    
    //数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：
    let paddedDouble = 000123.456
    let oneMillion = 1_000_000
    let justOverOneMillion = 1_000_000.000_000_1
    
    
//    要将一种数字类型转换成另一种，你要用当前值来初始化一个期望类型的新数字，这个数字的类型就是你的目标类型。在下面的例子中，常量 twoThousand 是 UInt16 类型，然而常量 one 是 UInt8 类型。它们不能直接相加，因为它们类型不同。所以要调用 UInt16(one) 来创建一个新的 UInt16 数字并用 one 的值来初始化，然后使用这个新数字来计算：
    func test2() {
        
        let twoThousand: UInt16 = 2_000
        let one: UInt8 = 1
        let twoThousandAndOne = twoThousand + UInt16(one)
        print(twoThousandAndOne)
        
        //整数和浮点数转换
        let three = 3
        let t = 0.1313
        let pi = Double(three) + t //3.1313
        
        let integetPi = Int(pi) // 3, 当用这种方式来初始化一个新的整数值时，浮点值会被截断
        print("integetPi = \(integetPi)")
        
    }
    
    //类型别名
    //类型别名（type aliases）就是给现有类型定义另一个名字。你可以使用 typealias 关键字来定义类型别名。
    typealias audioSample = UInt16
    //定义了一个类型别名之后，你可以在任何使用原始名的地方使用别名：
    var maxAmolitudeFound = audioSample.min
    
    //元组
    //元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
    let http404Error = (404, "not found")// http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
    
    func test3() {
        //元组内容分解
        let (statusCode, message) = http404Error
        print("status = \(statusCode) msg = \(message)")
        
        //分解的时候可以把要忽略的部分用下划线（_）标记：
//        let (justTheStatus, _) = http404Error
        
        //下标访问
        print("status = \(http404Error.0) \(http404Error.1)")
        
        //可以在定义元组的时候给单个元素命名：
        let http505Error = (status: 505, msg: "505状态码")
        print("s = \(http505Error.status) m = \(http505Error.msg)")
        
        //当遇到一些相关值的简单分组时，元组是很有用的。元组不适合用来创建复杂的数据结构。如果你的数据结构比较复杂，不要使用元组，用类或结构体去建模。欲获得更多信息
    }
    
    
    //可选类型
    //使用可选类型（optionals）来处理值可能缺失的情况。可选类型表示两种可能： 或者有值， 你可以解析可选类型访问这个值， 或者根本没有值。
    func test4() {
        let posible = "344"
        let convertedNumber = Int(posible)// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
        print(convertedNumber!)
        
        //nil
        //你可以给可选变量赋值为 nil 来表示它没有值：
        //注意nil 不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型
        var statusCode: Int? = 404
        statusCode = nil
        
        //如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil：
        var answser: String? //被自动设置为 nil
        
        //注意
        //Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型
        
        answser = "???"
        
        //当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值。这个惊叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析（forced unwrapping）
        print("answser = \(answser!)")
        
        //可选绑定
        //使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量
        //可选绑定可以用在 if 和 while 语句中，这条语句不仅可以用来判断可选类型中是否有值，同时可以将可选类型中的值赋给一个常量或者变量
        if let status = statusCode {
            print(status)
        }
        
        //如果 Int(possibleNumber) 返回的可选 Int 包含一个值，创建一个叫做 actualNumber 的新常量并将可选包含的值赋给它
        if let actual = Int(posible) {
            print("转换成功 \(actual)")
        }else{
            print("转换失败")
        }
    }
    
    func test5() {
        //隐式解析可选类型
        //有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型总会有值。在这种情况下，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。
        //当可选类型被第一次赋值之后就可以确定之后一直有值的时候，隐式解析可选类型非常有用
        
        let possibleString: String? = "An optional string."
        let forcedString: String = possibleString! // 需要感叹号来获取值
        
        let assumedString: String! = "An implicitly unwrapped optional string."
        
        let implicitString: String = assumedString  // 不需要感叹号
        
        let optionalString = assumedString // optionalString 的类型是 "String?"，assumedString 也没有被强制解析。
        print(optionalString!,implicitString,forcedString)
        
        
        //我不太理解下面这段话
        //注意如果一个变量之后可能变成 nil 的话请不要使用隐式解析可选类型。如果你需要在变量的生命周期中判断是否是 nil 的话，请使用普通可选类型。
        
        var name: String? = "mj"
        name = nil

        if let n = name {
            print("隐式转换成功 \(n)")
        }else{
            print("隐式转换失败")
        }
    }
    
    private func test6() {
        //错误处理
        //当一个函数遇到错误条件，它能报错。调用函数的地方能抛出错误消息并合理处理。
        //throws关键字修饰的函数可以抛出异常
        enum error: Error {
            case error
        }
        
        func canThrowAnError() throws {
            //这个函数有可能抛出错误
            throw error.error
        }
        
        do {
            try canThrowAnError()
        } catch error.error {
            print(error.error)
        } catch {
            
        }
    }
    
    //使用断言进行调试
    
    
}

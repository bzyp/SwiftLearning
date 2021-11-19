//
//  Block.swift
//  swiftDemo
//
//  Created by 镭速iOS on 10/21/21.
//  swift闭包
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/07_closures

import UIKit

class Block: NSObject {
    
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    
    func test() {
        
        print("\(NSStringFromClass(Block.self))")
        
        //闭包表达式逐步优化
        var reversedNames = names.sorted(by: backward(_:_:))
        print("reversedNames1 = \(reversedNames),\(names)")
        
        reversedNames = names.sorted(by: { (si: String, s2: String) -> Bool in
            return si < s2
        })
        print("reversedNames2 = \(reversedNames)")
        
        reversedNames = names.sorted(by: { s1, s2 in
            return s1 < s2
        })
        print("reversedNames3 = \(reversedNames)")
        
        //单表达式闭包的隐式返回
        //单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果，如上版本的例子可以改写为：
        //在这个例子中，sorted(by:) 方法的参数类型明确了闭包必须返回一个 Bool 类型值。因为闭包函数体只包含了一个单一表达式（s1 > s2），该表达式返回 Bool 类型值，因此这里没有歧义，return 关键字可以省略。
        reversedNames = names.sorted(by: {s1,s2 in s1 > s2})
        print("reversedNames4 = \(reversedNames)")
        
        //参数名称缩写
        //Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。
        //如果你在闭包表达式中使用参数名称缩写，你可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断。闭包接受的参数的数量取决于所使用的缩写参数的最大编号。in 关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成：
        //在这个例子中，$0 和 $1 表示闭包中第一个和第二个 String 类型的参数。因为 $1 是编号最大的缩写参数，所以可以理解为：该闭包需要两个参数。这里的 sorted(by:) 函数希望得到一个参数都是字符串的闭包，因此缩写参数 $0 和 $1 的类型均为 String。
        reversedNames = names.sorted(by: {$0 > $1})
        print("reversedNames5 = \(reversedNames)")
        
        //运算符方法
        //实际上还有一种更简短的方式来编写上面例子中的闭包表达式。Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。而这正好与 sorted(by:) 方法的参数需要的函数类型相符合。因此，你可以简单地传递一个大于号，Swift 可以自动推断找到系统自带的那个字符串函数的实现：
        reversedNames = names.sorted(by: >)
        print("reversedNames6 = \(reversedNames)")
        
        // 以下是不使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure(closure: {
            // 闭包主体部分
        })
        // 以下是使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure() {
            // 闭包主体部分
        }
        
        //尾随闭包
        //当闭包非常长以至于不能在一行中进行书写时，尾随闭包变得非常有用
        //例子中，通过尾随闭包语法，优雅地在函数后封装了闭包的具体功能，而不再需要将整个闭包包裹在 map(_:) 方法的括号内
        let digitNames = [0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
        let numbers = [16, 58, 510]
        let strings = numbers.map { (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            }while number > 0
            return output
        }
        print("strings = \(strings)")
        
        //测试值捕获
        let incrementByTen = makeIncrementer(forIncrement: 10)
        print(incrementByTen())// 返回的值为10
        print(incrementByTen())// 返回的值为20
        print(incrementByTen())// 返回的值为30
        
        //如果你创建了另一个 incrementer，它会有属于自己的引用，指向一个全新、独立的 runningTotal 变量：
        let incrementBySeven = makeIncrementer(forIncrement: 7)
        print(incrementBySeven())// 返回的值为7
        print(incrementByTen())// 返回的值为40
        
        
        //注意如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，你将在闭包和该实例间创建一个循环强引用。Swift 使用捕获列表来打破这种循环强引用。更多信息，请参考 闭包引起的循环强引用。
        //解决闭包的循环强引用
        //https://swiftgg.gitbook.io/swift/swift-jiao-cheng/24_automatic_reference_counting#resolving-strong-reference-cycles-for-closures
        //Swift 有如下要求：只要在闭包内使用 self 的成员，就要用 self.someProperty 或者 self.someMethod()（而不只是 someProperty 或 someMethod()）。这提醒你可能会一不小心就捕获了 self。
        
        //闭包是引用类型
        //上面的例子中，incrementBySeven 和 incrementByTen 都是常量，但是这些常量指向的闭包仍然可以增加其捕获的变量的值。这是因为函数和闭包都是引用类型。
        //无论你将函数或闭包赋值给一个常量还是变量，你实际上都是将常量或变量的值设置为对应函数或闭包的引用。上面的例子中，指向闭包的引用 incrementByTen 是一个常量，而并非闭包内容本身。
        //这也意味着如果你将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包：
        let alsoIncrementByTen = incrementByTen
        print(alsoIncrementByTen())// 返回的值为50
        
        self.doSomething()
        print("x = \(self.x)")// 打印出“200”
        
        //逃逸闭包
        //        completionHandlers.first?()
        let closuer = completionHandlers.first!
        closuer()
        print("x = \(self.x)")// 打印出“100”
        
        autoClosure()
    }
    
    //排序方法
    func backward(_ str1: String, _ str2: String) -> Bool {
        return str1 > str2
    }
    
    //闭包表达式语法
    //闭包的函数体部分由关键字 in 引入。该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始
    //    {(parameters) -> return type in
    //        statements
    //    }
    
    //尾随闭包
    //如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，将这个闭包替换成为尾随闭包的形式很有用。尾随闭包是一个书写在函数圆括号之后的闭包表达式，函数支持将其作为最后一个参数调用。在使用尾随闭包时，你不用写出它的参数标签：
    func someFunctionThatTakesAClosure(closure: () -> Void) {
        //函数体
    }
    
    //值捕获
    //闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值
    //捕获引用保证了 runningTotal 和 amount 变量在调用完 makeIncrementer 后不会消失，并且保证了在下一次执行 incrementer 函数时，runningTotal 依旧存在。
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }
    
    //    注意:
    //    为了优化，如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift 可能会改为捕获并保存一份对值的拷贝。Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量。
    
    //互相强引用
    //如果闭包有参数列表和返回类型，把捕获列表放在它们前面：
    lazy var someClosure = {
        [unowned self]
        (index: Int, name: String) -> String in
        // 这里是闭包的函数体
        return "haha"
    }
    
    //定义捕获列表
    lazy var asHTML: () -> String = {
        [unowned self] in
        // 这里是闭包的函数体
        return "haha"
    }
    
    //逃逸闭包
    //当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
    //someFunctionWithEscapingClosure(_:) 函数接受一个闭包作为参数，该闭包被添加到一个函数外定义的数组中。如果你不将这个参数标记为 @escaping，就会得到一个编译错误。
    var completionHandlers: [() -> Void] = []
    func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
    }
    
    func someFunctionWithNonescapingClosure(closure: () -> Void) {
        closure()
    }
    
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
        
        //不使用尾随闭包
        someFunctionWithNonescapingClosure(closure: {
            print("x= \(x)")
        })
    }
    
    //自动闭包
    //自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式
    func autoClosure() {
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)//5
        
        let constomerProvider = {
            customersInLine.remove(at: 0)
        }
        print(customersInLine.count)//5
        
        print("now serving\(constomerProvider())！")//闭包被调用之前，这个元素是不会被移除的。打印出“Now serving Chris!”
        print(customersInLine.count)//4
        
        serve(customer: {customersInLine.remove(at: 0)})// 打印出“Now serving Alex!”
        serveAgain(customer: customersInLine.remove(at: 0))// 打印“Now serving Ewa!”
    }
    
    func serve(customer customerProvider: () -> String) {
        print("Now serving \(customerProvider())!")
    }
    //上面的 serve(customer:) 函数接受一个返回顾客名字的显式的闭包。下面这个版本的 serve(customer:) 完成了相同的操作，不过它并没有接受一个显式的闭包，而是通过将参数标记为 @autoclosure 来接收一个自动闭包。现在你可以将该函数当作接受 String 类型参数（而非闭包）的函数来调用。customerProvider 参数将自动转化为一个闭包，因为该参数被标记了 @autoclosure 特性。
    //注意过度使用 autoclosures 会让你的代码变得难以理解。上下文和函数名应该能够清晰地表明求值是被延迟执行的。
    func serveAgain(customer customerProvider: @autoclosure () -> String) {
        print("Now serving \(customerProvider())!")
    }
    
    func testAgain(str: String) {
        
    }
}

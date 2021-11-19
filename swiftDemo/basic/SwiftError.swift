//
//  SwiftError.swift
//  swiftDemo
//
//  Created by 镭速iOS on 11/18/21.
//

import UIKit

class SwiftError: NSObject {

    //错误用遵循Error协议的类型的值来表示
    enum VendingMachineError: Error {
        case invalidSelection                     //选择无效
        case insufficientFunds(coinsNeeded: Int) //金额不足
        case outOfStock                             //缺货
    }
    
    //抛出错误使用throw语句：
    func test() throws {
        throw VendingMachineError.insufficientFunds(coinsNeeded: 1)
    }
    
    //throwing函数传递错误
    //添加throws关键词的方法抛出错误。
    //throws添加在参数后面，->之前。
    //只有throwing函数可以传递错误。任何在某个非throwing函数内部抛出的错误只能在函数内部处理
    func canThroweErrors() throws -> String {
        throw VendingMachineError.invalidSelection//throw语句会立即退出方法
        return ""
    }
    
    func test2() throws {
        //do-catch语句运行闭包代码处理错误。如果在do子句中的代码抛出一个错误，这个错误会与catch子句做匹配
        do {
            try canThroweErrors()//如果没有错误抛出，会执行do子句的余下语句
            print("执行")
        } catch VendingMachineError.invalidSelection {
            
        } catch {
            //如果错误没有被匹配，他会被最好一个catch语句捕获,并赋值给一个error常量
            print("错误未被匹配\(error)")
        }
    }
    
    
    //将错误转换成可选值
    //可以使用try？通过将错误转化成一个可选值来处理错误。
    //下面代码 x和y有相同的数值和等价的含义
    //如果 someThrowingFunction() 抛出一个错误，x 和 y 的值是 nil。否则 x 和 y 的值就是该函数的返回值。注意，无论 someThrowingFunction() 的返回值类型是什么类型，x 和 y 都是这个类型的可选类型。例子中此函数返回一个整型，所以 x 和 y 是可选整型。
    func test3() {
        
        func someThrowingFunction() throws -> Int {
            // ...
            throw VendingMachineError.insufficientFunds(coinsNeeded: 3)
        }
        
        let x = try? someThrowingFunction()
        
        let y: Int?
        do {
            y = try someThrowingFunction()
        } catch {
            y = nil
        }
    }
    
    //指定清理操作
    //你可以使用 defer 语句在即将离开当前代码块时执行一系列语句。该语句让你能执行一些必要的清理工作，不管是以何种方式离开当前代码块的——无论是由于抛出错误而离开，或是由于诸如 return、break 的语句。例如，你可以用 defer 语句来确保文件描述符得以关闭，以及手动分配的内存得以释放
    /*
    func processFile(filename: String) throws {
        if exists(filename) {
            let file = open(filename)
            defer {
                close(file)
            }
            while let line = try file.readline() {
                // 处理文件。
            }
            // close(file) 会在这里被调用，即作用域的最后。
        }
    }
     */
    
}

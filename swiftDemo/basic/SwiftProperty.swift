//
//  SwiftProperty.swift
//  swiftDemo
//
//  Created by 镭速iOS on 10/28/21.
//  属性
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/10_properties

import UIKit


class SwiftProperty: NSObject {
    
    func test() {
        //存储属性
        struct FixedLengthRange {
            var firstValue: Int
            let length: Int
        }
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        // 该区间表示整数 0，1，2
        rangeOfThreeItems.firstValue = 6
        // 该区间现在表示整数 6，7，8
        
        //常量结构体实例的存储属性
        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        //rangeOfFourItems.firstValue = 6// 尽管 firstValue 是个可变属性，但这里还是会报错
        
        //延时加载存储属性
        //必须将延时加载属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延时加
        //如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。
        
        
        //计算属性
        
        struct Point {
            var x = 0.0, y = 0.0
        }
        struct Size {
            var width = 0.0, height = 0.0
        }
        struct CompactRect {
            var origin = Point()
            var size = Size()
            
            var center: Point {
                get {
                    return Point(x: 10, y: 12.0)
                }
                set {
                    origin.x = newValue.x
                }
            }
            
        }
        
        
        //只读计算属性
        //只有 getter 没有 setter 的计算属性叫只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
        //必须使用 var 关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let 关键字只用来声明常量属性，表示初始化后再也无法修改的值
        //只读计算属性的声明可以去掉 get 关键字和花括号：
        struct Cuboid {
            var width = 10.0
            var volume: Double {
                return width * width * width
            }
        }
        
        //可以为属性添加其中一个或两个观察器：
        //willSet 在新的值被设置之前调用
        //didSet 在新的值被设置之后调用
        
        //属性包装器
        @propertyWrapper
        struct TwelveOrLess {
            private var num = 0
            var wrappedValue: Int {
                get { return num }
                set { num = min(newValue, 12) }//以 private 的方式声明 number 变量，这使得 number 仅在 TwelveOrLess 的实现中使用。写在其他地方的代码通过使用 wrappedValue 的 getter 和 setter 来获取这个值，但不能直接使用 number
            }
        }
        
        struct SmallRectangle {
            @TwelveOrLess var height: Int
        }
        
        var rectangle = SmallRectangle()
        rectangle.height = 9
        print(" rectangle.height = \(rectangle.height)")//rectangle.height = 9
        
        rectangle.height = 19
        print(" rectangle.height = \(rectangle.height)")//rectangle.height = 12
        
        
        //全局变量和局部变量
        //全局变量是在函数、方法、闭包或任何类型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量
        
        //注意
        //全局的常量或变量都是延迟计算的，跟 延时加载存储属性 相似，不同的地方在于，全局的常量或变量不需要标记 lazy 修饰符。
        //局部范围的常量和变量从不延迟计算
        
        
        
    }
    
}

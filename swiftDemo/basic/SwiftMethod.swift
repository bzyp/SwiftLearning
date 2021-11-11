//
//  SwiftMethod.swift
//  swiftDemo
//
//  Created by 镭速iOS on 11/10/21.
//  方法
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/11_methods

import UIKit

class SwiftMethod: NSObject {
    func test() {
        //方法是与某些特定类型相关联的函数
        //实例方法是属于某个特定类、结构体或者枚举类型实例的方法
        //实例方法要写在它所属的类型的前后大括号之间。实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。实例方法只能被它所属的类的某个特定实例调用。实例方法不能脱离于现存的实例而被调用
        
        //在实例方法中修改值类型
        //但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择 可变（mutating）行为，然后就可以从其方法内部改变它的属性；并且这个方法做的任何改变都会在方法执行结束时写回到原始结构中。方法还可以给它隐含的 self 属性赋予一个全新的实例，这个新实例在方法结束时会替换现存实例。
        //要使用 可变方法，将关键字 mutating 放到方法的 func 关键字之前就可以了：
        struct Point {
            var x = 0.0, y = 0.0 //假如使用let，即使mutating也不可更改
            mutating func moveBy(x deltaX: Double, y deltaY: Double){
                x += deltaX
                y += deltaY
            }
        }
        
        var somePoint = Point(x: 1.5, y: 2.0)
        somePoint.moveBy(x: 11.5, y: 213.1)
        print("point x = \(somePoint.x),y = \(somePoint.y)")// 11.5 213.1
        
        var lever: LevelTracker = LevelTracker()
        lever.advance(to: 10)
    }
    
    //类型方法，OC中的类方法
    class func typeMethod() {
        print(self)//在类型方法的方法体（body）中，self 属性指向这个类型本身，而不是类型的某个实例
    }
//    SwiftMethod.typeMethod()
    
    //在struct中声明类型方法使用static ？，使用class会报错
    struct LevelTracker {
        static var highestUnlockedLevel = 1 //static声明可以在类型方法中使用这个属性
        var currentLevel = 1
        static func unlock(_ level: Int) {
            if level > highestUnlockedLevel { highestUnlockedLevel = level }
        }
        static func isUnlocked(_ level: Int) -> Bool {
            return level <= highestUnlockedLevel
        }
        
        @discardableResult
        mutating func advance(to level: Int) -> Bool {
            if LevelTracker.isUnlocked(level) {
                currentLevel = level
                return true
            } else {
                return false
            }
        }
    }
    
    
    
}

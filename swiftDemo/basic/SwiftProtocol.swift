//
//  SwiftProtocol.swift
//  swiftDemo
//
//  Created by 镭速iOS on 11/23/21.
//

import UIKit

// 协议语法
protocol SomeProtocol {
    // 这里是协议的定义部分
}

//遵循协议使用：号隔开,多个协议用，号隔开
struct SomeStruct: SomeProtocol {
    
}

//协议总是用 var 关键字来声明变量属性，在类型声明后加上 { set get } 来表示属性是可读可写的，可读属性则用 { get } 来表示：
protocol testProtocol {
    var mustBeSettable: Int { get set} //可读可写
    var doesNotNeedToBeSettable: Int { get } //可读属性
}

//这是一个只含有一个实例属性要求的协议
protocol FullyNamed {
    var fullName: String { get }
}

//任何遵循 FullyNamed 的类型，都必须有一个可读的 String 类型的实例属性 fullName
struct Person1: FullyNamed {
    var fullName: String
}

//在协议中定义类方法的时候，总是使用 static 关键字作为前缀
protocol testProtocol1 {
    static func someMethod() //类方法
    func random() -> Double //实例方法
}

//异变方法要求
//有时需要在方法中改变（或异变）方法所属的实例。例如，在值类型（即结构体和枚举）的实例方法中，将 mutating 关键字作为方法的前缀，写在 func 关键字之前，表示可以在该方法中修改它所属的实例以及实例的任意属性的值
//如果你在协议中定义了一个实例方法，该方法会改变遵循该协议的类型的实例，那么在定义协议时需要在方法前加 mutating 关键字。这使得结构体和枚举能够遵循此协议并满足此方法要求
//实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写 mutating 关键字

//toggle() 方法在定义的时候，使用 mutating 关键字标记，这表明当它被调用时，该方法将会改变遵循协议的类型的实例：
protocol Togglabel {
    mutating func toggle()
}

//用枚举成员 On 和 Off 表示。枚举的 toggle() 方法被标记为 mutating，以满足 Togglable 协议的要求：
enum OnOffSwitch: Togglabel {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        default:
            self = .off
        }
    }
}

class SwiftProtocol: NSObject {
     var lightSiwtch = OnOffSwitch.off
}

//在扩展里添加协议遵循
//通过扩展遵循并采纳协议，和在原始定义中遵循并符合协议的效果完全相同
extension SwiftProtocol: Togglabel {
    func toggle() {
        
    }
    
    
}






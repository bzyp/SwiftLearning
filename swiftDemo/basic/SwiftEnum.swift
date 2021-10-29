//
//  SwiftEnum.swift
//  swiftDemo
//
//  Created by 镭速iOS on 10/28/21.
//  枚举
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/08_enumerations

import UIKit

class SwiftEnum: NSObject {

    //令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合
    enum ConmpassPoint: CaseIterable {
        case north
        case south
        case east
        case west
    }
    
    //原始值
    enum Point: Int,CaseIterable {
        case north //默认0开始
        case south
        case east
        case west
    }
    
   
    
    //注意
    //与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的 CompassPoint 例子中，north，south，east 和 west 不会被隐式地赋值为 0，1，2 和 3。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型。
    
    //多个成员值可以出现在同一行上，用逗号隔开：
    enum Planet {
        case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    
    func test() {
        //使用 Switch 语句匹配枚举值
        var direction = ConmpassPoint.north
        switch direction {
        case .north:
            print(direction)
        default:
            break
        }
        
        //遍历枚举成员
        //令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合
        for point in ConmpassPoint.allCases {
            print("point = \(point)")
        }
        
        for p in Point.allCases {
            print("p = \(p.rawValue)")
        }
        
        //关联值
        enum Barcode {
            case upc(Int, Int, Int, Int)
            case qrCode(String)
        }
        var productBarcode = Barcode.upc(10, 11, 33, 31)
        productBarcode = .qrCode("adeedsa")
        
        //提取
        switch productBarcode {
        case .upc(let numSysrem, let a, let b, let c):
            print(numSysrem, a, b, c)
        default:
            break
        }
        
        //如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个 let 或者 var：
        switch productBarcode {
        case let .upc(a, b, c, d):
            print(a, b, c, d)
        default:
            break
        }
        
        
    }
    
    
}

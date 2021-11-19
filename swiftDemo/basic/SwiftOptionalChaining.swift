//
//  SwiftOptionalChaining.swift
//  swiftDemo
//
//  Created by 镭速iOS on 11/12/21.
//  可选链
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/16_optionalchaining

import UIKit

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

class SwiftOptionalChaining: NSObject {

    //可选链式调用是一种可以在当前值可能为 nil 的可选值上请求和调用属性、方法及下标的方法。如果可选值有值，那么调用就会成功；如果可选值是 nil，那么调用将返回 nil。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为 nil，整个调用链都会失败，即返回 nil
    //Swift 的可选链式调用和 Objective-C 中向 nil 发送消息有些相像，但是 Swift 的可选链式调用可以应用于任意类型，并且能检查调用是否成功
    
    //通过可选链式调用访问属性
    func test1() {
        let john = Person()
        
        //在 residence 后面添加问号之后，Swift 就会在 residence 不为 nil 的情况下访问 numberOfRooms
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        
        //通过可选链式调用得到的返回值都是可选的
        
        
        //通过可选链式调用访问下标
//        if let firstRoomName = john.residence?[0].name {
//            print("The first room name is \(firstRoomName).")
//        } else {
//            print("Unable to retrieve the first room name.")
//        }
        
        //可以通过下标，用可选链式调用来赋值
//        john.residence?[0] = Room(name: "Bathroom")
        
        
    }
    
    
    //需要注意的是，street 的属性为 String?。john.residence?.address?.street 的返回值也依然是 String?，即使已经使用了两层可选链式调用。
//    if let johnsStreet = john.residence?.address?.street {
//        print("John's street name is \(johnsStreet).")
//    } else {
//        print("Unable to retrieve the address.")
//    }
    
    
//    在方法的可选返回值上进行可选链式调用
//    在下面的例子中，通过可选链式调用来调用 Address 的 buildingIdentifier() 方法。这个方法返回 String? 类型的值。如上所述，通过可选链式调用来调用该方法，最终的返回值依旧会是 String? 类型
//    if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
//        print("John's building identifier is \(buildingIdentifier).")
//    }
    
    //如果要在该方法的返回值上进行可选链式调用，在方法的圆括号后面加上问号即可：
//    if let beginsWithThe =
//        john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
//            if beginsWithThe {
//                print("John's building identifier begins with \"The\".")
//            } else {
//                print("John's building identifier does not begin with \"The\".")
//            }
//    }
    //在上面的例子中，在方法的圆括号后面加上问号是因为你要在 buildingIdentifier() 方法的可选返回值上进行可选链式调用，而不是 buildingIdentifier() 方法本身
    
}

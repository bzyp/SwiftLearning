//
//  SwiftSet.swift
//  swiftDemo
//
//  Created by 镭速iOS on 10/26/21.
//  集合
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/04_collection_types

import UIKit

class SwiftSet: NSObject {
    
    //数组 Array
    func test() {
        //你可以使用构造语法来创建一个由特定数据类型构成的空数组：
        var someInts: [Int] = [0, 1,33]
        someInts.append(3) 
        
        //创建一个带有默认值的数组
        var threeDoubles = Array(repeating: 0.0, count: 3)// threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]
        var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
        
        //通过两个数组相加创建一个数组
        var six = threeDoubles + anotherThreeDoubles
        
        //使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为 0：
        if six.isEmpty {
            let dou = six.first
            
        } else {
        }
        
        test1()
        test2()
    }
    
    //集合 Sets
    //用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组
    private func test1() {
        //创建和构造一个空的集合
        var letters = Set<Character>.init("a")
        print("letters = \(letters)")
        
        letters = []// letters 现在是一个空的 Set，但是它依然是 Set<Character> 类型
        
        //用数组字面量创建集合
        var favorite: Set<String> = ["a", "b", "c"]
        
        //简化
        var favoriteGenres: Set = ["a", "b", "c"]
        //使用 intersection(_:) 方法根据两个集合的交集创建一个新的集合。
        //使用 symmetricDifference(_:) 方法根据两个集合不相交的值创建一个新的集合。
        //使用 union(_:) 方法根据两个集合的所有值创建一个新的集合。
        //使用 subtracting(_:) 方法根据不在另一个集合中的值创建一个新的集合。
    }
    
    //字典
    private func test2() {
        //字典遍历
        //你可以使用 for-in 循环来遍历某个字典中的键值对。每一个字典中的数据项都以 (key, value) 元组形式返回，并且可以使用临时常量或者变量来分解这些元组
        let airports = ["key1" : "shenzhen", "key2" : "shanghai"]
        
        for (key, name) in airports {
            print(key, name)
        }
        
        //如果你需要使用某个字典的键集合或者值集合来作为某个接受 Array 实例的 API 的参数，可以直接使用 keys 或者 values 属性构造一个新数组：
        let keys = [String](airports.keys)
        let names = [String](airports.values)
        print(keys, names)
    }
    
}

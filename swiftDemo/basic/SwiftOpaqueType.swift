//
//  SwiftOpaqueType.swift
//  swiftDemo
//
//  Created by 镭速iOS on 12/1/21.
//  不透明类型
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/23_opaque_types

import UIKit

protocol Shape {
    func draw() -> String
}

//不透明类型解决的问题
//举个例子，假设你正在写一个模块，用来绘制 ASCII 符号构成的几何图形。它的基本特征是有一个 draw() 方法，会返回一个代表最终几何图形的字符串，你可以用包含这个方法的 Shape 协议来描述
struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}


//你可以利用泛型来实现垂直翻转之类的操作，就像下面这样。然而，这种方式有一个很大的局限：翻转操作的结果会暴露我们用于构造结果的泛型类型：
struct FlippedShape<T: Shape>: Shape {
    var shape: T
    
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

//用同样的方式定义了一个 JoinedShape<T: Shape, U: Shape> 结构体，能将几何图形垂直拼接起来。如果拼接一个翻转三角形和一个普通三角形，它就会得到类似于 JoinedShape<FlippedShape<Triangle>, Triangle> 这样的类型。
struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}


class SwiftOpaqueType: NSObject {
    
     func test() {
        
        let small = Triangle(size: 3)
        print(small.draw())
        
        let flippedTriangle = FlippedShape(shape: small)
        print(flippedTriangle.draw())
        
        let joinedTriangles = JoinedShape(top: small, bottom: flippedTriangle)
        print(joinedTriangles.draw())
    }
 
}

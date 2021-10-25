//
//  String.swift
//  swiftDemo
//
//  Created by 镭速iOS on 10/25/21.
//  字符串
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters

import UIKit

class String: NSObject {
    //Swift 的 String 类型与 Foundation NSString 类进行了无缝桥接。Foundation 还对 String 进行扩展使其可以访问 NSString 类型中定义的方法。这意味着调用那些 NSString 的方法，你无需进行任何类型转换
    
    func test() {
        //多行字符串字面量
        // """ 需要单独一行
        var quotation = """
        jadjaljljez;k;k
        a;kdpiepqiejlnxlvnl
        mmzlkpipripqiprik;f
        
        """
        
        //如果你想换行，以便加强代码的可读性，但是你又不想在你的多行字符串字面量中出现换行符的话，你可以用在行尾写一个反斜杠（\）作为续行符
        
        quotation = """
                jafjoofapipirqpirpoqrak;fjsiqrjfo\
qpiprmfakprpiiiiqprpksfkak\
jaooqrkk

"""
        print("quotation = \(quotation)")
        
        
        //字符串字面量可以包含以下特殊字符：
        //转义字符 \0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
        //Unicode 标量，写成 \u{n}(u 为小写)，其中 n 为任意一到八位十六进制数且可用的 Unicode 位码
        let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
        // "Imageination is more important than knowledge" - Enistein
        let dollarSign = "\u{24}"             // $，Unicode 标量 U+0024
        let blackHeart = "\u{2665}"           // ♥，Unicode 标量 U+2665
        let sparklingHeart = "\u{1F496}"      // 💖，Unicode 标量 U+1F496
        
        
    }
    
    
    
    
}

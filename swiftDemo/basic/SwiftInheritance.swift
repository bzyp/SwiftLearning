//
//  SwiftInheritance.swift
//  swiftDemo
//
//  Created by 镭速iOS on 11/11/21.
//

import UIKit

class SwiftInheritance: NSObject {
    
    //重写
    //子类可以为继承来的实例方法，类方法，实例属性，类属性，或下标提供自己定制的实现。我们把这种行为叫重写
    //override：swift重写需要添加override关键字
    //super：访问超类方法可以使用super
    //如果你在重写属性中提供了 setter，那么你也一定要提供 getter。如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过 super.someProperty 来返回继承来的值
    
    //防止重写
    //final:属性、方法和类通过关键字final防止重写
    
}

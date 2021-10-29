//
//  SwiftControl.swift
//  swiftDemo
//
//  Created by 镭速iOS on 10/27/21.
//  swift控制流
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/05_control_flow

import UIKit

class SwiftControl: NSObject {
    
    func test() {
        
        // forin
        for index in 1...5 {
            print(index)
        }
        
        //while 循环的另外一种形式是 repeat-while，它和 while 的区别是在判断循环条件之前，先执行一次循环的代码块。然后重复循环直到条件为 false
        //c的do-while循环
        var num = 0
        
        repeat{
           //先执行一次，在检查表达式，直到条件为false
            print("num = \(num)")
            num += 1
        }while num < 10
        
        //switch 贯穿
        //switch 默认是不贯穿的,贯穿需要fallthrough
        num = 0
        switch num {
        case 0:
            print("case0 = \(num)")
            fallthrough
        case 1:
            print("case1 = \(num)")
            fallthrough
        case 2:
            print("case2 = \(num)")
            fallthrough
        default:
            print("default = \(num)")
        }
        
        
        //值绑定（Value Bindings）
        //case 分支允许将匹配的值声明为临时常量或变量，并且在 case 分支体内使用 —— 这种行为被称为值绑定（value binding），因为匹配的值在 case 分支体内，与临时的常量或变量绑定。
        let anotherPoint = (2, 0)
        switch anotherPoint {
        case (let x, 0):
            print(x)
        case (2, let y):
            print(y)
        default:
            print(anotherPoint)
        }
        
        //Where
        //case 分支的模式可以使用 where 语句来判断额外的条件
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        // 输出“(1, -1) is on the line x == -y”
        
        //复合型 Cases
        let someCharacter: Character = "e"
        switch someCharacter {
        case "a", "e", "i", "o", "u":
            print("\(someCharacter) is a vowel")
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            print("\(someCharacter) is a consonant")
        default:
            print("\(someCharacter) is not a vowel or a consonant")
        }
        // 输出“e is a vowel”
        
        //带标签的语句
        loop: while false {
            continue loop
        }
        
        
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        gameLoop: while square != finalSquare {
            diceRoll += 1
            if diceRoll == 7 { diceRoll = 1 }
            switch square + diceRoll {
            case finalSquare:
                // 骰子数刚好使玩家移动到最终的方格里，游戏结束。
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                // 骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子
                continue gameLoop
            default:
                // 合法移动，做正常的处理
                square += diceRoll
                square += board[square]
            }
        }
//        如果骰子数刚好使玩家移动到最终的方格里，游戏结束。break gameLoop 语句跳转控制去执行 while 循环体后的第一行代码，意味着游戏结束。
//        如果骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子。continue gameLoop 语句结束本次 while 循环，开始下一次循环。
//        在剩余的所有情况中，骰子数产生的都是合法的移动。玩家向前移动 diceRoll 个方格，然后游戏逻辑再处理玩家当前是否处于蛇头或者梯子的底部。接着本次循环结束，控制跳转到 while 循环体的条件判断语句处，再决定是否需要继续执行下次循环。
        
//        如果上述的 break 语句没有使用 gameLoop 标签，那么它将会中断 switch 语句而不是 while 循环。使用 gameLoop 标签清晰的表明了 break 想要中断的是哪个代码块。
//        同时请注意，当调用 continue gameLoop 去跳转到下一次循环迭代时，这里使用 gameLoop 标签并不是严格必须的。因为在这个游戏中，只有一个循环体，所以 continue 语句会影响到哪个循环体是没有歧义的。然而，continue 语句使用 gameLoop 标签也是没有危害的。这样做符合标签的使用规则，同时参照旁边的 break gameLoop，能够使游戏的逻辑更加清晰和易于理解
        
        
    }
    
}

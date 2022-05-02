import UIKit


var varToChange = 0

func testDefer(level:String) {
    //作用域1整个函数是作用域
    defer{
        print("varToChange = \(varToChange)")
    }
    print("1-1")
    
    varToChange = 1
    
    if level == "2" {
        //作用域2 if作用域
        print("2--1")
        defer {
            print("2--2")
        }
        print("2--3")
    }
    print("1-2")
    
    defer {
        print("1-3")
    }
    print("1-4")
    
    if level == "3" {
        //作用域3 if作用域
        print("3---1")
        defer {
            print("3---2")
        }
        print("3---3")
        
        defer {
            print("3---4")
        }
    }
    print("1-5")
    defer {
        print("1-6")
    }
}

//testDefer(level: "")
//testDefer(level: "2")
testDefer(level: "3")

/*
 总结：
 defer 会在当前作用域(并不仅限于函数)结束时执行。
 defer 执行的顺序为逆序(栈式)。
 defer 中捕获的变量的值是可以进行变更的。
 */

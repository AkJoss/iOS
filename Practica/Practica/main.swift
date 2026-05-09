//
//  main.swift
//  Practica
//
//  Created by José Alberto Rocha Munguía on 18/02/26.
//

//import Foundation

var a : Int? = 4
print (a!)

var b : Int? = 5
print (b)
//print (b!)

if let new_b = b {
    print (new_b)
}

else {
    print("variable nula")
}

//print(a!) Error
if let new_a = a {
    print(new_a)
}

else {
    print("variable nula")
}
    
print (5 is Int)
print ("swift" is Int)

func getEmail(correo:String) {
    var correo : String? = "josealrocmun@outlook.com"
    print (correo!)
    //print (b!)

    if let new_correo = correo {
    print ("Mi correo es:" + new_correo)
    }

    else {
        print("variable nula")
    }

}

a = Int("123")
print(a!)

func convert(num:String) -> Int?{
    
    var num : Int? = Int(num)

    if let new_num = num {
    num = new_num + 10
    }

    else {
        print("no castear")
        num = nil
    }
    return num
}

let valor : Any = 123 as Int
print(valor) /// 123


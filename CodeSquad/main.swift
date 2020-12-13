//
//  main.swift
//  CodeSquad
//
//  Created by jinseo park on 12/7/20.
//  Copyright © 2020 JacksonKR. All rights reserved.
//
//2단계: 평면 큐브 구현하기

//Cube의 모양
//R R W
//G C W
//G B B

import Foundation

class Cube{
    
    var myCube = [[[String]]]() //3x3 큐브
    //var inputChar : String = ""
    init(){
        self.myCube = [[["B","B","B"],["B","B","B"],["B","B","B"]],[["W","W","W"],["W","W","W"],["W","W","W"]],[["O","O","O"],["O","O","O"],["O","O","O"]],[["G","G","G"],["G","G","G"],["G","G","G"]],[["Y","Y","Y"],["Y","Y","Y"],["Y","Y","Y"]],[["R","R","R"],["R","R","R"],["R","R","R"]]]
    }
    
    
    func printMyCube(){ //3차원배열을 볼 수 있는 함수.
        
        for i in 0..<myCube.count{
            //print("i index = \(i)")
            var line = ""
            for j in 0..<myCube[i].count{
                for k in 0..<myCube[i][j].count{
                    //print("현재 k index = \(k)")
                    line += myCube[i][j][k]
                    line += " "
                }
                line+="\n"
                
            }
            print(line)
        }
    }
}



let mycube = Cube()

mycube.printMyCube()




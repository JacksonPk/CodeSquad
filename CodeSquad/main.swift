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
    var myCube = [[String]]() //2차원 문자열 배열 생성
    init(){
        self.myCube = [["R","R","W"],["G","C","W"],["G","B","B"]]
    }
    
    func printMyCube(){ //2차원 배열을 가시적으로 확인 하도록 프린트할 수 있는 함수.
        
        for i in 0..<myCube.count{
            var line = ""
            for j in 0..<myCube[i].count{
                line += myCube[i][j]
                line += " "
            }
            print(line)
        }
    }
}


let mycube = Cube()
mycube.printMyCube()

//var a = "A"
//print(a)


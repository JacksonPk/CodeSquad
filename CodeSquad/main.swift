//
//  main.swift
//  CodeSquad
//
//  Created by jinseo park on 12/7/20.
//  Copyright © 2020 JacksonKR. All rights reserved.
//

////                (self.myCube[0][0][0], self.myCube[0][0][1], self.myCube[0][0][2], self.myCube[0][1][0], self.myCube[0][1][2], self.myCube[0][2][0], self.myCube[0][2][1], self.myCube[0][2][2]) =
//                    (self.myCube[0][2][0],self.myCube[0][1][0],self.myCube[0][0][0], self.myCube[0][2][1], self.myCube[0][0][1], self.myCube[0][2][2], self.myCube[0][1][2], self.myCube[0][0][2])
//

import Foundation

extension String{ //regix 정규식 문법 관련 함수
    func getArrayAfterRegex(regex: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

class Cube{
    
    var myCube = [[[String]]]() //3x3 큐브
    
    var countRoatation : Int = 0
    //var inputChar : String = ""
    init(){
        //        self.myCube = [[["B","B","B"],["B","B","B"],["B","B","B"]],[["W","W","W"],["W","W","W"],["W","W","W"]],[["O","O","O"],["O","O","O"],["O","O","O"]],[["G","G","G"],["G","G","G"],["G","G","G"]],[["Y","Y","Y"],["Y","Y","Y"],["Y","Y","Y"]],[["R","R","R"],["R","R","R"],["R","R","R"]]]
        self.myCube = [[["1","2","3"],["4","C","6"],["7","8","9"]],[["W","W","W"],["W","W","W"],["W","W","W"]],[["O","O","O"],["O","O","O"],["O","O","O"]],[["G","G","G"],["G","G","G"],["G","G","G"]],[["Y","Y","Y"],["Y","Y","Y"],["Y","Y","Y"]],[["R","R","R"],["R","R","R"],["R","R","R"]]]
        
    }
    func switchCubeCenter(CIndex : Int ,direction : String){
        
        if(direction == "L"){ //clock
            (self.myCube[CIndex][0][0], self.myCube[CIndex][0][1], self.myCube[CIndex][0][2], self.myCube[CIndex][1][0], self.myCube[CIndex][1][2], self.myCube[CIndex][2][0], self.myCube[CIndex][2][1], self.myCube[CIndex][2][2]) =
                (self.myCube[CIndex][2][0],self.myCube[CIndex][1][0],self.myCube[CIndex][0][0], self.myCube[CIndex][2][1], self.myCube[CIndex][0][1], self.myCube[CIndex][2][2], self.myCube[CIndex][1][2], self.myCube[CIndex][0][2])
            
        }else if(direction == "R"){//counter-clock
            (self.myCube[CIndex][0][0], self.myCube[CIndex][0][1], self.myCube[CIndex][0][2], self.myCube[CIndex][1][0], self.myCube[CIndex][1][2], self.myCube[CIndex][2][0], self.myCube[CIndex][2][1], self.myCube[CIndex][2][2]) =
            (self.myCube[CIndex][0][2],self.myCube[CIndex][1][2],self.myCube[CIndex][2][2], self.myCube[CIndex][0][1], self.myCube[CIndex][2][1], self.myCube[CIndex][0][0], self.myCube[CIndex][1][0], self.myCube[CIndex][2][0])
        }
    }
    func switchCube(inputWords : String){
        
        var disassembleStrs : [String] = []
        
        disassembleStrs = inputWords.getArrayAfterRegex(regex: "[FRUBLD][1-9]?[/']?")
        
        countRoatation += disassembleStrs.count
        
        print(disassembleStrs)
        
        for item in disassembleStrs { //disassembleStrs 순서대로 큐브를 바꾼다.
            
            switch item {
            case "U":
                //1. 가장 윗면 바꾸기.
                //2. 윗면에 포함된 중앙4면을 바꾸기
                print("U : 가장 위 큐브 시계방향 회전" )
                
                switchCubeCenter(CIndex: 0 , direction: "L")
                (self.myCube[1][0],self.myCube[2][0],self.myCube[3][0],self.myCube[4][0])=(self.myCube[2][0],self.myCube[3][0],self.myCube[4][0],self.myCube[1][0])
                                
            case "U'":
                print("U : 가장 위 큐브 시계반대방향 회전" )
                switchCubeCenter(CIndex: 0, direction: "R")
                (self.myCube[1][0],self.myCube[2][0],self.myCube[3][0],self.myCube[4][0])=(self.myCube[4][0],self.myCube[1][0],self.myCube[2][0],self.myCube[3][0])
//            case "R":
//                print("R : 가장 오른쪽 줄을 위로 한 칸 밀기" )
//                (self.myCube[0][2], self.myCube[1][2], self.myCube[2][2]) = (self.myCube[1][2], self.myCube[2][2], self.myCube[0][2])
//            case "R'":
//                print("R' : 가장 오른쪽 줄을 아래로 한 칸 밀기" )
//                (self.myCube[0][2], self.myCube[1][2], self.myCube[2][2]) = (self.myCube[2][2], self.myCube[0][2], self.myCube[1][2])
//            case "L":
//                print("L : 가장 왼쪽 줄을 아래로 한 칸 밀기" )
//                (self.myCube[0][0], self.myCube[1][0], self.myCube[2][0]) = (self.myCube[2][0], self.myCube[0][0], self.myCube[1][0])
//            case "L'":
//                print("L' : 가장 왼쪽 줄을 위로 한 칸 밀기" )
//                (self.myCube[0][0], self.myCube[1][0], self.myCube[2][0]) = (self.myCube[1][0], self.myCube[2][0], self.myCube[0][0])
//            case "B":
//                print("B : 가장 아랫줄을 오른쪽으로 한 칸 밀기 " )
//                (self.myCube[2][0], self.myCube[2][1], self.myCube[2][2]) = (self.myCube[2][2], self.myCube[2][0], self.myCube[2][1])
//            case "B'":
//                print("B' : 가장 아랫줄을 왼쪽으로 한 칸 밀기" )
//                (self.myCube[2][0], self.myCube[2][1], self.myCube[2][2]) = (self.myCube[2][1], self.myCube[2][2], self.myCube[2][0])
//
            default:
                print("default")
            }
            
            
        }
        //print(disassembleStrs)
        //정규식을 사용해서 문자를 자른다. ' 가 옵션이다.
        printMyCube()
    }
    
    func checkReadLine(){ //사용자로부터 값을 받아서 규약된 값인지 체크하는 함수, 최소한 하나의 명령어가 입력이 되면 switch 함수로 넘긴다.
        while(true){
            print("CUBE >" , terminator : " ")
            let inputWords = readLine()
            
            if let inputWords = inputWords{
                //Q , q 를 입력하면 프로그램 종료
                if(inputWords == "Q" || inputWords == "q"){
                    print("조작갯수 : \(countRoatation)")
                    print("이용해주셔서 감사합니다. 뚜뚜뚜.")
                    exit(0)
                }else{
                    
                    let inputWordsUpperCase = inputWords.uppercased()
                    let charset = CharacterSet(charactersIn: "FRUBLD'") //받아야 하는 input이 다음 캐릭터셋 안에 있어야만 한다.
                    
                    if((inputWordsUpperCase.rangeOfCharacter(from: charset)) != nil){
                        switchCube(inputWords: inputWordsUpperCase)
                        
                    }else{
                        print("None Chars supposed to be in inputwords")
                        continue
                    }
                }
            }
        }
    }
    
    
    func printMyCube(){ //3차원배열을 볼 수 있는 함수.
        
        for i in 0..<myCube.count{
            var line = ""
            for j in 0..<myCube[i].count{
                for k in 0..<myCube[i][j].count{
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
mycube.checkReadLine()




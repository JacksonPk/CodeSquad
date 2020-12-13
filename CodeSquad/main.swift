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

//스위칭시킬때 윗면과 밑면을 고정으로 한다고 가정했을 때, 중앙의 4면을 옮긴느 것은 다르게 생각하면 해당면을 위로 바꾸고 다시 옮기는것과 같다.
//따라서 l, f, r, b 일때는 큐브 자체를 바꾸고 돌린다음 다시 원상태로 옮기면 된다.

//숫자가 들어올때 그만큼 생성시켜야함.
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
        self.myCube = [[["B","B","B"],["B","B","B"],["B","B","B"]],[["W","W","W"],["W","W","W"],["W","W","W"]],[["O","O","O"],["O","O","O"],["O","O","O"]],[["G","G","G"],["G","G","G"],["G","G","G"]],[["Y","Y","Y"],["Y","Y","Y"],["Y","Y","Y"]],[["R","R","R"],["R","R","R"],["R","R","R"]]]
        //        self.myCube = [[["W1","W2","W3"],["W4","WC","W6"],["W7","W8","W9"]],[["O1","O2","O3"],["O4","OC","O6"],["O7","O8","O9"]],[["G1","G2","G3"],["G4","GC","G6"],["G7","G8","G9"]],[["R1","R2","R3"],["R4","RC","R6"],["R7","R8","R9"]],[["B1","B2","B3"],["B4","BC","B6"],["B7","B8","B9"]],[["Y1","Y2","Y3"],["Y4","YC","Y6"],["Y7","Y8","Y9"]]]
        
    }
    func switchCubeCenter(index : Int, direction : String){ //가장 윗면을 기준으로 나머지 변경
        
        if(direction == "R"){ //clock
            (self.myCube[index][0][0], self.myCube[index][0][1], self.myCube[index][0][2], self.myCube[index][1][0], self.myCube[index][1][2], self.myCube[index][2][0], self.myCube[index][2][1], self.myCube[index][2][2]) =
                (self.myCube[index][2][0],self.myCube[index][1][0],self.myCube[index][0][0], self.myCube[index][2][1], self.myCube[index][0][1], self.myCube[index][2][2], self.myCube[index][1][2], self.myCube[index][0][2])
            
            
            
        }else if(direction == "L"){//counter-clock
            (self.myCube[index][0][0], self.myCube[index][0][1], self.myCube[index][0][2], self.myCube[index][1][0], self.myCube[index][1][2], self.myCube[index][2][0], self.myCube[index][2][1], self.myCube[index][2][2]) =
                (self.myCube[index][0][2],self.myCube[index][1][2],self.myCube[index][2][2], self.myCube[index][0][1], self.myCube[index][2][1], self.myCube[index][0][0], self.myCube[index][1][0], self.myCube[index][2][0])
            
            
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
                //1. 가장 윗면 바꾸기. (B 기준)
                //2. 윗면에 포함된 중앙4면을 바꾸기
                print("U : 가장 위 큐브 면 시계방향 회전" )
                switchCubeCenter(index : 0, direction: "R")
                (self.myCube[1][0],self.myCube[2][0],self.myCube[3][0],self.myCube[4][0])=(self.myCube[2][0],self.myCube[3][0],self.myCube[4][0],self.myCube[1][0])
                
            case "U'":
                print("U : 가장 위 큐브 면 시계반대방향 회전" )
                switchCubeCenter(index : 0, direction: "L")
                (self.myCube[1][0],self.myCube[2][0],self.myCube[3][0],self.myCube[4][0])=(self.myCube[4][0],self.myCube[1][0],self.myCube[2][0],self.myCube[3][0])
                
            case "R":
                //1. 큐브 자체를 왼쪽으로 돌림
                //2. G가 윗면이 되는 형식으로 됨.
                //3. 똑같이 switch를 한다
                //4. 다시 B가 윗면으로 돌아오게 바꾼다.
                print("R' : 가장 오른쪽 큐브 면 시계방향 회전" )
                
                switchCubeCenter(index : 3, direction: "R")
                
                (self.myCube[0][0][2],self.myCube[0][1][2],self.myCube[0][2][2], self.myCube[2][0][2],self.myCube[2][1][2],self.myCube[2][2][2],self.myCube[4][0][0],self.myCube[4][1][0],self.myCube[4][2][0],self.myCube[5][0][2],self.myCube[5][1][2],self.myCube[5][2][2]) = (self.myCube[2][0][2],self.myCube[2][1][2],self.myCube[2][2][2],self.myCube[5][0][2],self.myCube[5][1][2],self.myCube[5][2][2],self.myCube[0][0][2],self.myCube[0][1][2],self.myCube[0][2][2],self.myCube[4][0][0],self.myCube[4][1][0],self.myCube[4][2][0])
                
                
                
                
            case "R'":
                print("R' : 가장 오른쪽 큐브 면 시계반대방향 회전" )
                
                switchCubeCenter(index : 3, direction: "L")
                
                (self.myCube[0][0][2],self.myCube[0][1][2],self.myCube[0][2][2],self.myCube[2][0][2],self.myCube[2][1][2],self.myCube[2][2][2],self.myCube[4][0][0],self.myCube[4][1][0],self.myCube[4][2][0],self.myCube[5][0][2],self.myCube[5][1][2],self.myCube[5][2][2]) = (self.myCube[4][0][0],self.myCube[4][1][0],self.myCube[4][2][0],self.myCube[0][0][2],self.myCube[0][1][2],self.myCube[0][2][2],self.myCube[5][0][2],self.myCube[5][1][2],self.myCube[5][2][2],self.myCube[2][0][2],self.myCube[2][1][2],self.myCube[2][2][2])
                
                
                
            case "L":
                print("L : 가장 왼쪽 큐브 면 시계방향 회전" )
                
                switchCubeCenter(index : 1, direction: "R")
                (self.myCube[0][0][0],self.myCube[0][1][0],self.myCube[0][2][0],self.myCube[2][0][0],self.myCube[2][1][0],self.myCube[2][2][0],self.myCube[4][0][2],self.myCube[4][1][2],self.myCube[4][2][2],self.myCube[5][0][0],self.myCube[5][1][0],self.myCube[5][2][0]) = (self.myCube[4][0][2],self.myCube[4][1][2],self.myCube[4][2][2],self.myCube[0][0][0],self.myCube[0][1][0],self.myCube[0][2][0],self.myCube[5][0][0],self.myCube[5][1][0],self.myCube[5][2][0],self.myCube[2][0][0],self.myCube[2][1][0],self.myCube[2][2][0])
                
            case "L'":
                
                switchCubeCenter(index : 1, direction: "L")
                (self.myCube[0][0][0],self.myCube[0][1][0],self.myCube[0][2][0],self.myCube[2][0][0],self.myCube[2][1][0],self.myCube[2][2][0],self.myCube[4][0][2],self.myCube[4][1][2],self.myCube[4][2][2],self.myCube[5][0][0],self.myCube[5][1][0],self.myCube[5][2][0]) = (self.myCube[2][0][0],self.myCube[2][1][0],self.myCube[2][2][0],self.myCube[5][0][0],self.myCube[5][1][0],self.myCube[5][2][0],self.myCube[0][0][0],self.myCube[0][1][0],self.myCube[0][2][0],self.myCube[4][0][2],self.myCube[4][1][2],self.myCube[2][2][2])
                
            case "F":
                print("F : 가장 앞 큐브 면 시계방향 회전" )
                
                switchCubeCenter(index : 2 , direction: "R")
                
                (self.myCube[0][2][0],self.myCube[0][2][1],self.myCube[0][2][2],self.myCube[1][0][2],self.myCube[1][1][2],self.myCube[1][2][2],self.myCube[5][0][0],self.myCube[5][0][1],self.myCube[5][0][2],self.myCube[3][0][0],self.myCube[3][1][0],self.myCube[3][2][0]) = (self.myCube[1][0][2],self.myCube[1][1][2],self.myCube[1][2][2],self.myCube[5][0][0],self.myCube[5][0][1],self.myCube[5][0][2],self.myCube[3][0][0],self.myCube[3][1][0],self.myCube[3][2][0],self.myCube[0][2][0],self.myCube[0][2][2],self.myCube[0][2][2])
                
                
            case "F'":
                print("F' : 가장 앞 큐브 면 시계반대방향 회전" )
                switchCubeCenter(index : 2 , direction: "L")
                
                (self.myCube[0][2][0],self.myCube[0][2][1],self.myCube[0][2][2],self.myCube[1][0][2],self.myCube[1][1][2],self.myCube[1][2][2],self.myCube[3][0][0],self.myCube[3][1][0],self.myCube[3][2][0],self.myCube[5][0][0],self.myCube[5][0][1],self.myCube[5][0][2]) = (self.myCube[3][0][0],self.myCube[3][1][0],self.myCube[3][2][0],self.myCube[0][2][0],self.myCube[0][2][1],self.myCube[0][2][2],self.myCube[5][0][0],self.myCube[5][0][1],self.myCube[5][0][2],self.myCube[1][0][2],self.myCube[1][1][2],self.myCube[1][2][2])
                
                
                
            case "B":
                print("B : 가장 뒷 큐브 면 시계방향 회전" )
                switchCubeCenter(index : 4 , direction: "L")
                
                (self.myCube[0][0][0],self.myCube[0][0][1],self.myCube[0][0][2],self.myCube[1][0][0],self.myCube[1][1][0],self.myCube[1][2][0],self.myCube[3][0][2],self.myCube[3][1][2],self.myCube[3][2][2],self.myCube[5][2][0],self.myCube[5][2][1],self.myCube[5][2][2])=(self.myCube[3][0][2],self.myCube[3][1][2],self.myCube[3][2][2],self.myCube[0][0][0],self.myCube[0][0][1],self.myCube[0][0][2],self.myCube[5][2][0],self.myCube[5][2][1],self.myCube[5][2][2],self.myCube[1][0][0],self.myCube[1][1][0],self.myCube[1][2][0])
                
                
                
            case "B'":
                print("B' : 가장 뒷 큐브 면 시계반대방향 회전" )
                switchCubeCenter(index : 4 , direction: "R")
                
                
                (self.myCube[0][0][0],self.myCube[0][0][1],self.myCube[0][0][2],self.myCube[1][0][0],self.myCube[1][1][0],self.myCube[1][2][0],self.myCube[3][0][2],self.myCube[3][1][2],self.myCube[3][2][2],self.myCube[5][2][0],self.myCube[5][2][1],self.myCube[5][2][2])=(self.myCube[1][0][0],self.myCube[1][1][0],self.myCube[1][2][0],self.myCube[5][2][0],self.myCube[5][2][1],self.myCube[5][2][2],self.myCube[0][0][0],self.myCube[0][0][1],self.myCube[0][0][2],self.myCube[3][0][2],self.myCube[3][1][2],self.myCube[3][2][2])
                
                
                
            case "D":
                print("D : 가장 밑 큐브 면 시계방향 회전" )
                switchCubeCenter(index : 5 , direction: "R")
                (self.myCube[1][2],self.myCube[2][2],self.myCube[3][2],self.myCube[4][2]) =
                    (self.myCube[4][2],self.myCube[1][2],self.myCube[2][2],self.myCube[3][2])
                
                
            case "D'":
                print("D' : 가장 뒷 큐브 면 시계반대방향 회전" )
                
                switchCubeCenter(index : 5 , direction: "L")
                (self.myCube[1][2],self.myCube[2][2],self.myCube[3][2],self.myCube[4][2]) =
                    (self.myCube[2][2],self.myCube[3][2],self.myCube[4][2],self.myCube[1][2])
                
            default:
                print("default")
            }
            printMyCube()
            
        }
        //print(disassembleStrs)
        //정규식을 사용해서 문자를 자른다. ' 가 옵션이다.
        
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



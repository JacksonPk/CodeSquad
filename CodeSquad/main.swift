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

    var myCube = [[String]]() //2차원 문자열 배열 생성
    //var inputChar : String = ""
    init(){
        self.myCube = [["R","R","W"],["G","C","W"],["G","B","B"]]
    }
    
    func switchCube(inputWords : String){
//       var disassembleChars : [Character] = []
        var disassembleStrs : [String] = []
        
        disassembleStrs = inputWords.getArrayAfterRegex(regex: "[URLB][/']?")
        print(disassembleStrs)
        //정규식을 사용해서 문자를 자른다. ' 가 옵션이다.
        //printMyCube()
    }
    
    func checkReadLine(){ //사용자로부터 값을 받아서 규약된 값인지 체크하는 함수
        while(true){
            print("CUBE >" , terminator : " ")
            let inputWords = readLine()
            
            if let inputWords = inputWords{
                //Q , q 를 입력하면 프로그램 종료
                if(inputWords == "Q" || inputWords == "q"){
                    exit(0)
                }else{
                
                    let inputWordsUpperCase = inputWords.uppercased()
                    let charset = CharacterSet(charactersIn: "URLB'") //받아야 하는 input이 다음 캐릭터셋 안에 있어야만 한다.
                    
                    if((inputWordsUpperCase.rangeOfCharacter(from: charset)) != nil){
                        print(inputWordsUpperCase)
                        switchCube(inputWords: inputWordsUpperCase)
                        
                    }else{
                        print("None Chars supposed to be in inputwords")
                        continue
                    }
                    
                
                }
                
            }
        }
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
mycube.checkReadLine()
//mycube.printMyCube()



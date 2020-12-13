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
    
    var myCube = [[[String]]]() //3x3 큐브
    //var inputChar : String = ""
    init(){
        self.myCube = [[["B","B","B"],["B","B","B"],["B","B","B"]],[["W","W","W"],["W","W","W"],["W","W","W"]],[["O","O","O"],["O","O","O"],["O","O","O"]],[["G","G","G"],["G","G","G"],["G","G","G"]],[["Y","Y","Y"],["Y","Y","Y"],["Y","Y","Y"]],[["R","R","R"],["R","R","R"],["R","R","R"]]]
    }
    
    
    func checkReadLine(){ //사용자로부터 값을 받아서 규약된 값인지 체크하는 함수, 최소한 하나의 명령어가 입력이 되면 switch 함수로 넘긴다.
        while(true){
            print("CUBE >" , terminator : " ")
            let inputWords = readLine()
            
            if let inputWords = inputWords{
                //Q , q 를 입력하면 프로그램 종료
                if(inputWords == "Q" || inputWords == "q"){
                    print("이용해주셔서 감사합니다. 뚜뚜뚜.")
                    exit(0)
                }else{
                    
                    let inputWordsUpperCase = inputWords.uppercased()
                    let charset = CharacterSet(charactersIn: "FRUBLD'") //받아야 하는 input이 다음 캐릭터셋 안에 있어야만 한다.
                    
                    if((inputWordsUpperCase.rangeOfCharacter(from: charset)) != nil){
                        print(inputWordsUpperCase)
                        
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

mycube.checkReadLine()




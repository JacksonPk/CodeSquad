//
//  main.swift
//  CodeSquad
//
//  Created by jinseo park on 12/7/20.
//  Copyright © 2020 JacksonKR. All rights reserved.
//
// step-1
/*
 1단계: 단어 밀어내기 구현하기
    1.입력: 사용자로부터 단어 하나, 정수 숫자 하나( -100 <= N < 100) , L 또는 R을 입력받는다. L 또는 R은 대소문자 모두 입력 가능하다.
    2.주어진 단어를 L이면 주어진 숫자 갯수만큼 왼쪽으로, R이면 오른쪽으로 밀어낸다.
    3.밀려나간 단어는 반대쪽으로 채워진다.
 */


/*
 구현로직 생각하기.
 1. 단어입력을 받기
 2. 띄어쓰기를 바탕으로 총 3개의 단어를 받기.
 */
//입력방식 : ReadLine() 함수

import Foundation

/*class Vars{
    var word : String
    var num : Int
    var direction : String

    init(word:String, num:Int, direction:String) {
        self.word = word
        self.num = num
        self.direction = direction
    }

    func printVars(){
        print("word = "+self.word+" num = "+self.num+" direction = "+self.direction)
        //print("hello World")
    }
}*/

/* 인풋단어 체크하는 함수*/
func checkReadLine() ->(word: String, num: Int, direction: String){

    while(true){
        
        let inputWords = readLine()
        
        if let inputWords = inputWords{
            let arrayWord = inputWords.components(separatedBy: " ")
            
            if(arrayWord.count != 3){ //입력해야 하는 단어는 총 3개이므로
                print("Wrong Input Count")
                continue
            }
            
            let word = String(arrayWord[0])
            let num : Int = Int(arrayWord[1]) ?? 101 //타입캐스팅시에 int형이 아니면 범위에 벗어난 값을 주어 input오류를 나게 함.
            let direction = String(arrayWord[2])
            
            //num과 direction을 체크하기.
            if(num >= -100 && num<100){
                if(direction == "l" || direction == "L" || direction == "r" || direction == "R"){
                
                    return (word,num,direction)
                    
                }else{
                    print("Wrong direction input")
                    continue
                }
            }else{
                print("Wrong num input")
                continue
            }
        }
    }
    
}

while(true){
    var word : String
    var num : Int
    var direction : String
    //var var : Vars = Vars()
    //let inputWords = readLine()
    
    (word,num,direction) = checkReadLine()
    print(word,num,direction)
        //inputVar.printVars()
    
}
    



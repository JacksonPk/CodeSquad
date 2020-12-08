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
            var direction = String(arrayWord[2])
            
            //num과 direction을 체크하기.
            if(num >= -100 && num<100){
                if(direction == "l" || direction == "L" || direction == "r" || direction == "R"){
                    
                    direction = direction.uppercased()
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

func pushOutWords(word: String, num: Int, direction: String){ //단어밀어내기 함수.
    
    /*
     1.num이 음수이면 양수로 바꾸고 direction을 바꾸기.
     2.num/str.length 을 나눈 나머지값을 구하기
     3.L/R에맞게 구하는 방법을 알기. L을 기준으로 R은 str.length-num
     4.count의 index를 기준으로 잘라서 뒤 + 앞으로 붙이고 return
     */
    let word = word
    var num = num
    var direction = direction
    
    var remainder : Int
    var index : Int
    
    var firstWords : String
    var secondWords : String
    var resultWords : String
    
    //step1
    if(num<0){
        num = num * -1
        if(direction == "L") {direction = "R"}
        else if(direction == "R"){direction = "L"}
    }
    //print("step1 = word = \(word), word count = "+String(word.count)+" "+String(num) + " " + direction)
    
    
    //step2
    remainder = num%word.count
    //print("step2 = remainder = \(remainder)")
    
    
    //step3
    if(direction == "R"){
        index = word.count - remainder
    }else{
        index = remainder
    }
    //print("step3 = index = \(index)")
    
    
    //step4
    let strIndex = word.index(word.startIndex, offsetBy: index)
    
    firstWords = String(word[..<strIndex])
    secondWords = String(word[strIndex...])
    resultWords = secondWords+firstWords
    //print("step4 : firstWords = \(firstWords) , secondWords = \(secondWords) , resultWords = \(resultWords)")
    
    print(resultWords)
    return
    
}

while(true){
    var word : String
    var num : Int
    var direction : String
    
    (word,num,direction) = checkReadLine()
    //print(word,num,direction)
    
    pushOutWords(word: word,num: num,direction: direction)
    
}




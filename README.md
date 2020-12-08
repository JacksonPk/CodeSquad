# CodeSquad
2021 코드스쿼드 코딩테스트

언어 : Swift 이용 MacOS CLT로 컴파일 가능

문제 1
  단어 밀어내기
  
  
구현방식.

1.두 개의 함수를 제작. checkReadLine() , pushOutWords()

- checkReadLine() = 사용자로부터 입력을 받고 구현할 수 있는 제약조건에 부합한지 아닌지르 체크한다.
  - 체크사항1 : " "를 이용하여 총 단어가 3개인지 체크함
  - 체크사항2 : 문자열의 수가 1개이상인지, 정수가 -100이상 100미만인지, 그리고 방향이 (l,L,r,R)에 포함하는지 체크함.
  - 체크사항에 해당한다면 pushOutWords의 인자값을 들어갈 단어를 return하고 그렇지 않으면 체크사항에 부합할때까지 계속 입력값을 받는다.
  
- pushOutWords() = 단어 밀어내기를 위한 알고리즘 함수 구현
  - 다음과 같은 스텝으로 단어 밀어내기를 구현함
  
  - step1 정수가 음수이면 방향을 반댈 바꾸고(ex)L->R) 절대값으로 씌운다.
  
  - step2 문자열의 길이보다 정수가 큰 경우여도 문자열의 길이의 배수로 단어를 밀어내기때문에 정수 % 문자열길이 값을 구함.
  
    -ex) apple 7 l : apple.count = 5, num=7 -> remainder = num%apple.count = 2
    -ex) apple 7 r : apple.count = 5, num=7 -> remainder = num%apple.count = 2
    
  - step3 방향이 오른쪽이면 문자열길이에서 step2에서 구한 나머지값을 뺀만큼 구한다. 이 값은 index가 된다.
  
    -ex) apple 7 l : apple.count = 5, remainder 2 ->index = 2
    -ex) apple 7 r : apple.count = 5, remainder 2 ->index = apple.count-remainder = 3
  
  - step4 구한 index를 기준으로 문자열을 쪼갠 후 두번째문자열+첫번째문자열의 결과값을 print한다.
  
    -ex) apple 7 l : index=2, firstword = ap , secondword=ple -> result = pleap
    -ex) apple 7 r : index=3, firstword = app , secondword=le -> result = leapp
  
  이 알고리즘 방식은 for문을 사용해서 반복적으로 단어를 밀어낼 필요가 없기에 간결하고 효율적인 함수라고 생각한다.
  

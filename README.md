# CodeSquad
2021 코드스쿼드 코딩테스트

언어 : Swift 이용 MacOS CLT로 컴파일 가능

문제 2
  평면 큐브 구현하기
  
  
구현방식.

1.객체 생성 Cube

- Cube에는 2차원 배열을 Init 초기화 시킬수 있으며, switchCube(), checkReadLine(), 그리고 printMyCube()로 구성되어 있다.


- checkReadLine() = 사용자로부터 입력을 받고 구현할 수 있는 제약조건에 부합한지 아닌지 체크한다.
  - 체크사항1 : URLB' 라는 캐릭터(소문자 가능)가 최소 1개 이상인지를 체크하고 없으면 다시 받는다.
  - 체크사항2 : q,Q 를 입력시 프로그램 종료가 되도록 설정하였다.
  - 체크사항3 : 체크사항1에 해당하는 값이 존재한다면 switchCube()함수로 인자값을 전달한다.
  
- switchCube() = 2차원 배열의 swap 함수

  - 처음에는 정규식을 이용하여 U, R, L, B 그리고 '가 옵션으로 붙어있는지 체크한다. (이 정규식을 이용하여서 잘못된 입력값도 필요 부분만 받아들이 된다. ex) u'' -> u')  
  
  - U,R,L,B 에 해당하는 swap을 한다.

ex) U -> 가장 윗줄을 오른쪽으로 한 칸 밀기
  (self.myCube[0][0], self.myCube[0][1], self.myCube[0][2]) = (self.myCube[0][2], self.myCube[0][0], self.myCube[0][1])
  
  
- printMyCube() = 각 입력값마다 변화하는 배열을 확인할 수 있다
  

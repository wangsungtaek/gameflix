## gameflix (2차 팀프로젝트)

<br>

### 주제

> 게임 웹 사이트 제작 

### 주제 선정이유

> 게임을 개발함으로써 다양한 알고리즘을 고민해 볼 수 있음.

> 게임관리 및 랭킹 시스템을 도입하여 동적인 페이지를 제작할 수 있음. 

### 기간

> 21.02.02 ~ 21.02.26

<br>

### 담당영역

> 메인화면

> sort 게임

> 게임검색

> 게임등록 && 삭제

<br>

### 목표

1. JSP를 사용한 웹사이트 개발을 할 수 있다.
2. MVC1 방식을 활용한 웹 사이트 구축
3. DB 서버에 접속하여 데이터를 조작할 수 있다. (CRUD)

<br>

### 어려웠던 점

- 문제 : 데이터의 양이 많아짐에 따라 한 페이지에서 모든 데이터를 표기하기에 부적합 발생

- 해결 : 페이징 기능을 적용하여 데이터의 양에 따라 동적으로 변화하는 페이지를 완성할 수 있었음

<br>

### 느낀점

데이터베이스의 설계가 잘 되어야 한다는 것을 느꼈다. 중간에 데이터베이스 테이블을 변경하는 것만으로

의존하고 있는 코드들의 수정이 많아짐을 느낄 수 있었다.

또한 페이징 기능을 위해 이것저것 많은 코드들의 작성을 하다 보니 코드의 난잡함을 느낄 수 있었고

MVC2 방식의 구현이 필요하다고 느껴서 나중에 추가된 검색 기능에 적용을 해보았는데 분업할 때도 좋을 거 같고

코드의 가독성이 좋아짐을 느낄 수 있었다.

<br>

___

#### 담당 : 음료통합게임

- bottle을 클래스로 만들어서 속성으로 1층부터 7층까지의 이미지 경로를 포함하고 있고 이를 조건문으로 검사해서 성공유무를 확인한다. 

- 게임성공 시 흭득한 포인트는 데이터베이스의 플레이로그(Play Log) 테이블에 추가된다.

![ezgif com-gif-maker](https://user-images.githubusercontent.com/68735491/109457493-4ec6b980-7a9e-11eb-9e4b-0ee503e8be6b.gif)

<br>

#### 담당 : 메인페이지

- 인기 게임은 데이터베이스의 플레이 횟수를 비교하여 가장 많이 플레이한 게임 3개의를 표시한다.

- 최신 게임은 등록일 기준으로 정렬하여 3개를 표시한다.

- 전체 게임은 등록된 모든 게임을 표시한다.

- 우측에 유저랭킹은 유저들간의 흭득한 포인트를 비교하여 TOP5를 선정한다.

![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/68735491/109457883-183d6e80-7a9f-11eb-80d3-9fd6c6f27b5f.gif)

<br>

#### 담당 : 게임등록 && 게임삭제
 
- 게임 관리 페이지에서 등록 및 삭제를 할 수 있다.

- 등록하게 되면 네비게이션바에 등록된 게임이 표시된다.

- 체크박스에 체크된 항목을 삭제할 수 있다. (일괄 삭제, 다중 삭제)

![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/68735491/109458453-250e9200-7aa0-11eb-9385-6f565d71341a.gif)

<br>

#### 담당 : 검색

- 게임명의 키워드를 통해 검색이 가능하다.

![ezgif com-gif-maker](https://user-images.githubusercontent.com/68735491/109458765-d0b7e200-7aa0-11eb-8f38-338be3632e27.gif)


<br>

# 📖 단국대 구성원을 위한 스터디 앱 DANMOA

![danmoa_intro](https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/intro.png?raw=true)

<br>

## 1. 프로젝트 소개

- 단국대 구성원들의 그룹 스터디를 돕는 앱입니다.
- 스터디를 만들거나 찾으며 목표가 같은 사람들끼리 쉽게 모일 수 있습니다.
- 스터디 공부 주제를 찾지 못했거나 더 원하는 분들을 위한 Q&A 인공지능이 준비되어 있습니다.
- 팀원들과 조건에 맞는 공모전을 쉽게 찾을 수 있습니다.
- 앱 내에서 스터디룸 및 도산라운지 예약 바로가기가 가능합니다.
- 그 밖의 원활한 학교생활을 위해 주간 학사일정과 교내 식당 메뉴를 한눈에 보여드립니다.

<br>

## 2. 개발 환경

- **IDE** : Android Studio, Visual Studio Code
- **Framework** : Flutter
- **Front-End** : FlutterFlow로 UI 디자인, Dart code
- **Back-End** : Cloud Firestore, Firebase Storage DBMS, CloudType, Dart/Python code
- **ML** : SimCSE, RoBERTa, gptAPI
- **AI 환경** : CONDA, NVIDIA CUDA, cuDNN
- **Android SDK** : minSDK21, targetSDK34, compildSDK34, gradle 7.3.1
- **버전 및 이슈관리** : Github, Google Play Console
- **협업 툴** : Discord, Notion

  
<br>

## 3. 역할 분담

### 😎 양윤성

- **Project Master**
  
    - 프로젝트 기획 및 총괄
    - 공모전, 학사일정, 식당메뉴 크롤링 API서버 구축
    - 로그인, 회원가입, 공모전 찾기 기능 구현
    - AI 학습 데이터 전처리, 비지도 학습, 지도 학습
    - AI 서비스 알고리즘 개발 및 모델 최적화
      
- **개발 외**
  
    - 팀 Notion, DANMOA, DANMOA_crawlserver 레파지토리 관리
    - 테스트 관리 및 테스트 문서 작성

<br>
    
### 🍊 박수현

- **Front-End**
  
    - 초기 프로젝트 UI 디자인 설계
    - FlutterFlow 앱 전체 UI/UX 디자인
    - Flutter 화면 및 컴포넌트 개발
      
- **개발 외**
  
    - 비즈니스 로직, 컴포넌트 명세서 작성
    - 사전 설문조사, 베타테스트 설문조사 관리 및 분석

<br>

### 👻 최윤호

- **Back-End**
  
    - Firebase 데이터 모델링 설계 및 데이터베이스 관리
    - Firebase-Flutter 연동 백엔드 서비스 및 인프라 구축
    - 스터디 리스트, 스터디 만들기, 스터디 홈, 스터디 설정 구현
    - 유저관리(프로필, 회원탈퇴), QA(백엔드 로직, 알람기능) 구현
      
- **개발 외**
  
    - 요구사항/기능 명세서, 함수 기능 정의서 작성
    - 테스트 관리 및 테스트 문서 작성

<br>

### 🐬 엄현호

- **AI Develop**
  
    - AI 모델 아키텍쳐 설계
    - AI 학습 및 구동 환경 구축
    - AI 학습 데이터 전처리, 비지도 학습, 지도 학습
    - AI 서비스 알고리즘 개발 및 모델 최적화
      
- **개발 외**
  
    - DANMOA_AI 레파지토리, Hugging Face 관리
    - AI 아키텍쳐 문서 작성
    
<br>

## 4. 개발 기간 및 작업 관리

### 개발 기간

- 전체 개발 기간 : 2024.03.06 ~ 2024.05.22
- UI 디자인 : 2024.03.06 ~ 2024.03.26
- AI 학습/구현 : 2024.03.27 ~ 2024.05.29
- FE/BE 개발 : 2024.03.27 ~ 2024.05.29
- 알파테스트 기간 : 2024.05.30 ~ 2024.06.17
- 정식 배포/유지보수 : 2024.06.18 ~

<br>

### 작업 관리

- GitHub을 이용한 버전관리 → 기능에 따라 전체/AI/크롤링 3가지 레파지토리로 나눠 관리
- 배포/테스트 관리 및 유지 보수는 Google Play Console 이용
- 각자 작업 진행도와 결과를 Notion 작업록에 공유
- 주간회의를 진행하며 작업 순서와 방향성에 대한 고민을 나누고 Notion 회의록에 기록
- [단모아 Notion 링크](https://yyseong.notion.site/Project-Danmoa-eba1ab2ad8fe414abf0f8716bb997327?pvs=4)

<br>

## 5. 페이지별 기능

### [초기화면]
- 로그인이 되어 있지 않은 경우 : 로그인 페이지
  
    - 회원 정보가 없다면 단국대 Microsoft 계정으로 회원가입이 가능합니다.
    - 비밀번호 분실 시 찾기 버튼을 눌러 재설정 링크를 메일로 받을 수 있습니다.
      
- 로그인이 되어 있는 경우 : 단모아 홈 화면
  
    - 상단 메뉴바를 넘겨 주간학사일정, 학생식당 메뉴, 교직원식당 메뉴 확인이 가능합니다.
    - 가입된 스터디를 확인할 수 있고, 스터디를 만들 수 있습니다.
    - 스터디룸 예약이나 도산라운지 회의룸 예약을 바로가기 버튼을 눌러 할 수 있습니다.

| 로그인 화면 | 홈 화면 - 일정 | 홈 화면 - 메뉴 |
|----------|----------|----------|
|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_login.jpg?raw=true" alt="splash" width="250" height="500">|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_main1.jpg?raw=true" alt="splash" width="250" height="500">|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_main2.jpg?raw=true" alt="splash" width="250" height="500">|

<br>

### [회원가입]
- 이메일 주소와 비밀번호를 입력하면 입력창에서 바로 유효성 검사가 진행되고 통과하지 못한 경우 경고 창이 나타납니다.
- 이메일 주소의 형식이 유효하지 않거나 이미 가입된 경우, 비밀번호가 8자 미만일 경우에는 각 입력창 하단에 경구 문구가 나타납니다.
- 작성이 완료된 후 유효성 검사가 통과된 경우 두 화면에 걸쳐 프로필 설정이 가능합니다.
- 이름은 2-6글자, 닉네임은 2-10글자 제한이 있으며 닉네임은 중복체크를 해야합니다.
- 회원 가입 이후 인증 링크 메일이 전송되며 인증 후 서비스 이용이 가능합니다.

| 계정정보 입력 | 프로필 작성 | 학적 입력 |
|----------|----------|----------|
|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_sign1.jpg?raw=true" alt="splash" width="250" height="500">|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_sign2.jpg?raw=true" alt="splash" width="250" height="500">|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_sign3.jpg?raw=true" alt="splash" width="250" height="500">|

<br>

### [스터디 개설]
- 스터디 이름은 중복이 불가능하며 중복 시 경고창이 나타납니다.
- 스터디 이미지를 설정하지 않으면 기본 이미지가 적용됩니다.
- 카카오톡 오픈채팅방을 개설 후 채팅방 링크가 있어야만 스터디 개설이 가능합니다.
- 이후 스터디 학력 조건과 시간대, 분야를 선택 가능합니다.

| 스터디 기본정보 입력 | 스터디 추가정보 입력 |
|----------|----------|
|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_stdmake1.jpg?raw=true" alt="splash" width="250" height="500">|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_stdmake2.jpg?raw=true" alt="splash" width="250" height="500">|

<br>

### [스터디 피드]
- 현재 존재하는 모든 스터디가 만들어진 순서대로 표시됩니다.
- 필터를 적용해서 원하는 옵션을 선택하거나, 검색으로 특정 스터디를 찾을 수 있습니다.
- 스터디 이름, 분야, 팀원 수를 확인 가능하며 클릭 시 해당 스터디 홈화면으로 이동합니다.

| 스터디 피드 |
|----------|
|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_study1.jpg?raw=true" alt="splash" width="250" height="500">|

<br>

### [스터디 홈]
- 스터디 세부 정보와 멤버를 확인할 수 있습니다.
- 카카오 오픈채팅방으로 쉽게 모일 수 있으며, 채팅방 입장 버튼은 스터디 멤버에게만 노출됩니다.
- 팀장은 오른쪽 상단 설정 버튼으로 팀원 관리와 스터디 정보 변경이 가능합니다.

| 스터디 홈 |
|----------|
|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_study2.jpg?raw=true" alt="splash" width="250" height="500">|

<br>

### [QA 시스템]
- 100자 내로 Q&A 인공지능에게 공부에 대한 주제로 질문할 수 있습니다.
- 현재는 IT/SW 관련 질문만 가능합니다.
- 질문 후 답변은 1분정도 시간이 소요되며, 답변이 도착하면 알림으로 확인 가능합니다.
- 지금까지 질문한 목록도 확인 가능합니다.

| 질문하기 | 답변내역 |
|----------|----------|
|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_qa1.jpg?raw=true" alt="splash" width="250" height="500">|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_qa2.jpg?raw=true" alt="splash" width="250" height="500">|

<br>

### [공모전 찾기]
- 분야, 대상, 접수상태, 지역을 필터링하여 공모전 검색이 가능합니다.
- 공모전은 [콘테스트 코리아](https://www.contestkorea.com/) 기준으로 표시됩니다.
- 공모전 제목, 대상, 주최사, 접수 기간, 심사 기간이 표시되며 클릭 시 해당 공모전 사이트로 접속됩니다.

| 공모전 찾기 | 공모전 목록 |
|----------|----------|
|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_contest1.jpg?raw=true" alt="splash" width="250" height="500">|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_contest2.jpg?raw=true" alt="splash" width="250" height="500">|

<br>

### [프로필]
- 유저의 닉네임, 소속, 학력, 프로필 사진, 가입한 스터디가 표시되며 다른 유저의 프로필도 동일하게 표시됩니다.
- 오른쪽 상단 설정 버튼으로 프로필 수정과 비밀번호 변경, 로그아웃, 회원탈퇴가 가능합니다.

| 프로필 |
|----------|
|<img src="https://github.com/Team-CUPS/DANMOA_materials/blob/main/images/img_prf.jpg?raw=true" alt="splash" width="250" height="500">|

<br>

## 6. 개선 목표

- 일부 화면 UI 개선 및 최적화
- Back-End API 모듈화
- 서버 컴퓨터 가용 시 분산처리로 QA 시스템 속도 향상
- QA 시스템 지원 분야 추가
- 스터디 홈 내 게시판 기능 추가
- 단국대학교 천안캠퍼스 지원
- iOS 지원

    
<br>

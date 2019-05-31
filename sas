<steps and sentences>

- Data step
- proc step 

<libraries>
libname project 'C:\workshop\winsas\lwcrb';

libname libref clear; >> sas library 제거
libname libref "다른경로" >> library 경로 변경 

1.Permanent SAS 라이브러리
> 외부에 저장되어 SAS 종료 후에도 저장되어 있는 Library
sashelp, sasuser 등이 있다. 

# Permanent SAS libraries 부르는 방법 
(Two-level SAS data setnames를 이용)
libref.data-set

2.Temporary SAS libraries
일시적으로 존재, SAS 종료 후 삭제되는 자료들의 모음
SAS에서 미리 만들어두는 'Work library'밖에 없다 

# Temporary SAS libraries 부르는 방법
(One-level SAS data setNames를 이용)
앞에 것 생략 data-set으로만 데이터 불러옴

<Variables>
SAS에서 데이터의 열을 Variables 이라 부른다
2가지 종류:Character Variables / Numeric Variables 

<데이터 불러오기, Data statement>
data work.newprice;
     set golf.supplies; 
     saleprice = price * 0.75
run;

<DATA Step Execution>?
input data set > PDV(Program Data Vector) 
> Output Data Set


<DATA Step 내에서 사용되는 여러 Statement들>

===================================================

data xxx; 테이블 생성 
set xxx; 테이블 불러오기
/* 주석 */

라이브러리 명령어 > 라이브러리명.테이블명 예)SASHelp.cla

※ 라이브러리 지정 않아면 work library에 테이블로 저장됨

※ PROC 사용법
>> 간단한 PROC 명령어 
>> PROC sort PROC print PROC contents PROC FREQ

- PROC SORT(순서대로 정렬하기)
PROC SORT: SORT 프로시저를 시행합니다.
DATA=XXX: XXX라는 데이터를 불러옵니다.
OUT=YYY: 결과값을 YYY라는 테이블로 만듭니다.  
BY ZZZ: 변수ZZZ를 정렬합니다.
DESCENDING: 내림차순으로 정렬합니다.

예)
PROC SORT DATA=SASHELP.CLASS OUT=TEST;
BY AGE;
RUN;

- PROC PRINT(테이블 보여주기)
PROC PRINT: PRINT 프로시저를 시행합니다.
DATA=XXX: XXX라는 데이터를 불러옵니다.
VAR XXX: 지정된 변수 XXX를 불러옵니다.
ID XXX: 지정된 변수를 기준값으로 활용합니다. 기준값이란, 해당 행의 대푯값으로 활용하겠다는 의미입니다.
BY XXX: 지정된 변수를 그룹으로 만듭니다.

- PROC CONTENTS(테이블 보여주기)
- PROC FREQ(빈도 조회) ~ 백분율
PROC FREQ: FREQ 프로시저를 시행합니다.
DATA=XXX: XXX라는 데이터를 불러옵니다.
TABLE YYY ZZZ: 변수YYY와 ZZZ를 조회합니다.

※ 데이터 생성법

DATA TEST;/*데이터 TEST를 생성함(DATA)*/
INPUT NAME $ AGE SEX $;/*문자 변수 NAME과 SEX, 숫자 변수 AGE를 생성함(INPUT)*/
CARDS;/*변수별 데이터를 입력함(CARDS)*/
OK 1 남
YOU 2 녀;/*변수별로 들어갈 데이터 입력*/
RUN;/*SAS명령어 종료*/

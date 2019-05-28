#### R 환경설정 연습하기 ####

# Getting help 
?mean

# Object 
str(iris)      
class(iris) 

# Directory 
getwd()     # Find the current working diretory
.libPaths() # 파일 경로 

# 패키지 설치 & 확인 & 실행
install.packages("ggplot2")
installed.packages("zoo")
library("ggplot2")

# 패키지 설치 유무 확인코드
any(grepl("forecast", installed.packages()))

#### 기본 자료형 6가지 ####
a = "hello"
print(class(a)) #문자형
b = 2.5
print(class(b)) #실수(numeric)
c = 6L
print(class(c)) #정수형(integer)
d = 1 + 2i
print(class(d)) #복소수형(Complex) 
a = TRUE
print(class(a)) # 논리형(logical)

# 1.벡터형
a = "Quantative"
b = "finance"
c(a,b)

x0 = c(1,2,3)
x = c(seq(1,10))

# Creating vectors
c(2,4,6)
2:6
seq(2,3, by = 0.5)
rep(1:2, times=3)
rep(1:2, each = 3)

# Vector Fucntions
sort(x)
rev(x)
table(x)
unique(x)

x[4]
x[-4] # 4번째를 제외한 모든 것 
x[2:4]
x[-(2:4)]
x[c(1,5)]
x[x == 10]
x[x < 0]
x[x %in% c(1,2,5)]

# 2.리스트 
list1 = list(c(4,5,6),"Hello",24.5)
list1
print(list1[2])

list2 = list(5,6,7)
list3 = list("a",'b','c')
combined_list = c(list2,list3) ## c >> Combine values into a Vector or list
print(combined_list)

L = list(x=1:5, y=c("a","b"))
L

# 3.행렬(Matrix)
m = matrix(1:9,nrow=3,ncol = 3)

m[2,]
m[,2]
m[2,2]

# 4.배열(array)
arr = array(c(1,3,5),dim=c(3,2,2))
arr

# 5.요인(factor)
fac = factor(c(2,3,4,5,3,2))
fac  
nlevels(fac) # 항목의 개수

# 6. 데이터 프레임
df = data.frame(Name=c("Alex",'John','Bob'),
                Age=c(18,20,23))
df
df$Name
df[[1]]

df[,2]
df[2,]
df[2,2]

nrow(df)
ncol(df)
dim(df)

# 기타 
# 문자열(Strings)
x ="Rstudio is"
y = "the efficient statistical tool"
paste(x, y, sep = " ")
paste0(x,y)
nchar(x) # 글자수 세기 

# 자료형(Types)
c = c(1,2,3)
is.numeric(c) # 자료형 식별
as.character(c) # 자료형 변환

# Na, null 값 
is.na(df)
is.null(df)


#### 다른 데이터형 가져오기/내보내기 #### 

# 1. text 파일 
df_txt = read.table("file.txt") # input
write.table(df_txt,"file.txt")  # Output 

# 2. csv 파일 
df_csv = read.csv("file.csv") # input 
write.csv(df_csv,"file.csv")  # output

#3. xlsx 파일 
library("xlsx")
datum = read.xlsx2("fss.xlsx",sheetIndex = 2,stringsAsFactors=FALSE) # input 
write.xlsx(datum, file ='fss.xlsx',sheetName = "decom222",append = TRUE) # output


#### 주요 함수 #### 
xs = 2:8

log(xs)
exp(xs)
max(xs)
min(xs)

mean(40:50)
sum(10:20)
quantile(xs) # 4분위수
rank(xs)
var(xs)
sd(xs)



## 함수 ## 
finding_SqrFunc = function(value){
  for(j in 1:value){
    sqr = j^2
    }
  return(sqr)
}

finding_SqrFunc(4)

# 인수가 없는 함수 
function_test = function(){
  for(i in 1:3){
    print(i*3)
  }
}
function_test()

# 인수가 있는 함수 호출 
function_test1 = function(a,b,c){
  result = a + b + c
  print(result)
}
function_test1(13,5,6)

# if 문 
x = -6
if(x < 0){
  print("sefi")
}

if(x>0){
  print("참 이에요")
} else{
  print("거짓 이에요")
}

# for문 
var = c(3,5,6,7,8,9)
counter = 0 
for(val in var){
  if(val %% 2 != 0) counter = counter + 1
}
counter

# while문 
var = "Hello"
counter = 4 
while(counter < 7){
  print(var)
  counter = counter + 1 
}

# apply() ~ apply function ~ array margins
sample = matrix(c(1:10), nrow=5, ncol=2)
sample
apply(sample, MARGIN= 1,sum) # margin = 1 >> row
apply(sample, MARGIN= 2,sum)  # margin = 2 >> col 

# sapply() ~ Apply a Function over a List or Vector
sapply(1:5, function(x) x^3)

# 반복제어문 
## break 
vec = c("hello")
cnt = 1
repeat{
  print(vec)
  cnt = cnt + 1 
  if(cnt > 3){
    break
  }
}
## next ~ 건너뛰기 
vec = c(2,3,4,5,6)
for(i in vec){
  if(i==4){
    next
  }
  print(i)
}

#### 통계 ####
sm_data =read.csv("R 기초_연습.csv")
head(sm_data)
str(sm_data)
View(sm_data)

# dnorm: The Normal Distribution(정규분포) 
y = dnorm(sm_data$Return, 
          mean=mean(sm_data$Return),
          sd = sd(sm_data$Return, na.rm = FALSE))

plot(sm_data$Return,y)
hist(sm_data$Return) # 히스토그램

# 상관관계
z = sm_data[c("High","Return","Volume")]
z
cov(z) # 공분산
cor(z) # 상관계수 

# 단순회귀분석 
library("ggplot2")

Yprice = sm_data$Volume
Xprice = sm_data$Close

LinearR.lm = lm(Yprice ~ Xprice, data = sm_data)
summary(LinearR.lm)

# 결정계수
summary(LinearR.lm)$r.squared
LinearR.lm$coefficients

# 회귀식: Yprice = 7348874.64 + -15268.81 * (Xprice)

# 시각화 
par(mfcol=c(1,1)) # 화면 분할
plot(Yprice ~ Xprice,xlab="Xprice",ylab="Yprice")
abline(LinearR.lm,col="red")

# Visualization with ggplot2 
ggplot(data = sm_data, aes(Xprice,Yprice)) + geom_point() + geom_smooth(method = "lm")
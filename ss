library(flexclust)

data(nutrient,package="flexclust")
head(nutrient,4)

# 유클리드 거리계산
d = dist(nutrient)
as.matrix(d)[1:4,1:4]

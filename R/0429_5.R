######    32,33,43  #####
ls()

install.packages("corrplot")
install.packages("ggpolt2")
install.packages("dplyr")
install.packages("Hmisc")
library(Hmisc)
library(corrplot)
library(dplyr)
library(ggplot2)
install.packages("gridExtra")
library(gridExtra)

tic2000<-read.csv("C:/data_mining/tic2000.csv", head=TRUE)

table(tic2000[32])
table(tic2000[33])



new6543<-data.frame( tic2000[,65:85] , tic2000[86]) 

new6543_cor<-cor(new6543)

new2543<-data.frame( tic2000[,25:43] , tic2000[86])     
boxplot(new2543)


new2543.cor<-cor(new2543)
tic2000_cor<-cor(tic2000)
tic2000_corr<-corrplot(tic2000_cor, method="number")  
corrplot(new6543_cor, method="number")  


new0243<-data.frame( tic2000[,2:43] , tic2000[86]) 
new0243.cor<-cor(new2543)
new0243.cor.1<-corrplot(new0143.cor, method="number")  
corrplot(new0243.cor.1,
         method = "color",       
                 type = "lower",         # 왼쪽 아래 행렬만 표시
         order = "hclust",       # 유사한 상관계수끼리 군집화
         addCoef.col = "black",  # 상관계수 색깔
         tl.col = "black",       # 변수명 색깔
         tl.srt = 45,            # 변수명 45도 기울임
         diag = F)               # 대각 행렬 제외

new2543.prcor<-rcorr(as.matrix(tic2000), type="pearson")   #H0: ρ=0 27 






prcor<-rcorr(as.matrix(tic2000), type="pearson")   #H0: ρ=0 27 
# MSKB2 소셜 클래스 B2 , 33 MAUT2   2차 2cars
# 38 MINK3045 소득 30-45.000, 41 MINK123M 수입 >123.000

?grid.arrange
install.packages("gridExtra")
library(  gridExtra ) 
new.caravan1<-new2543 %>% filter(CARAVAN==1) 


boxplot(new.caravan1)
par(mfrow=c(2,2))
str( new.caravan1 )  

q= ggplot(  new.caravan1, aes( x=new.caravan1[,1] ) ) + geom_bar()
w= ggplot(  new.caravan1, aes( x=new.caravan1[,2]  ) ) + geom_bar()
e= ggplot(  new.caravan1, aes( x=new.caravan1[,3]  ) ) + geom_bar()
r= ggplot(  new.caravan1, aes( x=new.caravan1[,4]  ) ) + geom_bar()
t= ggplot(  new.caravan1, aes( x=new.caravan1[,5]  ) ) + geom_bar()
y= ggplot(  new.caravan1, aes( x=new.caravan1[,6]  ) ) + geom_bar()
u= ggplot(  new.caravan1, aes( x=new.caravan1[,7]  ) ) + geom_bar()
i= ggplot(  new.caravan1, aes( x=new.caravan1[,8]  ) ) + geom_bar()
o= ggplot(  new.caravan1, aes( x=new.caravan1[,9]  ) ) + geom_bar()
p= ggplot(  new.caravan1, aes( x=new.caravan1[,10]  ) ) + geom_bar()
a= ggplot(  new.caravan1, aes( x=new.caravan1[,11]  ) ) + geom_bar()
s= ggplot(  new.caravan1, aes( x=new.caravan1[,12]  ) ) + geom_bar()
d= ggplot(  new.caravan1, aes( x=new.caravan1[,13]  ) ) + geom_bar()
f= ggplot(  new.caravan1, aes( x=new.caravan1[,14]  ) ) + geom_bar()
g= ggplot(  new.caravan1, aes( x=new.caravan1[,15]  ) ) + geom_bar()
h= ggplot(  new.caravan1, aes( x=new.caravan1[,16]  ) ) + geom_bar()
j= ggplot(  new.caravan1, aes( x=new.caravan1[,17]  ) ) + geom_bar()
k= ggplot(  new.caravan1, aes( x=new.caravan1[,18]  ) ) + geom_bar()
l= ggplot(  new.caravan1, aes( x=new.caravan1[,19]  ) ) + geom_bar()

grid.arrange(q,w,e,r,t,y,u,i,i,o,p,a,s,d,f,g,h,j,k,l,  nrow=4, ncol=5)

?grid.arrange
library(gridExtra)

boxplot(new.caravan1)


####
fit<-princomp(new2543, cor=T)
summary(fit)
summary(fit)
loadings(fit)
plot(fit, type="lines")
biplot(fit)

summary(new2543)

boxplot( new.caravan1 ) 



q= ggplot(  new.caravan1, aes( x=new.caravan1[,1] ,y=..prop..,group=1 ) ) + geom_bar()
w= ggplot(  new.caravan1, aes( x=new.caravan1[,2] ,y=..prop..,group=1 ) ) + geom_bar()
e= ggplot(  new.caravan1, aes( x=new.caravan1[,3] ,y=..prop..,group=1 ) ) + geom_bar()
r= ggplot(  new.caravan1, aes( x=new.caravan1[,4] ,y=..prop..,group=1 ) ) + geom_bar()
t= ggplot(  new.caravan1, aes( x=new.caravan1[,5] ,y=..prop..,group=1 ) ) + geom_bar()
y= ggplot(  new.caravan1, aes( x=new.caravan1[,6] ,y=..prop..,group=1 ) ) + geom_bar()
u= ggplot(  new.caravan1, aes( x=new.caravan1[,7] ,y=..prop..,group=1 ) ) + geom_bar()
i= ggplot(  new.caravan1, aes( x=new.caravan1[,8],y=..prop..,group=1  ) ) + geom_bar()
o= ggplot(  new.caravan1, aes( x=new.caravan1[,9],y=..prop..,group=1  ) ) + geom_bar()
p= ggplot(  new.caravan1, aes( x=new.caravan1[,10],y=..prop..,group=1  ) ) + geom_bar()
a= ggplot(  new.caravan1, aes( x=new.caravan1[,11] ,y=..prop..,group=1 ) ) + geom_bar()
s= ggplot(  new.caravan1, aes( x=new.caravan1[,12] ,y=..prop..,group=1 ) ) + geom_bar()
d= ggplot(  new.caravan1, aes( x=new.caravan1[,13] ,y=..prop..,group=1 ) ) + geom_bar()
f= ggplot(  new.caravan1, aes( x=new.caravan1[,14] ,y=..prop..,group=1 ) ) + geom_bar()
g= ggplot(  new.caravan1, aes( x=new.caravan1[,15] ,y=..prop..,group=1 ) ) + geom_bar()
h= ggplot(  new.caravan1, aes( x=new.caravan1[,16],y=..prop..,group=1  ) ) + geom_bar()
j= ggplot(  new.caravan1, aes( x=new.caravan1[,17] ,y=..prop..,group=1 ) ) + geom_bar()
k= ggplot(  new.caravan1, aes( x=new.caravan1[,18] ,y=..prop..,group=1 ) ) + geom_bar()
l= ggplot(  new.caravan1, aes( x=new.caravan1[,19] ,y=..prop..,group=1 ) ) + geom_bar()

grid.arrange(q,w,e,r,t,y,u,i,i,o,p,a,s,d,f,g,h,j,k,l,  nrow=4, ncol=5)


?grid.arrange


tic2000<- subset(tic2000, tic2000[86]==1)



for j in 2:4 {
boxplot(races.table[,j]  , main=)
hist(races.table[,j]


par(mfrow=c(1,2))
cr
races.lm2<-lm(Tome~Distance , )
쿡 디스턴스 18 큰값이여서/ 
summary(races.table)
summary(rsseee.lm2 ) 
4.04
6.143
#mse 줄어듦 24->6으로 줄어듦 확인 가능




tic2000  

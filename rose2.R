setwd("C:/data_mining/TIC_The Insurance Company")
ticeval2000<-read.table("ticeval2000.txt", sep="	")
tictgts2000<-read.table("tictgts2000.txt", sep="	")
ticdata2000<-read.table("ticdata2000.txt", sep="	")

summary(ticeval2000)
head(ticeval2000,25)
boxplot(ticeval2000)

summary(tictgts2000)
boxplot(tictgts2000)
plot(tictgts2000)
mode(tictgts2000)

tictest2000<-cbind(ticeval2000, tictgts2000)

str(ticeval2000)
str(tictgts2000)
str(tictest2000)
str(ticdata2000)
nrow(ticdata2000); nrow(tictest2000)
ncol(ticdata2000); ncol(tictest2000)

par(mfrow=c(2,1))
boxplot(ticdata2000)
boxplot(tictest2000)
summary(ticdata2000)
colnames(tictest2000[86])<-"V86"
tic2000<-rbind(ticdata2000, tictest2000)
tic2000<-data.frame(ticdata2000, tictest2000)
?rbind
sum(is.na(ticdata2000))
sum(is.na(tictest2000))
names(ticdata2000);  names(tictest2000) 

test<-bind_rows(ticdata2000, tictest2000)
str(test)

#################################################
rm(list=ls())
ls()
ticeval2000<-read.table("ticeval2000.txt", sep="	")
tictgts2000<-read.table("tictgts2000.txt", sep="	")
ticdata2000<-read.table("ticdata2000.txt", sep="	")
names<-read.table("names.csv", sep=",") #변수명 데이터셋

names(ticdata2000);  names(tictest2000) 
names(tictgts2000)<-"V86"

tictest2000<-cbind(ticeval2000, tictgts2000)
tic2000<-rbind(ticdata2000, tictest2000) #final

summary(tic2000)



for ( i in 1:ncol(tic2000) ) {
	names(tic2000)[i]<-names[i,]
	}

print(names(tic2000))
str(tic2000)

#4월14일 1)데이터 합침 2)변수명지정
############################################################



summary(tic2000)
str(tic2000)
boxplot(tic2000[86])



============================================================
install.packages("dplyr"); library(dplyr)
install.packages("ggplot2"); library(ggplot2)
table(tic2000[86])[2]

setwd("C:/data_mining")
write.csv(tic2000, "tic2000.csv", row.names=F )

tic2000.car0<-tic2000   %>% filter(CARAVAN==0)  
table(tic2000.car0[86])


sample(tic2000.car0, table(tic2000[86])[2], replace=TRUE, prob=15.7986)




tic2000.car1<- tic2000   %>% filter(CARAVAN==1)   
df.smple.under<-sample_n(tic2000.car0, 586)

tic.sam <-rbind(df.smple,tic2000.car1)

#######
prop.table(table(tic2000[86]))

str(tic2000 )


data_balanced_both <- ovun.sample(CARAVAN  ~ ., data = tic2000 , method = "both", p=0.5, N=1000, seed = 1)$tic2000

prop.table(table(tic2000[86]))


$ CARAVAN


table(data_balanced_both$cls)

data.rose <- ROSE(cls ~ ., data = hacide.train, seed = 1)$data
table(data.rose$cls)









str(tic.sam )

str(tic.sam)

summary(df.smple)


str(df.smple)


idx <- sample(0, nrow(tic2000.car0[86]), replace = T, prob = 0.5)




idx <- sample(0, nrow(tic2000[86][2]), replace = T, prob = c(0.5,0.5))


head(idx)
table(idx)



?sample

boxplot(tic2000[1])$stats
summary(tic2000[1])
summary(tic2000[2])
summary(tic2000[3])
summary(tic2000[44])
summary(tic2000[9])
boxplot(tic2000[9])$stats
boxplot(tic2000[8])$stats
summary(tic2000[8])
table(tic2000[8])
table(tic2000[6])

qplot(tic2000[8])

table(tic2000[33])
names(tic2000[32])



summary(tic2000[1:43])
summary(tic2000[31])
table(tic2000[86])
table( tic2000[44] )
boxplot( tic2000[44])$stats
boxplot( tic2000[47] ) $stats

table(tic2000[,6:9])
table(tic2000[10])


=========================
by_cyl <- mtcars %>% group_by(cyl)

# sample_n() -> slice_sample() ----------------------------------------------
sample_n(mtcars, 10)
sample_n(mtcars, 50, replace = TRUE)
sample_n(mtcars, 10, weight = mpg)



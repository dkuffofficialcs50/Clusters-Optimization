#Prepare libraries
library(cluster)

#Read in prepared wine.20068785
load("~/Downloads/wine.dt.RData")
summary(wine.dt$fixed.acidity)
summary(wine.dt$volatile.acidity)
summary(wine.dt$citric.acid)
summary(wine.dt$residual.sugar)
summary(wine.dt$chlorides)
summary(wine.dt$free.sulphur.dioxide)
summary(wine.dt$total.sulphur.dioxide)
summary(wine.dt$density)
summary(wine.dt5$pH)
summary(wine.dt$sulphates)
summary(wine.dt$alcohol)

#Create dataframe with only complete cases
df<-wine.20068785[complete.cases(wine.dt),]

#create distance matrix
df.dist<-daisy(df,metric="gower")

#do pam analysis for 2 clusters
pam2.out<-pam(df.dist,2)
pam2.out$clusinfo

#do pam analysis for 3 clusters
pam3.out<-pam(df.dist,3)
pam3.out$clusinfo

#do pam analysis for 4 clusters
pam4.out<-pam(df.dist,4)
pam4.out$clusinfo

#do pam analysis for 5 clusters
pam5.out<-pam(df.dist,5)
pam5.out$clusinfo

#do pam analysis for 6 clusters
pam6.out<-pam(df.dist,6)
pam6.out$clusinfo

#do pam analysis for 7 clusters
pam7.out<-pam(df.dist,7)
pam7.out$clusinfo

#do pam analysis for 8 clusters

pam8.out<-pam(df.dist,8)
pam8.out$clusinfo


#Summary stats for 7 cluster solution
aggregate(df[,-8],by=list(cluster=pam7.out$clustering),mean)
aggregate(df[,8],by=list(cluster=pam7.out$clustering),table)
table(df$density,pam7.out$clustering)

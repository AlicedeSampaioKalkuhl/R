#mice: A Tutorial for multiple imputation
library(tidyverse)
library(mice)
varlm<-lm(log(var_estimate)~log(var_of_interest),data=df)
minimial_df<-cbind(c(log(df$var_of_interest)),c(log(df$var_estimate)))
colnames(minimial_df)<-c("var_of_interest","var_estimate")
tempData<-mice(minimial_df,m=50,maxit=50,meth='norm',seed=500) #mice with a method
micefit<-with(tempData,lm(var_estimate~var_of_interest))
pooled<-pool(micefit)
MICE_minimial_df<-df%>%filter(!is.na(var_of_interest) | !is.na(var_estimate))%>%# only include data for which var_of_interest OR var_estimate are known
mutate(missingvar_of_interest=if_else(is.na(var_of_interest),summary(varlm)$coefficients[2,1]*var_estimate+summary(varlm)$coefficients[1,1],var_of_interest),missingvar_of_interest_pooled=if_else(is.na(var_of_interest),summary(pooled)[2,]$estimate*var_estimate+summary(pooled)[1,]$estimate,var_of_interest)) # estimate for pooled mice fit. This one is used henceforth.
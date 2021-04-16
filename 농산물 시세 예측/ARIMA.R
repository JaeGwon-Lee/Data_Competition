data11=read.csv(file="양파 서부.csv",header=T)

#거래년월
data11=cbind(data11,year=substr(data11$거래년월일,1,4),month=substr(data11$거래년월일,1,6))

#1kg당 평균가격
data11=cbind(data11,mprice=data11$평균가격/data11$단량)

#1kg당 가격의 총거래액
data11=cbind(data11,total=data11$거래량*data11$평균가격/data11$단량)

#단위별 가격 확인
tapply(data11$mprice,data11$단위,mean)

#0.5% 삭제
quantile(data11$mprice,probs=c(0.005,0.995))
data11=data11[!(data11$mprice<75|data11$mprice>1821.438),]

#거래년월 별 계산
total_m=tapply(data11$total,data11$month,sum)
volume_m=tapply(data11$거래량,data11$month,sum)
average_m=round(total_m/volume_m)

# 0 -----------------------------------------------------------------------

data0=as.numeric(average_m)
data=data0[1:84]
data1=data0[85:120]

data0=ts(data0,frequency=12,start=2010)
data=ts(data,frequency=12,start=2010)
data1=ts(data1,frequency=12,start=2017)

plot(data0)

# 1 -----------------------------------------------------------------------

plot(data)
plot(stl(data,s.window="periodic"))

# 2 -----------------------------------------------------------------------

library(tseries)

adf.test(data,k=0)
#p-value가 0.4258으로 0.05보다 크므로 귀무가설 채택(평균이 비정상적인 것으로 판단)

plot(log(data))
plot(diff(log(data)))
plot(diff(log(log(data))))
plot(diff(diff(log(log(data)))))

adf.test(log(data),alternative="stationary",k=0)  #실패
adf.test(diff(log(data)),alternative="stationary",k=0)
adf.test(diff(log(log(data))),alternative="stationary",k=0)
adf.test(diff(diff(log(log(data)))),alternative="stationary",k=0)
#차분과 로그함수를 적용하니 p-value=0.01보다 작음

adf.test(diff(diff(log(data)),12),k=0)

# 3 -----------------------------------------------------------------------

library(forecast)

auto.arima(diff(diff(log(data)),12),d=1,D=1)

tsdiag(auto.arima(diff(diff(log(data)),12),d=1,D=1))




# 4 -----------------------------------------------------------------------

fit=arima(log(data),c(0,0,1),seasonal=list(order=c(1,1,0),period=12))#

fit=arima(log(data),c(0,0,1),seasonal=list(order=c(2,1,0),period=12))#

fit=arima(log(data),c(0,0,1),seasonal=list(order=c(2,2,0),period=12))#



fit=arima(log(data),c(0,1,0),seasonal=list(order=c(1,1,0),period=12))
fit=arima(log(data),c(1,1,0),seasonal=list(order=c(1,1,0),period=12))
fit=arima(log(data),c(0,1,1),seasonal=list(order=c(1,1,0),period=12))

# 5 -----------------------------------------------------------------------

pred=predict(fit,n.ahead=4*12,se.fit=T)
ts.plot(data,2.718^pred$pred,log="y",lty=1,col=c("black","red"))
lines(exp(pred$pred-pred$se),lty="dotted",col="orange")
lines(exp(pred$pred+pred$se),lty="dotted",col="orange")
lines(data1,col='blue')

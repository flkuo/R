library(foreign)
attach(data)

##Scaled plot
par(mfrow=c(2,5),mar=c(2,2,2,2))
plot(jitter(Ob_Trans_F,factor=0.2),jitter(SR_Trans_F,factor=0.2),main="Tranferring",xlab="Observation",ylab="Self Report",col="blue",cex.main=1,xlim=c(0,8),ylim=c(0,8))
plot(jitter(Ob_Bath_F,factor=0.2),jitter(SR_Bath_F,factor=0.2),main="Using bathroom",xlab="Observation",ylab="Self Report",col="blue",cex.main=1,xlim=c(0,8),ylim=c(0,8))
plot(jitter(Ob_Room_F,factor=0.2),jitter(SR_Room_F,factor=0.2),main="Walking in the room",xlab="Observation",ylab="Self Report",col="blue",cex.main=1,xlim=c(0,8),ylim=c(0,8))
plot(jitter(Ob_Hall_F,factor=0.2),jitter(SR_Hall_F,factor=0.2),main="Walking in the hallway",xlab="Observation",ylab="Self Report",col="blue",cex.main=1,xlim=c(0,8),ylim=c(0,8))
plot(jitter(Ob_Tot_F,factor=0.2),jitter(SR_Total_F,factor=0.2),main="Total",col="blue",,xlim=c(0,15),ylim=c(0,15),cex.main=1,xlab="Observation",ylab="Self Report")


plot(jitter(Ob_Trans_D,factor=0.2),jitter(SR_Trans_D,factor=0.2),main="Tranferring",xlab="Observation",ylab="Self Report",col="blue",cex.main=1,xlim=c(0,1000),ylim=c(0,1000))
plot(jitter(Ob_Bath_D,factor=0.2),jitter(SR_Bath_D,factor=0.2),main="Using bathroom",xlab="Observation",ylab="Self Report",col="blue",cex.main=1,xlim=c(0,1000),ylim=c(0,1000))
plot(jitter(Ob_Room_D,factor=0.2),jitter(SR_Room_D,factor=0.2),main="Walking in the room",xlab="Observation",ylab="Self Report",col="blue",cex.main=1,xlim=c(0,400),ylim=c(0,400))
plot(jitter(Ob_Hall_D,factor=0.2),jitter(SR_Hall_D,factor=0.2),main="Walking in the hallway",xlab="Observation",ylab="Self Report",col="blue",cex.main=1,xlim=c(0,1400),ylim=c(0,1200))
plot(jitter(Ob_Tot_D,factor=0.2),jitter(SR_Total_D,factor=0.2),main="Total",col="blue",cex.main=1,xlab="Observation",ylab="Self Report")

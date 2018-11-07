
explotracker <- function(quaxmin=NULL, quaxmax=NULL, quaymin=NULL, quaymax=NULL,quanumber=NULL,minvalue=0,maxvalue=600, Scale=100,showtime=T,showscalevalue = T,graphic=F, color=c("yellow","red","blue"),writetable = F,readtable=F,table="time.txt", rawdata= NULL) {
  
  # determining the number of quadrants
  quax<-seq(quaxmin, quaxmax, quanumber)
  quay<-seq(quaymin, quaymax, quanumber)
  dados<-rawdata
  temp<-rep(0,0, (length(dados$T)))
  
  for (i in 1: (length(dados$T)-1) ) {
    temp[i+1]<-(dados$T[i+1]-dados$T[i])
  }
  
  dados$T<-temp
  
  ajuste_cor<-seq(0,(((length(quay)-1)*(length(quax)-1))-(length(quay)-1)),(length(quay)-1))
  
  values<-rep(0,0,(length(quay)-1)*(length(quax)-1))
  
  for(n in 1:(length(quax)-1) ){
    for(i in 1:(length(quay)-1)){
      qua11<-dados[c(dados$Y>quay[i] & dados$Y<=quay[i+1] & dados$X>quax[n] & dados$X<=quax[n+1]) ,]
      
      values[i+ajuste_cor[n]]<-(sum(qua11$T))
    }
  }
 
   
  quacor<-seq(1,(length(quay)-1)*(length(quax)-1),1)
  
  #If you already have the previously processed table it can be loaded using readtable == F
  if (readtable == F){
    corqua <- data.frame(tempo=values, quadrante=quacor,cor =quacor)
  }else{
    corqua<-read.table(file = table, h=T )
  }
  
  # to save table afther porcessing 
  if (writetable == T){
  write.table(corqua[,1],file = "time.txt",quote = F,append = T,col.names = "quadrante time")
  }else{
  }
    
    
  if (showtime == T){
  print(corqua)
  }else{
  }
    
  if (showscalevalue == T){
  print("------------------------------------------------------------------------------")  
  print(c("Minimum time in the quadrants =", min(corqua$tempo)))
  print(c("Maximum time in the quadrants =", max(corqua$tempo)))
  print("------------------------------------------------------------------------------") 
 
  }else{
  }
  
  # plot
  if (graphic == T){
  
  # Based on the maximum and minimum values of time the quadrants will be classified
  (corsequencia<-seq(minvalue, maxvalue, Scale)) 
  
  corDegrade <- colorRampPalette(color) # escolha as cores
  (colorir<-corDegrade(length(corsequencia)-1))
  
  for(i in 1:length(corsequencia)-1 ){
    corqua[c(corqua$tempo>corsequencia[i] & corqua$tempo<=corsequencia[i+1]),3]=colorir[i]
  }
  
  corqua[corqua$tempo==0,3] ="white"
  
  
  par(mar=c(2,2,3,2), mfrow=c(1,2),xpd=T)
  
  plot(dados$Y~dados$X,axes=F,type="n", ylab ="",xlab="")
  
  ajuste_cor<-seq(0,(((length(quay)-1)*(length(quax)-1))-(length(quay)-1)),(length(quay)-1))
  
  
  for(n in 1:(length(quax)-1) ){
    for(i in 1:(length(quay)-1)){
      rect(ybottom = quay[i],ytop = quay[i+1],xleft = quax[n],xright = quax[n+1],col = corqua$cor[i+ajuste_cor[n]])
    }
  }
  
  #plot scale
  
  par(mar=c(3,0,3,9))
  
  eixo_x_scala<-rep("1",(length(corsequencia))+1)
  
  plot((seq(min(quax), max(quax), ((max(quax)-min(quax))/length(corsequencia)) ))~ eixo_x_scala,type="n", axes=F, ylab ="",xlab="")
  
  quay_scala<-seq(min(quax), max(quax), ((max(quax)-min(quax))/length(corsequencia)))
  
  
  axis(1, at = 1,labels = "",tick = F)
  axis(4, las=1,pos = 1.1, at= quay_scala,labels =c("", corsequencia))
  mtext("Time (s)", side=3,at = 1.15)
  
  cor_scala<-c("white",colorir)
  
  for(i in 1:(length(quay_scala)-1)){
    rect(ybottom = quay_scala[i],ytop = quay_scala[i+1],xleft = 0.95,xright = 1.05, col= cor_scala[i])
  }
  
  }else{
 
 }
}


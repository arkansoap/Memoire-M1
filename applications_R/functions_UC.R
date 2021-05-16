# Fichier contenant les fonctions pour les applications illustrative : 

# measure performance :

perf.measure <- function(pred ,realCl, real )
{
  MatConf <- table(pred,realCl) %>% addmargins %>% 
    kable(caption = "matrice de confusion")%>% kable_styling
  P <- sum(realCl==1)
  N <- sum(realCl==0)
  n <- P+N
  Pp <- sum(pred==1)
  Np <- sum(pred==0)
  pre <- (((N*Np)/n)+((P*Pp)/n))/n
  pra <- sum((pred==0)&(real==0))+sum((pred==1)&(real==1))/n
  kappa <- (pra - pre)/(1 - pre)
  error <- sum(pred!=realCl)/nrow(real)
  FPrate <- sum((pred==1)&(real==0))/N
  FNrate <- sum((pred==0)&(real==1))/P
  accuracy <- 1 - error
  out <- c(error, accuracy, FPrate, FNrate, kappa)
  names(out) <- c("error", "accuracy", "FP/N", "FN/P", "kappa")
  perfM <- out%>%kable(caption = "Performance measures",
                       col.names = "value") %>% kable_styling()
  print(perfM)
  print(MatConf)
}

# Courbe ROC

RocAuc <- function(pred, realCl, mod){
  if (mod == "logit")
  {pred <- prediction(round(pred),realCl)}
  else 
  {pred <- prediction(pred$posterior[,2], realCl)}
  perf <- performance(pred, measure = "tpr", x.measure = "fpr")
  plot(perf, col=rainbow(10))
  segments(0,0,1,1)
  perf<-performance(pred,"auc");perf@y.values[[1]]
}

# Alternate cutoff

evoSeuil <- function(pred, realCl,real, mod){
  N<-sum(realCl==0)
  P<-sum(realCl==1)
  Error<-NULL
  FPr<-NULL
  FNr<-NULL
  for(i in 1:101){
    c<-(i-1)/100
    Prediction<-rep(0,nrow(real))
    if (mod=="logit")
    {Prediction[pred>c]<-1}
    else
    {Prediction[pred$posterior[,2]>c]<-1}
    Error[i]<-sum(Prediction!=realCl)/nrow(real)
    FPr[i]<-sum((Prediction==1)&(realCl==0))/N
    FNr[i]<-sum((Prediction==0)&(realCl==1))/P
  }
  par(cex=0.7)
  plot((0:100)/100,Error,type="l",xlim=c(0,1),ylim=c(0,1),
       ylab="Taux d'erreur",xlab="Seuil")
  par(new=T)
  plot((0:100)/100,FPr,type="l",xlim=c(0,1),ylim=c(0,1),
       ylab="",xlab="",xaxt="n",yaxt="n",col="orange")
  par(new=T)
  plot((0:100)/100,FNr,type="l",xlim=c(0,1),ylim=c(0,1),ylab="",xlab="",xaxt="n",yaxt="n",col="blue",lty="dashed")
  legend('topright', legend=c("Error ", "FP rate", "FN rate"),
         col=c("black","orange", "blue"), pch=15, bty="n", pt.cex=1, cex= 0.8, horiz=FALSE, inset=c(0.1,0.1))
  title("Evolution des 3 types d'erreur")
}

changeSeuil <- function(pred, realCl, real, seuil, mod){
  change_seuil<-rep(0,nrow(real))
  if (mod == "logit")
  {change_seuil[pred>seuil]<-1}
  else
  {change_seuil[pred$posterior[,2]>seuil]<-1}
  table(change_seuil,realCl) %>% addmargins %>% 
    kable(caption = "matrice de confusion avec le nouveau seuil") %>%
    kable_styling
}

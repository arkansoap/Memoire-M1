# Fichier contenant les fonctions pour les applications illustrative : 

# Split and standardize :
 
splitdata <- function(data, dataCl, prop, x){
  set.seed(x)
  split <- createDataPartition(data[[dataCl]], p = prop)[[1]]
  splitA <- data[-split,]
  splitB <- data[ split,]
  return(list(splitA= splitA,splitB= splitB))
}

standardize <- function(data1, data2, data3){
  # Estimate preprocessing parameters
  preproc.param <- data1 %>%
    preProcess(method = c("center", "scale"))
  # Transform the data using the estimated parameters
  train.transformed <- preproc.param %>% predict(data1)
  test.transformed <- preproc.param %>% predict(data2)
  evaluation.transformed <- preproc.param %>% predict(data3)
return(list(train = train.transformed, test = test.transformed, eval = evaluation.transformed))
}

split_standard2 <- function(data, dataCl, prop1=0.7, seed1=42, prop2=1/3, seed2=42){
  data1 <- splitdata(data, dataCl, prop1, seed1)
  data2 <- splitdata(data1$splitA, "popularity", prop2, seed2)
  datas <- standardize(data1[["splitB"]],
                       data2[["splitA"]], data2[["splitB"]])
}

split_standard <- function(data, dataCl){
  set.seed(42)
  split1 <- createDataPartition(data[[dataCl]],
                                p = .7)[[1]]
  other <- data[-split1,]
  training <- data[ split1,]
  set.seed(24)
  split2 <- createDataPartition(other[[dataCl]],
                                p = 1/3)[[1]]
  evaluation <- other[ split2,]
  testing <- other[-split2,]
  # Estimate preprocessing parameters
  preproc.param <- training %>%
    preProcess(method = c("center", "scale"))
  # Transform the data using the estimated parameters
  train.transformed <- preproc.param %>% predict(training)
  test.transformed <- preproc.param %>% predict(testing)
  evaluation.transformed <- preproc.param %>%
    predict(evaluation)
  return(list(train = train.transformed, test = test.transformed,
              eval = evaluation.transformed))
}

# measure performance :

# A modifier avec arguments : pred, real, y ...

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
  return(list(perf = perfM, matconf = MatConf))
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

# Fit the models :

models <- function(y, data){
  Modlda <- lda(as.formula(paste(y , "~ .")), data = data)
  Modlr <- glm(as.formula(paste(y , "~ .")), data = data,
               family=binomial(link=logit))
  Modrf <- randomForest(as.formula(paste(y , "~ .")), data = data,
                        method = "class", parms = list(split = "gini"),
                        na.action = na.roughfix)
  ModSvm <- svm(as.formula(paste(y , "~ .")), data = data, 
                scale = FALSE, kernel = "radial", cost = 5)
  return(list(Modlda = Modlda, Modlr = Modlr, Modrf = Modrf, ModSvm = ModSvm))
}

# function predict en developpement
# !!!!! changer critère d'acceptation pour predrf et predlog

predictions <- function(models, datas){
  predLda <- predict(models[["Modlda"]], datas[["test"]])
  probrf <- predict(models[["Modrf"]], datas[["test"]],
                    type = "prob")
  predrf <- ifelse(probrf[,2] > 0.5, 1, 0)
  predSvm <- predict(models[["ModSvm"]], newdata = datas[["test"]])
  problog <- predict(models[["Modlr"]], newdata = datas[["test"]],
                     type = 'response')
  # average <- sum(datas$train$popularity=="1")/nrow(datas$train)
  predlog <- ifelse(problog > 0.5, 1, 0)
  return(list(predLda = predLda, predrf = predrf,
              predSvm = predSvm, predlog = predlog))
}
# Fichier contenant les fonctions pour les applications illustrative :

########## Packages ##########

library(FactoMineR) # PCA, MCA, ...
library (tidyverse) # collection of packages for data analysis
library(caret) # Classification And REgression Training
library(pROC) # Tools for visualizing, smoothing and comparing ROC.
library(ROCR) # evaluating and visualizing classifier performance
library(lubridate) # R commands for date-times
library(tidymodels) #  collection of packages for modeling and machine learning using tidyverse principles. pre-process/train/validate
library(MASS) # Modern Applied Statistics with S" for regression and classification
library(stargazer) # Well-Formatted Regression and Summary Statistics Tables
library(randomForest) # ensemble learning method with multitude of decision tree 
library(doParallel) # parall?liser le calcul pour que ce soit plus rapide en cr?ant un cluster de cours.
library(parallel) # d?tection du nombre de coeurs
library(ranger) # A Fast Implementation of Random Forests. (tune rf)
library(e1071) # Misc Functions of the Department of Statistics, Probability Theory Group / for svm, tune, predict, ...
library(kableExtra) # Create Awesome HTML Table
library(smotefamily) # Synthetic Minority Oversampling TEchnique
library(ROSE) # Generation of synthetic data by Randomly Over Sampling Examples
library(gdata) # Various R programming tools for data manipulation / rename object with mv("oldname, newname")
library(naivebayes) #naive Bayes classifiers are a family of simple "probabilistic classifiers" based on applying Bayes' theorem
library(glmnet) # Lasso and Elastic-Net Regularized Generalized Linear Models
library(gridExtra) # positionnement graphique
library(cowplot) # positionnement graphique
library("RSBID") # resampling for imbalanced data (smote-nc, ...)
library(kernlab)
library(C50) # decision tree with cost

########## Split and standardize ##########

splitdata <- function(data, y, prop, seed) {
  set.seed(seed)
  split <- createDataPartition(data[[y]], p = prop)[[1]]
  splitA <- data[-split,]
  splitB <- data[split,]
  return(list(splitA = splitA, splitB = splitB))
}

standardize <- function(data1, data2, data3) {
  # Estimate preprocessing parameters
  preproc.param <- data1 %>%
    preProcess(method = c("center", "scale"))
  # Transform the data using the estimated parameters
  train.transformed <- preproc.param %>% predict(data1)
  test.transformed <- preproc.param %>% predict(data2)
  evaluation.transformed <- preproc.param %>% predict(data3)
  return(
    list(
      train = train.transformed,
      test = test.transformed,
      eval = evaluation.transformed
    )
  )
}

split_standard <-
  function(data,
           y,
           prop1 = 0.7,
           seed1 = 42,
           prop2 = 1 / 3,
           seed2 = 42,
           mod ) {
    data1 <- splitdata(data, y, prop1, seed1)
    data2 <- splitdata(data1$splitA, y, prop2, seed2)
    if (mod == "standard"){
      datas <- standardize(data1[["splitB"]],
                           data2[["splitA"]], data2[["splitB"]])
    }
    else if (mod == "nonstandard") {
      datas <- list(train = data1[["splitB"]],
                    test = data2[["splitA"]],
                    eval = data2[["splitB"]])
    }
    return (datas)
  }

########## measure performance ##########

# rajouter les TN (specificity)

perf.measure <- function(pred , real, y, beta = 1)
{
  MatConf <- table(pred, real[[y]]) %>% addmargins 
  P <- sum(real[[y]] == 1)
  N <- sum(real[[y]] == 0)
  Pp <- sum(pred == 1)
  Np <- sum(pred == 0)
  n <- P + N
  pre <- (Pp/n)*(P/n)+(Np/n)*(N/n)
  pra <- (sum((pred == 0) & (real[[y]] == 0)) + sum((pred == 1) & (real[[y]] == 1))) / n
  kappa <- (pra - pre) / (1 - pre)
  error <- sum(pred != real[[y]]) / nrow(real)
  FPrate <- sum((pred == 1) & (real[[y]] == 0)) / N
  TPrate <- sum((pred == 1) & (real[[y]] == 1)) / P
  TNrate <- sum((pred == 0) & (real[[y]] == 0)) / N
  PrecisionPPV <- sum((pred == 1) & (real[[y]] == 1)) / Pp
  accuracy <- 1 - error
  dominance <- TPrate - TNrate
  Fscore <- (1+beta^2)*((TPrate*PrecisionPPV)/(((beta^2)*PrecisionPPV)+TPrate))
  return(list( matconf = MatConf, accuracy = accuracy, FPrate = FPrate,
               TPrate = TPrate, kappa = kappa, PrecisionPPV = PrecisionPPV,
               Fscore = Fscore))
}

TableMetrics <- function(pred, dat, y){
  listPred <- list(pred$predrf$cla, pred$predlog$cla,
                   pred$predLda$class, pred$predSvm)
  LapPred <- lapply(listPred, perf.measure,
                    real = dat, y = y)
  tabloMetric <- NULL
  tabloMatconf <- NULL
  for(i in 1:4){
    tabloMetric <- rbind(tabloMetric, LapPred[[i]][2:7])
    tabloMatconf <- rbind(tabloMatconf, LapPred[[i]][1])
  }
  row.names(tabloMetric) <- c("rf", "log", "lda", "svm")
  return(list(tabloMetric, tabloMatconf))
}

KablesPerf <- function(pred, dat, y){
  Metrics1 <- TableMetrics(pred = pred, dat = dat, y = y)
  tabloMC <- rbind(
    c("rf", " ", " ", "log", " " ," "),
    cbind(Metrics1[[2]][[1]],Metrics1[[2]][[2]]),
    c("lda", " "," ", "svm"," ",  " "),
    cbind(Metrics1[[2]][[3]],Metrics1[[2]][[4]])
  )
  kableMC <- kable(tabloMC, caption = "Confusion matrix") %>%
    kable_styling(bootstrap_options = c("striped", "hover")) %>%
    row_spec(c(1,5), background = "lightgrey")  
  kableMetrics <- kable(as.data.frame(Metrics1[[1]])) %>%
    kable_styling(bootstrap_options = c("striped", "hover"))
  return(list(kableMC, kableMetrics))
}

TableMetrics2 <- function(pred, dat, y, listPred){
  LapPred <- lapply(listPred, perf.measure,
                    real = dat, y = y)
  tabloMetric <- NULL
  tabloMatconf <- NULL
  for(i in 1:4){
    tabloMetric <- rbind(tabloMetric, LapPred[[i]][2:7])
    tabloMatconf <- rbind(tabloMatconf, LapPred[[i]][1])
  }
  row.names(tabloMetric) <- c("rf", "log", "lda", "svm")
  return(list(tabloMetric, tabloMatconf))
}

KablesPerf2 <- function(pred, dat, y, listPred){
  Metrics1 <- TableMetrics2(pred = pred, dat = dat,
                            y = y, listPred = listPred)
  tabloMC <- rbind(
    c("rf", " ", " ", "log", " " ," "),
    cbind(Metrics1[[2]][[1]],Metrics1[[2]][[2]]),
    c("lda", " "," ", "svm"," ",  " "),
    cbind(Metrics1[[2]][[3]],Metrics1[[2]][[4]])
  )
  kableMC <- kable(tabloMC, caption = "Confusion matrix") %>%
    kable_styling(bootstrap_options = c("striped", "hover")) %>%
    row_spec(c(1,5), background = "lightgrey")  
  kableMetrics <- kable(as.data.frame(Metrics1[[1]]), digits = 3) %>%
    kable_styling(bootstrap_options = c("striped", "hover"))
  return(list(kableMC, kableMetrics))
}

# Courbe ROC

RocCurve <- function(predi, realCl, mod) {
  if (mod == "log")
  {
    pred <- prediction(round(predi$predlog$prob,3), realCl)
    colA <- "orange"
  }
  else if (mod == "rf")
  {
    pred <- prediction(round(predi$predrf$prob[,2],3), realCl)
    colA <- "green"
  }
  else if (mod == "lda")
  {
    pred <- prediction(predi$predLda$posterior[, 2], realCl)
    colA <- "red"
  }
  else if (mod == "svm")
  {
    BB <- attr(predi$predSvm, "probabilities")[,"1"]
    pred <- prediction(BB, realCl)
    colA <- "blue"
  }
  perf <- performance(pred, measure = "tpr", x.measure = "fpr")
  plot(perf, col = colA)
  segments(0, 0, 1, 1)
  perf <- performance(pred, "auc")
  AUC <- perf@y.values[[1]]
}

AllRoc <- function(predic, dataCl) {
  par()
  RocCurve(predi = predic, dataCl, mod = "lda")
  par(new = T)
  RocCurve(predi = predic, dataCl, mod = "svm")
  par(new = T)
  RocCurve(predi = predic, dataCl, mod = "log")
  par(new = T)
  RocCurve(predi = predic, dataCl, mod = "rf")
  legend(
    'topleft',
    legend = c("lda", "lr", "rf", "svm"),
    col = c("red", "orange", "green", "blue"),
    pch = 15, cex = 0.8
  )
  title("Roc Curves")
}

########## Post-processing Alternate cutoff ##########

evoSeuil <- function(pred, realCl, real, mod) {
  N <- sum(realCl == 0)
  P <- sum(realCl == 1)
  Error <- NULL
  FPr <- NULL
  FNr <- NULL
  for (i in 1:101) {
    c <- (i - 1) / 100
    Prediction <- rep(0, nrow(real))
    if (mod == "autres")
    {
      Prediction[pred > c] <- 1
    }
    else if (mod == "posterior")
    {
      Prediction[pred$posterior[, 2] > c] <- 1
    }
    Error[i] <- sum(Prediction != realCl) / nrow(real)
    FPr[i] <- sum((Prediction == 1) & (realCl == 0)) / N
    FNr[i] <- sum((Prediction == 0) & (realCl == 1)) / P
  }
  par(cex = 0.7)
  plot((0:100) / 100,
       Error, type = "l",
       xlim = c(0, 1), ylim = c(0, 1),
       ylab = "Taux d'erreur", xlab = "Seuil"
  )
  par(new = T)
  plot((0:100) / 100,
       FPr, type = "l", xlim = c(0, 1),
       ylim = c(0, 1), ylab = "", xlab = "",
       xaxt = "n", yaxt = "n", col = "orange"
  )
  par(new = T)
  plot((0:100) / 100,
       FNr, type = "l",
       xlim = c(0, 1), ylim = c(0, 1), ylab = "", xlab = "",
       xaxt = "n", yaxt = "n", col = "blue", lty = "dashed"
  )
  legend(
    'topright',
    legend = c("Error ", "FP rate", "FN rate"),
    col = c("black", "orange", "blue"), pch = 15,
    bty = "n", pt.cex = 1,
    cex = 0.8, horiz = FALSE, inset = c(0.1, 0.1)
  )
  title("Evolution des 3 types d'erreur")
}

changeSeuil <- function(pred, realCl, real, seuil, mod) {
  change_seuil <- rep(0, nrow(real))
  if (mod == "autres")
  {
    change_seuil[pred > seuil] <- 1
  }
  else if (mod == "posterior")
  {
    change_seuil[pred$posterior[, 2] > seuil] <- 1
  }
  out <- change_seuil
}

########## Fit the models ##########

priors <- function(dat, y){
  a = sum(dat[[y]] == 1) / nrow(dat)
  b = 1 - a
  return(c(b,a)) 
}

#set seed entre les mod?
#prior =c( sum(data$y == 1) / nrow(data) ,1 -((sum(data$y == 1) / nrow(data))))
models <- function(y, data,
                   prior,
                   alpha = 0.5,
                   laplace = 0,
                   CWSvm = c("0" = 1, "1" = 1),
                   CWRf = c(1,1),
                   mtry = length(data)-1, nodesize = 1,
                   kernSvm = "polynomial", costSvm = 1) {
  set.seed(777)
  Modlda <- lda(as.formula(paste(y , "~ .")), data = data,
                prior = prior)
  Modlr <- glmnet(as.formula(paste(y , "~ .")),
               data = data,
               family = "binomial",
               alpha = alpha
  )
  Modrf <- randomForest(
    as.formula(paste(y , "~ .")),
    data = data,
    type = "classification",
    method = "class",
    parms = list(split = "gini"),
    mtry = mtry,
    nodesize = nodesize,
    classwt = CWRf
  )
  ModSvm <- svm(
    as.formula(paste(y , "~ .")),
    data = data,
    scale = FALSE,
    kernel = kernSvm,
    cost = costSvm,
    class.weights = CWSvm,
    probability = TRUE
  )
  ModBayes <- naive_bayes(
    as.formula(paste(y , "~ .")),
    data = data,
    laplace = laplace
  )
  return(list(
    Modlda = Modlda,
    Modlr = Modlr,
    Modrf = Modrf,
    ModSvm = ModSvm,
    ModBayes = ModBayes
  ))
}

########## Make Predictions ##########

predictions <- function(models, datas) {
  predLda <- predict(models[["Modlda"]], datas[["test"]])
  predrf <- NULL
  predrf$prob <- predict(models[["Modrf"]], datas[["test"]],
                         type = "prob")
  predrf$cla <- ifelse(predrf$prob[, 2] > 0.5, 1, 0)
  predSvm <- predict(models[["ModSvm"]], newdata = datas[["test"]], probability = TRUE)
  predlog <- NULL
  predlog$prob <- predict(models[["Modlr"]], newdata = datas[["test"]],
                          type = 'response')
  # average <- sum(datas$train$popularity=="1")/nrow(datas$train)
  predlog$cla <- ifelse(predlog$prob > 0.5, 1, 0)
  predBayes <- predict(models[["Modbayes"]], datas[["test"]])
  return(list(
    predLda = predLda,
    predrf = predrf,
    predSvm = predSvm,
    predlog = predlog,
    predBayes = predBayes
  ))
}

########## Pre Processing ##########

# return le resamp
resamp_res <- function(datas, mod ){
  if (mod == "US"){
    Resamp <- upSample( datas[,-1], datas[,1])
  } else if (mod == "DS"){
    Resamp <- downSample(datas[,-1], datas[,1])
  } else if (mod == "Smote"){
    smote <- SMOTE(datas[,-1], datas[,1])
    Resamp <- smote$data
    Resamp$class<-as.factor(Resamp$class)
    names(Resamp)[names(Resamp) == "class"] <- "Class"
  } else if (mod == "BLS"){
    bls <- BLSMOTE(datas[,-1], datas[,1])
    Resamp <- bls$data
    Resamp$class<-as.factor(Resamp$class)
    names(Resamp)[names(Resamp) == "class"] <- "Class"
  } else if (mod == "Adasyn"){
    adas <- ADAS(datas[,-1], datas[,1])
    Resamp <- adas$data
    Resamp$class <- as.factor(Resamp$class)
    names(Resamp)[names(Resamp) == "class"] <- "Class"
  } else if (mod == "SMOTE-NC"){
    smnc <- SMOTE_NC(datas[,-1], datas[,1])
    Resamp <- smnc$data
    Resamp$class<-as.factor(Resamp$class)
    names(Resamp)[names(Resamp) == "class"] <- "Class"
  }
  datasplit <- split_standard(Resamp, "Class" , mod = "standard")
  Models <- models(y = "Class", data = datasplit$train,
                   prior = priors(datasplit$train, "Class"))
  Predictions <- predictions(models = Models, datas = datasplit)
  tablos <- KablesPerf(pred = Predictions, dat = datasplit$test,
                       y = "Class")
  Rocs <- AllRoc(predic = Predictions, dataCl = datasplit$test$Class)
  return(list(tablos, Rocs))
}

########## Direc cost sensitive learning with C50 ##########

C5graph <- function(data, y){
  Perfs <- NULL
  resTP <- NULL
  resFP <- NULL
  resKAP <- NULL
  for (Ratio in 1:20){
    c5Matrix <- matrix(c(0, 1, Ratio, 0), ncol = 2)
    rownames(c5Matrix) <- levels(data$train[[y]])
    colnames(c5Matrix) <- levels(data$train[[y]])
    modelC5 <- C5.0(as.formula(paste(y , "~ .")),
                    data = data$train,
                    costs = c5Matrix)
    PredC5 <- predict(modelC5, data$test)
    Perfs <- perf.measure(PredC5, data$test, y)
    resTP <- rbind(resTP,Perfs$TPrate)
    resFP <- rbind(resFP,Perfs$FPrate)
    resTN <- 1-resFP
    resKAP <- rbind(resKAP, Perfs$kappa)
  }
  
  par(mfrow=c(1,2))
  plot(resTP, xlim = c(0, 20), ylim = c(0, 1),
       ylab = "", xlab = "cost", type = "b",
       col = "blue", pch = 4, lty = 2)
  par(new = TRUE)
  plot(resTN,  xlim = c(0, 20), ylim = c(0, 1),
       ylab = "", xlab = "",
       col = "red", pch = 3, type = "b")
  plot(resKAP,  xlim = c(0, 20), ylim = c(-1, 1))
}
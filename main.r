library(jmv)
library(DataExplorer)

data <- read.csv("./dataset.csv")

data <- transform(
    data,
    age = as.integer(age),
    gender = as.factor(gender),
    hypertension = as.factor(hypertension),
    heart_disease = as.factor(heart_disease),
    ever_married = as.factor(ever_married),
    work_type = as.factor(work_type),
    Residence_type = as.factor(Residence_type),
    avg_glucose_level = as.numeric(avg_glucose_level),
    bmi = as.numeric(bmi),
    smoking_status = as.factor(smoking_status),
    stroke = as.factor(stroke)
)

DataExplorer::create_report(data)

cor.test(data$heart_disease, data$stroke)
?corrMatrix
jmv::corrMatrix(data, vars = vars(heart_disease, avg_glucose_level), plots = T, plotDens = T, ci = T)
library(Hmisc)
res2 <- rcorr(as.matrix(mtcars[, 1:7]))
flattenCorrMatrix(res2$r, res2$P)
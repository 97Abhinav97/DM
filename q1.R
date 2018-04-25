library(editrules)
d = read.table(file.choose(),header=TRUE)  #select people.txt
attach(d)  #to avoid using $ symbol with dataset
E <- editset(expression(
  age >= 0,
  age <= 150,
  age > yearsmarried,
  status %in% c('single','married','widowed'),
  if(age <= 18) agegroup %in% c('child'),
  if(age > 18 && age < 65 ) agegroup %in% c('adult'),
  if(age >= 65) agegroup %in% c('elderly')
))
sm <- violatedEdits(E,d)
summary(sm)
plot(sm)

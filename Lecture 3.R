#Lecture 3

a=c(1,3,4,2)#creates a vector with 4 elements

a[1:3]#prints out the first 3 elements

sum(a[1:3]) #sum of the first 3 elements
for(i in 1:4) sum(a[1:i]) #for loop sum 1:i elements of the "a" vector
for(i in 1:4) print(sum(a[1:i])) #prints this sum

b=c(NA,NA,NA,NA) #
b=rep(NA,10) #repeats the first value "NA" 10 times
for(i in 1:4) b[i]=sum(a[1:i])
cumsum(a) #cumulative sum ( does the same as the for loop)


matrix(1:9, ncol=3, nrow=3) #creates a 3x3 matrix filled with numbers 1-9
A=matrix(1:9, ncol=3, nrow=3, byrow=T) #same as above, but with elements filling rows first

t(A) #does the transpose of the matrix
det(A) #takes the determinant
diag(A) #exctracts the diagonal elements
sum(diag(A))
diag(4) #creates a 4x4 diagonal matrix

solve(matrix(c(2,3,1,5),2,2)) #Inverse the matrix

#column sum
sum(A[,1]) #sums the first column
sum(A[,2]) #sums the second column

for (i in 1:3) print(sum(A[,i])) #using a for loop to sum each column
apply(A,2,sum) #apply function automatically sums every column
apply(A,1,sum) #sum by row
apply(A,2, mean) #takes the mean of every column
apply(A,1, mean) #likewise, takes the mean of every row

x=c(2,6,3,1,5,7); y=c(8,2,4,2,5,3)
x+y;x-y;x/y;x*y

C=rbind(x,y) ; C #binds vectors by rows
str(C)
D=cbind(x,y)  #binds vectors by column

curve(dchisq(x,df=3),0,20)
for (degfree in c(5,7,10,20)) curve(dchisq(x, df = degfree),0,20, add = T)

#//////////////////////////CLT////////////////////////////

n=40 #sample size

smat=matrix(rchisq(100*n, df=4), nrow=100, ncol=n)  #creating our simulation matrix
xbar=apply(smat,1,mean)

hist(xbar, freq=F, ylim=c(0,0.9))
curve(dnorm(x, mean=4, sd=sqrt(8/n) ),col="steelblue",lwd=2, add=T)


par(mfrow=c(3,2))
for (n in c(5,10,20,50,100,200)) {
  smat=matrix(rchisq(100*n, df=4), nrow=100, ncol=n)
  xbar=apply(smat, 1, mean)
  hist(xbar, freq=F,
       main=paste("Sample Size =", n)
       )
  curve(dnorm(x, mean=4, sd=sqrt(8/n)), col="steelblue", add=T)
}

#///////////////////// Import Data /////////////////////////////

case1=scan("C:/Users/schen/Documents/Lecture 3/case1(2).dat") #scanning data

setwd("C:/Users/schen/Documents/Lecture 3")  #sets the working directory
case2=scan("case2(2).dat")
case3=scan("case3(2).dat")
case4=scan("case4(2).dat")


x=c(2.04, 2.68, 1.53, 0.51, 1.73, 1.37, 1.23, 3.25, 3.30, 3.11,     3.77, 2.87, 5.17, 2.28, 8.29, 5.67, 9.36, 4.58, 3.14, 5.10)

c(rep("M",10), rep("F",10))
gen=rep(c("M","F"), each=10)
rep(c("M","F"), times=10)
rep(c("M","F"), c(7,13))

mydata=data.frame(Gender=gen, resp=x)
head(mydata)

read.table("exdf.dat", head=T) #reads table, if you haven't set the working directory than you will need to type in the full path
read.table("exdf.csv", head=T, sep=",") #if you read as csv, sometimes you need to define the delimiter
read.csv("exdf.csv", head=T)


b<-rnorm(10)
x<-list(a=1:5, b=rnorm(10))
lapply(x, mean)

x<-list(a=1:4, b=rnorm(10), c=rnorm(2000,1), d=rnorm(1000,5))
lapply(x, mean)
<
        
print
printmessage2 <-function(x){
                 
                         if(x>0) print ("X is greater than zero")
                 else print("X is less or equal to zero")
         
         }
library(combinat)

fubukiSolver1 <- function(pos=5, selectedVal=2, r1=17, r2=15, r3=13, c1=16, c2=11, c3=18)
{
  numList <- (1:9)[-selectedVal]
  
  totalPerm <- factorial(8)
  permList <- permn(numList)
  
  final9 <- numeric(9)
  remainPositions<- (1:9)[-pos]
  
  n <- 0 #To keep track of number of solutions
  
  for (i in 1:totalPerm){
    final9[pos] <- selectedVal
    final9[remainPositions] <- permList[[i]]
    
    Row1 <- sum(final9[1:3])
    Row2 <- sum(final9[4:6])
    Row3 <- sum(final9[7:9])
    
    Col1 <- sum(final9[c(1,4,7)])
    Col2 <- sum(final9[c(2,5,8)])
    Col3 <- sum(final9[c(3,6,9)])
    
    if( Row1 ==r1 &&
        Row2 ==r2 &&
        Row3 ==r3 &&
        Col1 ==c1 &&
        Col2 ==c2 &&
        Col3 ==c3 ){
      
      n<-n+1
      
      if (n == 1){
        output = matrix(final9, nrow=3, ncol=3, byrow=TRUE)
      }
      else if (n > 1){
        output = rbind(output, matrix(final9, nrow=3, ncol=3, byrow=TRUE))
      }
      
    }
  }
  
  if (n >= 1){
    finOutput <- array(NA, c(3,3,n))
    
    for (i in 1:n) {
      finOutput[,,i]<- output[((i-1)*3+1):((i-1)*3+3),]
    }
    return (finOutput)
  }
}

fubukiSolutions <- function(valInput) {
  result <- ""
  
  if (length(valInput) != 0){
    result <- sprintf("Total solution(s) are: %d", length(valInput)/9 )
    return (result)
    
    
  }
  else {
    return ("There is no solution")
  }
}


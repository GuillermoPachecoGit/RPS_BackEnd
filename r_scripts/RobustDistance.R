parseJSON <- function(r,f,c,data, consensus = FALSE) {

  #creo la matriz
  if(consensus){
    R <- array(matrix(nrow = f, ncol = c, 0), c(f, c, r + 1), dimnames = NULL)
  }
  else{
    R <- array(matrix(nrow = f, ncol = c, 0), c(f, c, r), dimnames = NULL)
  }
  
  #comienzo iterar
  for (i in 1:r) {
      for(j in 1:c){
        for(k in 1:f){
          R[k,j,i] = data[i,k,j]
        }
      }
  }
  R
}

distanciaR <- function(X) {
    numEjemplares <- ncol(X[1, , ])
    nLandmark <- nrow(X[, , 1])

    D <- matrix(nrow = numEjemplares, ncol = numEjemplares, 0)

    for (i in 1:numEjemplares) {
        j <- (i + 1)
        while (j <= numEjemplares) {
            distanciaTotal <- 0
            for (land in 1:nLandmark) {
                # print(norm(t(as.matrix(X[land,,i]))-t(as.matrix(X[land,,j]))))
                distanciaLocal = norm(t(as.matrix(X[land, , i])) - t(as.matrix(X[land, , j])))
                distanciaTotal = distanciaTotal + distanciaLocal
            }
            D[i, j] <- distanciaTotal
            D[j, i] <- distanciaTotal
            j <- j + 1
        }
    }
    return(D)

}


needs(igraph)
needs(geomorph)
needs(MASS)
needs(jsonlite)
attach(input[[1]])

result <- distanciaR(parseJSON(num_specimen,num_landmark,dim, jsonlite::fromJSON(data)))
json <- list(data = result , dimention = ncol(result))
toJSON(json, pretty = TRUE, auto_unbox = TRUE)


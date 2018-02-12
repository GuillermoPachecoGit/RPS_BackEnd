
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

needs(igraph)
needs(geomorph)
needs(MASS)
needs(jsonlite)
attach(input[[1]])
result <- geomorph::gpagen(parseJSON(num_specimen,num_landmark,dim, jsonlite::fromJSON(data)))
dataset <- result['coords'][[1]]

n_land = nrow(dataset[,,1])
n_spec = ncol(dataset[,1,])
n_dim = nrow(dataset[1,,])
json <- list(specimen_name = rownames(result['data'][[1]][0]),data = dataset, numbers_of_specimen = n_spec, numbers_of_landmark = n_land , dimention = n_dim)
toJSON(json, pretty = TRUE, auto_unbox = TRUE)



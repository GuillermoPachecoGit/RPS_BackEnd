needs(igraph)
needs(geomorph)
needs(jsonlite)
attach(input[[1]])

readland.txtJ <- function(path, dim) {
    result <- read.table(path)  #get data from the file into an array
    s <- nrow(result)  #number of objects
    p <- ncol(result[1, ]) - 1
    p <- p/dim
    M <- array(matrix(nrow = p, ncol = dim, 0), c(p, dim, s-1))  #output structure
    names <- list()
    for (i in 2:s) {
        line <- as.matrix(result[i, ])
        name <- as.character(line[1])  #gets the names
        names <- c(names, name)

        m_specimen <- matrix(nrow = p, ncol = dim, 0)
        elem = 2
        for (k in 1:p) {
            coord = 1
            while (coord <= dim) {
                m_specimen[k, coord] <- as.double(line[elem])
                elem <- (elem + 1)
                coord = (coord + 1)
            }
        }
        M[, , i-1] <- m_specimen
    }
    return(list(M, names))
}


names = c()
if(type_file == 1){
    dataset =  geomorph::readland.tps(file,specID = c("ID"),warnmsg = FALSE)
    names = dimnames(dataset)[[3]]
}else if (type_file == 2){
    dataset =  geomorph::readland.nts(file)
    names = unlist(strsplit(dimnames(dataset)[[3]][[1]], split=" "))
}else if(type_file == 2){
    #txt to mophologika
    dataset =  geomorph::read.morphologika(file)
    names = dimnames(dataset)[[3]]
}else{
    
    aux = readland.txtJ(file,3) #only 3D
    dataset = aux[[1]]
    names = aux[[2]]
}



n_land = nrow(dataset[,,1])
n_spec = ncol(dataset[,1,])
n_dim = nrow(dataset[1,,])
json <- list(objects_name = names,data = dataset, numbers_of_specimens = n_spec, numbers_of_landmarks = n_land , dimention = n_dim)
toJSON(json, pretty = TRUE, auto_unbox = TRUE)


 
needs(igraph)
needs(geomorph)
needs(jsonlite)
attach(input[[1]])

names = c()
if(type_file == 1){
    dataset =  geomorph::readland.tps(file,specID = c("ID"),warnmsg = FALSE)
    names = dimnames(dataset)[[3]]
}else if (type_file == 2){
    dataset =  geomorph::readland.nts(file)
    names = unlist(strsplit(dimnames(dataset)[[3]][[1]], split=" "))
}else{
    #txt to mophologika
    dataset =  geomorph::read.morphologika(file)
    names = dimnames(dataset)[[3]]
}



n_land = nrow(dataset[,,1])
n_spec = ncol(dataset[,1,])
n_dim = nrow(dataset[1,,])
json <- list(specimen_name = names,data = dataset, numbers_of_specimen = n_spec, numbers_of_landmark = n_land , dimention = n_dim)
toJSON(json, pretty = TRUE, auto_unbox = TRUE)


 
needs(igraph)
needs(geomorph)
needs(jsonlite)
attach(input[[1]])
dataset =  geomorph::readland.tps(file,specID = c("ID"),warnmsg = FALSE)
names = dimnames(dataset)[[3]]
n_land = nrow(dataset[,,1])
n_spec = ncol(dataset[,1,])
n_dim = nrow(dataset[1,,])
json <- list(specimen_name = names,data = dataset, numbers_of_specimen = n_spec, numbers_of_landmark = n_land , dimention = n_dim)
toJSON(json, pretty = TRUE, auto_unbox = TRUE)


 
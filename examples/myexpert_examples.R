# load and plot probability surface raster
data(myprobsurface)
plot(myprobsurface)

# load and plot study area
data(mystudyarea); plot(mystudyarea, add = TRUE)

# load and plot all expert score datasets
data(myexpert1); plot(myexpert1, add = TRUE)
data(myexpert2); plot(myexpert2, add = TRUE)
data(myexpert3); plot(myexpert3, add = TRUE)

# load and plot occurrence data
data(myoccurrences); plot(myoccurrences, col = "red", add = TRUE)

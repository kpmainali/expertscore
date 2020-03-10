# load data
data(myexpert1)
data(myprobsurface)
data("mystudyarea")
data("myoccurrences")

# compute expert score
expertscore(expertmap = myexpert1, probsurface = myprobsurface, studyarea = mystudyarea)
plot(myprobsurface)
plot(mystudyarea, add=T)
plot(myoccurrences, add=T)
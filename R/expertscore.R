#' Expert score
#' 
#' This is a short description
#' 
#' @details Here are a bunch of details about this function
#' 
#' @param expertmap THis is a map
#' @param probsurface This is a raster
#' @param studyarea This is study area
#' 
#' @return This function returns an expert score
#' 
#' @author Kumar Mainali, Elie G, T He.
#' 
#' @references Mainali et al Conservation Biology
#' 
#' 
#' @example
#' examples/expertscore_example.R


expertscore <-
function(expertmap, probsurface, studyarea) {
	# check expertmap and studyarea are valid SpatialPolygon*
	# check all three data have the projection
	# check expertmap is contained fully within studyarea
	
	# rasterize and clip expert map to the extent of studyarea
	rl.expert <- rasterize(expertmap, probsurface, background=0, field=1)
	rl.expert <- mask(rl.expert, studyarea)
	
	# rasterize the study area
	rl.S <- rasterize(mystudyarea, probsurface, background=0)
	rl.S <- mask(rl.S, studyarea)
	
	# probability in all pixels of continuous surface in the extent of study area
	p <- mask(probsurface, studyarea)[]
	
	# deviance of the expert map
	y <- rl.expert[]
	dev.expert <- -2*sum(y*log(p) + (1-y)*log(1-p),na.rm=TRUE)
	
	# deviance of study area
	y <- rl.S[]
	dev.S <- -2*sum(y*log(p) + (1-y)*log(1-p),na.rm=TRUE)
	
	# expert score
	exp.score <- 1-dev.expert/dev.S

	return(exp.score)	
	
}

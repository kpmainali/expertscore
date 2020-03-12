#' Expert score
#' 
#' This packages computes score of an expert map based on its congruence with probability surface of a species distribution model.
#' 
#' @details  A quantitative metric called expert score was developed by Mainali et al to evaluate the agreement 
#' between an expert map and a habitat probability surface obtained from a species distribution model.
#' This method rewards both the avoidance of unsuitable sites and the inclusion of suitable sites in the expert map. 
#' 
#' The Expert Score has a similar interpretation as the familiar coefficient of determination from simple linear regression or the more general pseudo-coefficient of determination for generalized linear models. 
#' For example, when the Expert Score equals 0, the expert map has predictive accuracy equal to that that of the null map. 
#' When the Expert Score equals 1, the expert map perfectly distinguishes occupied sites from unoccupied sites. 
#' Expert Score can be negative when an expert map has less predictive accuracy than the null map. 
#' The score is computed as 1 - expert map deviance/null deviance. 
#' Given the heterogeneity and discontinuity of suitable landscape, expert maps that are drawn with more detail are 
#' more likely to agree with SDMs and thus minimize both commission and omission errors.

#' 
#' @param expertmap THis is a map
#' @param probsurface This is a raster
#' @param studyarea This is study area
#' 
#' @return This function returns an expert score
#' 
#' @author
#' 
#' @references Kumar Mainali, Trevor Hefley, Leslie Ries, William Fagan 2020. Matching expert range maps with species distribution model predictions. Conservation Biology https://doi.org/10.1111/cobi.13492
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

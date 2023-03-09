regress ed dist
/* regression on years of completed education to how close a high school is to
a 4 year college. */
// the y-int is  13.95586 and the slope is -.0733727
/* according to this regression model for every 1 mile further your high school
is from the nearest 4 year college you will have 0.07 less years of schooling */
gen BobsDist = 13.95586 + (-.0733727*20)
display BobsDist
/* shows the prediction of bobs years of schooling based on him living 20 miles
away from the nearest 4 year college */
gen BobsDist_new = 13.95586 + (-.0733727*10)
display BobsDist_new
/* shows the prediction of bobs years of schooling based on him living 10 miles
away from the nearest 4 year college */
/* distance to college does not explain a large fraction of the variance in 
educational attainment across individuals as seen by the R^2 value
the R^2 value is incredibly low showing the the amount of variance in Y explained
by X is less than 8% in this case. Meaning their are other variables at play.
The SER is the MSR, or  3.266831 in this case and the units are the dependent
units or years of completed education.

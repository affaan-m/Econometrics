scatter growth tradeshare in 1/65, mlabel(country_name) msize(small)
/* there seems to be a slight correlation between growth and tradeshare
it doesn't seem to be all that prominent however. Malta does seem to look like
an outlier however if we drew a straight line through and tried to 
model linearlly it might not be */
reg growth tradeshare
// the slope is 2.3064 and the y-int is 0.6402
gen growthrate_05 = .6402653 + (0.5* 2.306434)
gen growthrate_1 = .6402653 + (1*2.306434)
display growthrate_05
display growthrate_1
// shows the predicted growthrate of an 0.5 td country and then a 1 td country
reg growth tradeshare if _n < 65
// conducts regression on every country except malta
gen adjustedgrowthrate_05 =  .9574107 + 0.5*1.680905
gen adjustedgrowthrate_1 = .9574107 + 1*1.680905
display adjustedgrowthrate_05
display adjustedgrowthrate_1
// shows the predicted growthrate of an 0.5 td and 1 td country excluding malta
reg growth tradeshare
predict growth_pred1, xb
twoway scatter growth tradeshare || scatter growth_pred1 tradeshare
//plots the regression line for all the observations aka the original dataset
reg growth tradeshare if _n < 65
predict growth_pred2, xb
twoway scatter growth tradeshare || scatter growth_pred2 tradeshare
//plots the regression line for all the observations except malta
/* the regression function that includes malta is evidently steeper due to
malta being a clear outlier and pulling the rest of the data upwards to the right
once removed we have a flatter regression indicating less of a correlation
it is possible that due to malta being a tiny rich island located perfectly in
the southern european waters that it is a trade hub and therefore operates
differently than other countries similarly to how qatar and dubai grew malta
follows the same pattern of low population but prime location or resources so
the per capita growth skyrockets and trade as a percentage of size and population
is incredibly skewed. 



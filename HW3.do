// E3.1
//a
use "CPS96_15.dta"
mean ahe if year == 1996
mean ahe if year == 2015
gen sd_1996 = (ahe - r(mean))^2
sum sd_1996 if year == 1996
gen sd_2015 = (ahe - r(mean))^2
sum sd_2015 if year == 2015
ttest ahe, by(year)
gen diff = ahe if year == 2015 - ahe if year == 1996
ttest diff
//b
gen ahe_2015 = ahe * 237.0/156.9 if year == 1996
replace ahe = ahe_2015 if year == 1996
mean ahe if year == 1996
mean ahe if year == 2015
gen sd_1996 = (ahe - r(mean))^2
sum sd_1996 if year == 1996
gen sd_2015 = (ahe - r(mean))^2
sum sd_2015 if year == 2015
ttest ahe, by(year)
gen diff = ahe if year == 2015 - ahe if year == 1996
ttest diff
//c we would use the results from b because the data are 
//adjusted for the price inflation that occurred between 1996 and 2015.
//d
ttest ahe if bachelor == 1
ttest ahe if bachelor == 2
ttest ahe if bachelor == 1, by(bachelor)
//e
gen ahe_2015 = ahe * 237.0/156.9 if year == 1996
replace ahe = ahe_2015 if year == 1996
ttest ahe if bachelor == 1
ttest ahe if bachelor == 2
ttest ahe if bachelor == 1, by(bachelor)
ttest ahe_2015 if bachelor == 1 & year == 1996, by(year)

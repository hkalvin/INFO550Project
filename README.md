## Hannah Kalvin's INFO 550 Project

For my project, I will analyze the a simulated dataset similar to the structure of SEER. The data contains age-adjusted breast cancer mortality rates by state and race.

To analyze the data you will need to install some `R` packages. The required packages can be installed using `R` commands.

``` r
installed_pkgs <- row.names(installed.packages())
pkgs <- c("readr", "ggplot2","tidyverse","magrittr","kableExtra")
for(p in pkgs){
	if(!(p %in% install_pkgs)){
		install.packages(p)
	}
}
```

## Execute the analysis

To execute the analysis, from the project folder you can run 

``` bash
Rscript -e "rmarkdown::render('HKalvin_HW4.Rmd')"
```

This will create a file called `HKalvin_HW4.html` output in your directory that contains the results.


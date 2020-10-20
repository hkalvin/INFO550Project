## Hannah Kalvin's INFO 550 Project

For my project, I will analyze the a simulated dataset similar to the structure of SEER. The data contains age-adjusted breast cancer mortality rates by state and race.

To analyze the data you will need to install some `R` packages. The required packages can be installed using `R` commands.

``` r
installed_pkgs <- row.names(installed.packages())
pkgs <- c("readr", "ggplot2","tidyverse","magrittr","kableExtra")
for(p in pkgs){
	if(!(p %in% installed_pkgs)){
		install.packages(p)
	}
}
```

You may also install necessary `R` packages using make install from the project folder.
``` bash
make install
```

## Execute the analysis

To create the analysis report, from the project folder you can run 

``` bash
make report
```

This will create a file called `HKalvin_report.html` which will output in your directory that contains the results.

## Additional helpful information

To clean the data, from the project folder you can run 
``` bash
make clean_data/%.csv
```

This will create cleaned analysis datasets saved to the clean_data folder within the project folder (creates two .csv files - all2.csv and ds2_fig.csv).

To generate the figures used in the analysis report, you can run
``` bash
make figures/%.png
```

For more information on the Makefile targets, from the project folder you can run

``` bash
make help
```
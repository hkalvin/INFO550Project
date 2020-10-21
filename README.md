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

Packages must be installed prior to creating the report (i.e. run make install before make report). To create the analysis report, from the project folder you can run 

``` bash
make report
```

This will create a file called `HKalvin_report.html` which will output in your directory that contains the results.

## Additional helpful information

To clean the data, from the project folder you can run 
``` bash
make clean_data/all2.csv
make clean_data/ds2_fig.csv
```
All2.csv will be used to generate the report tables and ds2_fig.csv will be used to generate the figures in the report.

Both cleaned analysis datasets will be saved to the clean_data folder within the project folder.

To generate all four figures used in the analysis report, you can run
``` bash
make figures/%.png
```

For more information on the Makefile targets, from the project folder you can run

``` bash
make help
```
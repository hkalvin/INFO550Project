## Hannah Kalvin's INFO 550 Project

For my project, I will analyze the a simulated dataset similar to the structure of SEER. The data contains age-adjusted breast cancer mortality rates by state and race.

## Conduct analysis using Docker

You will first need to pull the docker container in order to run the analysis and produce the report.

To pull the docker container, you can use the following code in your terminal:
```bash
docker pull hkalvin/infoproj
```

Then build the image:
```bash
make build
```

And run docker image to produce the report.
```bash
docker run infoproj
```

## Conduct analysis within terminal (without Docker)

To analyze the data you will need to install some `R` packages. 

The required `R` packages can be installed using make install in terminal once you have navigated to the project folder.
``` bash
make install
```

## Execute the analysis

Packages must be installed prior to creating the report (i.e. run make install before make report). You will notice that the repo contains some empty folders. This is purposeful as you can run the commands below in order to create the files that belong in each of those empty folders.

To create the analysis report, from the project folder you can run 
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
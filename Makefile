
#rule for building Dockerfile
build:
	docker build -t infoproj .

#rule for making report
report: R/HKalvin_report.Rmd clean_data/all2.csv clean_data/ds2_fig.csv figures/south.png figures/northeast.png figures/northcentral.png figures/west.png
	Rscript -e "rmarkdown::render('R/HKalvin_report.Rmd', quiet = TRUE, output_file='../HKalvin_report.html')"

#rule for installing packages
install: R/01_installpackages.R
	chmod +x R/01_installpackages.R && \
	Rscript R/01_installpackages.R

#rule for cleaning data for first dataset
clean_data/ds2_fig.csv: raw_data/fulldata2.csv R/02a_cleandata.R 
	chmod +x R/02a_cleandata.R && \
	Rscript R/02a_cleandata.R

#rule for cleaning data for first dataset
clean_data/all2.csv: raw_data/fulldata2.csv R/02b_cleandata.R 
	chmod +x R/02b_cleandata.R && \
	Rscript R/02b_cleandata.R

#rule for making figures
figures/%.png: clean_data/ds2_fig.csv R/04_createfigures.R
	chmod +x R/04_createfigures.R && \
	Rscript R/04_createfigures.R

#rule for help file
.PHONY: help
help: 
	@echo "build                  : build docker image to create report."
	@echo "install                : check to see if necessary packages for report generation are installed in R, and install those that are missing."
	@echo "clean_data/ds2_fig.csv : clean raw data for figure creation for report (creates clean_data/ds2_fig.csv)"
	@echo "clean_data/all2.csv    : clean raw data for table creation for report (creates clean_data/all2.csv)"
	@echo "figures/%.png          : generate four breast cancer mortality figures by region (south.png, west.png, northcentral.png and northeast.png) saved to figures folder"
	@echo "report                 : Generate final analysis report, HKalvin_report.html"

#rule for installing packages
install: R/01_installpackages.R
	chmod +x R/01_installpackages.R && \
	Rscript R/01_installpackages.R

#rule for cleaning data
clean_data: R/01_installpackages.R raw_data/fulldata2.csv R/02_cleandata.R
	chmod +x R/02_cleandata.R && \
	Rscript R/02_cleandata.R


#rule for making figures
figures/%.png: R/01_installpackages.R clean_data/forfigure/ds2_fig.csv clean_data/fortable/all2.csv R/03b_create_getplotsfunction.R R/04_createfigures.R
	chmod +x R/04_createfigures.R && \
	Rscript R/04_createfigures.R

#rule for making report
report: R/01_installpackages.R clean_data/forfigure/ds2_fig.csv clean_data/fortable/all2.csv figures/%.png R/HKalvin_report.Rmd
	cd R && Rscript -e "rmarkdown::render('HKalvin_report.Rmd', output_file='../HKalvin_report.html')"


#rule for help file
.PHONY: help
help: 
	@echo "install       : check to see if necessary packages for report generation are installed in R, and install those that are missing."
	@echo "clean_data    : filter raw data to focus on race and states of interest, add in regional data"
	@echo "figures/%.png : generate breast cancer mortality figures by region"
	@echo "report        : Generate final analysis report, HKalvin_report.html"

report.html: report.Rmd code/05_render_report.R clean_data table_one figure_one run_analysis
	Rscript code/05_render_report.R

clean_data: code/01_data_cleaning.R
	Rscript code/01_data_cleaning.R
	
table_one: output/us_shp.rds output/state.rds output/nvss.rds
	Rscript code/02_make_table.R 
	
figure_one: output/us_shp.rds output/state.rds
	Rscript code/03_make_figure.R	
	
run_analysis: output/nvss.rds
	Rscript code/04_run_analysis.R

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html
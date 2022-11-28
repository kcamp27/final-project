report.html: report.Rmd code/05_render_report.R clean_data table_one figure_one run_analysis
	Rscript code/05_render_report.R

clean_data: code/01_data_cleaning.R
	Rscript code/01_data_cleaning.R
	
table_one: output/us_shp.rds output/state.rds data/nvss.rds
	Rscript code/02_make_table.R 
	
figure_one: output/us_shp.rds output/state.rds
	Rscript code/03_make_figure.R	
	
run_analysis: data/nvss.rds
	Rscript code/04_run_analysis.R

#rule to build the report inside the container	
final_report: hdp
	docker run -v "/$$(pwd)":/project hdp

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html
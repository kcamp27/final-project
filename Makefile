report.html: report.Rmd code/04_render_report.R clean_data table_one figure_one 
	Rscript code/04_render_report.R

clean_data:
	Rscript code/01_data_cleaning.R
	
table_one:
	Rscript code/02_make_table.R output/us_shp.rds output/state.rds
	
figure_one:
	Rscript code/03_make_figure.R	output/us_shp.rds output/state.rds


.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html
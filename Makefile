report.html: report.Rmd code/04_render_report.R clean_data table_one figure_one 
	Rscript code/04_render_report.R

clean_data:
	Rscript code/01_data_cleaning.R
	
table_one:
	Rscript code/02_make_table.R
	
figure_one:
	Rscript code/03_make_figure.R	


.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html
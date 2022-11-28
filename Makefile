# Report Associated Rules
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


.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html

# Project files
PROJECTFILES = report.Rmd code/05_render_report.R clean_data table_one figure_one run_analysis 
RENVFILES = renv.lock renv/activate.R renv/settings.dcf
	
#rule to build project_image
project_image: $(PROJECTFILES) $(RENVFILES) $(Dockerfile)
	docker build -t project_image .
	touch $@

#rule to run container	
final_report/report.html: project_image
	docker run -v "/$$(pwd)"/final_report:/project/final_report project_image



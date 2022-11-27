here::i_am(
  "code/04_run_analysis.R"
)

library(dplyr)
library(knitr)
library(kableExtra)


m1 <- readRDS(here::here("data", "m1.rds"))
m2 <- readRDS(here::here("data", "m2.rds"))
mlm5b <- readRDS(here::here("data", "m5.rds"))
mlm6b <- readRDS(here::here("data", "m6.rds"))
mlm7b <- readRDS(here::here("data", "m7.rds"))
mlm8b <- readRDS(here::here("data", "m8.rds"))


matrix3 <- print(m1, printToggle = FALSE, noSpaces = TRUE, test = FALSE)


#Name the rows
row.names(matrix3) <- c('Private Ins (ref: Medicaid)', 
                        'Self-pay (ref: Medicaid)')
colnames(matrix3) <- c('OR', 'Lower CI', 'Upper CI')

# Create the table
tab3 <- kable(matrix3, 
              "simple", 
              digits = 2,
              eps = 0.01,
              format.args = list(), 
              escape = FALSE,
              caption = "Table 3. Logistic Regression of Insurance Type and Prepregnancy Hypertension")


matrix4 <- print(m2, printToggle = FALSE, noSpaces = TRUE, test = FALSE)


#Name the rows
row.names(matrix4) <- c('Private Ins (ref: Medicaid)', 
                        'Self-pay (ref: Medicaid)')
colnames(matrix4) <- c('OR', 'Lower CI', 'Upper CI')

# Create the table
tab4 <- kable(matrix4, 
              "simple", 
              digits = 2,
              eps = 0.01,
              format.args = list(), 
              escape = FALSE,
              caption = "Table 3. Logistic Regression of Insurance Type and Gestational Hypertension")

saveRDS(
   tab3, 
   file = here::here("output/table3.rds")
 )
saveRDS(
  tab4, 
  file = here::here("output/table4.rds")
)


matrix5 <- print(mlm5b, printToggle = FALSE, noSpaces = TRUE, test = FALSE)
matrix6 <- print(mlm6b, printToggle = FALSE, noSpaces = TRUE, test = FALSE)
matrix7 <- print(mlm7b, printToggle = FALSE, noSpaces = TRUE, test = FALSE)
matrix8 <- print(mlm8b, printToggle = FALSE, noSpaces = TRUE, test = FALSE)

#Name the rows
row.names(matrix5) <- c('Private Ins (ref: Medicaid)', 
                        'Self-pay (ref: Medicaid)')
colnames(matrix5) <- c('OR', 'Lower CI', 'Upper CI')
#Name the rows
row.names(matrix6) <- c('Private Ins (ref: Medicaid)', 
                        'Self-pay (ref: Medicaid)')
colnames(matrix6) <- c('OR', 'Lower CI', 'Upper CI')
#Name the rows
row.names(matrix7) <- c('Private Ins (ref: Medicaid)', 
                        'Self-pay (ref: Medicaid)')
colnames(matrix7) <- c('OR', 'Lower CI', 'Upper CI')
#Name the rows
row.names(matrix8) <- c('Private Ins (ref: Medicaid)', 
                        'Self-pay (ref: Medicaid)')
colnames(matrix8) <- c('OR', 'Lower CI', 'Upper CI')

# Create the table
tab5 <- kable(matrix5, 
              "simple", 
              digits = 2,
              eps = 0.01,
              format.args = list(), 
              escape = FALSE,
              caption = "Table 5. Logistic Regression of Insurance Type and Prepregnancy Hypertension among White Mothers")
# Create the table
tab6 <- kable(matrix6, 
              "simple", 
              digits = 2,
              eps = 0.01,
              format.args = list(), 
              escape = FALSE,
              caption = "Table 6. Logistic Regression of Insurance Type and Gestational Hypertension among White Mothers")
# Create the table
tab7 <- kable(matrix7, 
              "simple", 
              digits = 2,
              eps = 0.01,
              format.args = list(), 
              escape = FALSE,
              caption = "Table 7. Logistic Regression of Insurance Type and Prepregnancy Hypertensionamong Black Mothers")
# Create the table
tab8 <- kable(matrix8, 
              "simple", 
              digits = 2,
              eps = 0.01,
              format.args = list(), 
              escape = FALSE,
              caption = "Table 8. Logistic Regression of Insurance Type and Gestational Hypertension among Black Mothers")


saveRDS(
  tab5, 
  file = here::here("output/table5.rds")
)
saveRDS(
  tab6, 
  file = here::here("output/table6.rds")
)
saveRDS(
  tab7, 
  file = here::here("output/table7.rds")
)
saveRDS(
  tab8, 
  file = here::here("output/table8.rds")
)



# nvss$pay_rec <- factor(nvss$pay_rec, levels=c(1,2,3), labels=c("Medicaid", "Private", "Self-pay"))
# nvss$mbrace <- factor(nvss$mbrace, levels=c(1,2,3,4), labels=c("White", "Black", "AI/AN", "AAPI"))
# nvss$phype <- factor(nvss$phype, levels=c(0,1), labels=c("No","Yes"))
# nvss$ghype <- factor(nvss$ghype, levels=c(0,1), labels=c("No","Yes"))
# 
# 
# var_label(nvss) <- list(
#   pay_rec="Payment Source",
#   mbrace="Maternal Race",
#   phype="Prepregnancy Hypertension",
#   ghype ="Gestational Hypertension",
#   mager="Maternal Age"
# )
# 
# mlm2 <- glm(phype ~ mager + as.factor(pay_rec), family = binomial, data = nvss)
# mlm3 <- glm(ghype ~ mager + as.factor(pay_rec), family = binomial, data = nvss)
# # 
# m1 <- exp(cbind(OR = coef(mlm2), confint(mlm2)))[-(1:2), ]
# m2 <- exp(cbind(OR = coef(mlm3), confint(mlm3)))[-(1:2), ]
# 
# #
# 
# saveRDS(
#   m1,
#   file = here::here("data/m1.rds")
# )
# 
# saveRDS(
#   m2,
#   file = here::here("data/m2.rds")
# )
# 
# 
# nvss_b <- nvss %>% filter(mbrace == 2)
# nvss_w <- nvss %>% filter(mbrace == 1)
# 
# mlm5 <- glm(phype ~ mager + as.factor(pay_rec) , family = binomial, data = nvss_w)
# mlm6 <- glm(ghype ~ mager + as.factor(pay_rec), family = binomial, data = nvss_w)
# mlm7 <- glm(phype ~ mager + as.factor(pay_rec), family = binomial, data = nvss_b)
# mlm8 <- glm(ghype ~ mager + as.factor(pay_rec), family = binomial, data = nvss_b)
# 
# 
# mlm5b <- exp(cbind(OR = coef(mlm5), confint(mlm5)))[-(1:2), ]
# mlm6b <- exp(cbind(OR = coef(mlm6), confint(mlm6)))[-(1:2), ]
# mlm7b <- exp(cbind(OR = coef(mlm7), confint(mlm7)))[-(1:2), ]
# mlm8b <- exp(cbind(OR = coef(mlm8), confint(mlm8)))[-(1:2), ]
# 
# saveRDS(
#   mlm5b,
#   file = here::here("data/m5.rds")
# )
# 
# saveRDS(
#   mlm6b,
#   file = here::here("data/m6.rds")
# )
# 
# saveRDS(
#   mlm7b,
#   file = here::here("data/m7.rds")
# )
# 
# saveRDS(
#   mlm8b,
#   file = here::here("data/m8.rds")
# )

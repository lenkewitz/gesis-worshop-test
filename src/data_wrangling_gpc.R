# Exercise


library(tidyverse)

# load data

gp_covid <- read_csv("data/ZA5667_v1-0-0_CSV_synthetic-data.csv")


corona_survey <- gp_covid %>% select(sex = sex, 
                                     risk_self = hzcy001a,
                                     risk_surroundings = hzcy002a,
                                     risk_infect_others = hzcy051a,
                                     trust_government = hzcy048a, 
                                     trust_who = hzcy051a, 
                                     trust_scientists = hzcy052a, 
                                     obey_curfew = hzcy026a, 
                                     info_nat_pub_br = hzcy084a, 
                                     info_fb = hzcy090a)

head(corona_survey)

corona_survey <- corona_survey %>% 
  mutate(obey_curfewR = recode(obey_curfew,
                            `2` = 0 # `old value` = new value
                          ))

table(corona_survey$obey_curfew, corona_survey$obey_curfewR)

corona_survey <- corona_survey %>% na_if(97) %>% na_if(98)

corona_survey_noncrit <- corona_survey %>% filter(obey_curfew != 4)


library(here)
library(tidyverse)


l2_data = read.csv(here("data", "feb_11_dat.csv"))

# compare the column idea 

most_interested_qs = c("codeswitch_rude",
                       "valuable",
                       "no_accent",
                       "become_bilingual.1",
                       "important_spanish")

directly_affected_questions = c("schools_teach",
"effort",
"become_bilingual", 
"idea",
"learn_not_abroad",
"future_career",
"connect_with_people",
"multilingualism_asset",
"acceptable_monolingualism")

semi_affected_questions = c("smarter_two_languages",
"started_younger",
"admire_multilinguals",
"like_langauges",
"interest_languages",
"like_spanish",
"like_hearing_spanish",
"communicating_spanish_speakers",
"worldview",
"boring_spanish_class",
"fun_studying_languages",
"interesting_studying_languages",
"interesting_spanish_cultures",
"beautiful")

least_affected_questions = c("excited_spanish_class",
"outside_engagement",
"spanish_favorite_class",
"difficult_classroom_learning")

ef = l2_data %>% 
  pivot_longer(cols = c(3:34), names_to = "prompt", values_to = "rating") %>% 
  mutate(question_type = case_when(
    prompt %in% directly_affected_questions ~ "directly_affected_questions",
    prompt %in% semi_affected_questions ~ "semi_affected_questions",
    prompt %in% least_affected_questions ~ "least_affected_questions",
    prompt %in% most_interested_qs ~ "most_interested_qs",
  )) %>% 
  filter(!is.na(rating))



most_int = ef %>% filter(question_type == "most_interested_qs")
dir_aff = ef %>% filter(question_type == "directly_affected_questions")
semi_eff = ef %>% filter(question_type == "semi_affected_questions")
least_aff = ef %>% filter(question_type == "least_affected_questions")
  
na_q = ef %>% filter(is.na(question_type))

unique(na_q$prompt)

unique(most_int$prompt)
unique(dir_aff$prompt)
unique(semi_eff$prompt)
unique(least_aff$prompt)


ef %>% 
  write.csv(here("data", "ratings_tidy.csv"))



most_int = ef %>% filter(question_type == "most_interested_qs")



# logistic model looking for rating of 5 vs below 5 ~ group 

### logistic model shows main effect for version when we predict picking 5 -
### about a difference in probablity of .1 

f = most_int %>% 
  mutate(rating_recode = case_when(
    rating == 5 ~ 1,
    rating < 5 ~ 0
  ))

f$version = as.factor(f$version)


null_mod = lme4::glmer(rating_recode ~ 1 + (1 | prompt) + (1 | participant_number),
               family = "binomial",
               data = f)

ver_mod = lme4::glmer(rating_recode ~ version + (1 | prompt) + (1 | participant_number),
                       family = "binomial",
                       data = f)

anova(null_mod, ver_mod)

summary(ver_mod)

#####

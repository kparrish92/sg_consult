### To be moved - Plan for the thursday material 


nppts = c(92,21,
          36,
          18,
          350,
          350,
          1297,
          1297,
          1297,
          1297,
          1297,
          1297,
          1297,
          1297,
          1297,
          1297,
          48)

nitems = c(10,
           12,
           12,
           12,
           20,
           30,
           5,
           6,
           5,
           5,
           5,
           5,
           5,
           5,
           3,
           2,
           12)

powered = c(1,1,1,1,1,1,1,1,0,0,1,1,0,1,1,1,0)

sample_data = data.frame(nppts,nitems, powered)



#### Plot the number of measuers by no of ppts 


sample_data %>% 
  ggplot(aes(x = nppts, y = nitems, color = as.factor(powered))) + geom_point() + theme_minimal() +
  ylab("Number of experimental items per condition") + xlab("Participants per group")
  
#### Run those numbers through a sim to invesigate group effects and individual effects...



###### Group level power - individual power - bias if not true   
  
###### When true effect is d = .5 in all ppts and half of ppts, and true for 1/10th ppts  

###### How many group models show and effect?


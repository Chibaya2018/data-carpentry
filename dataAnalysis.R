library(tidyverse)
select(surveys,species_id,weight)
filter(surveys,year==1995)
surveys %>%
    filter(year==1995) %>%
      select(species_id,weight)
surveys %>%
  filter(weight<5) %>%
  select(species_id,sex,weight)

exer<-surveys %>%
  select(species_id,sex,weight) %>%
  filter(weight<5)

dd<-surveys %>%
  mutate(wg = weight / 10, wh = wg * 5)

dd<-surveys %>%
  mutate(wg = weight / 10, wh = wg * 5) %>%
  head(10)

yy<-surveys %>%
  filter(!is.na(weight)) %>%
  mutate(wg=weight/10,wk=wg * 2)
#  head()

wm <-surveys %>%
  group_by(sex) %>%
  filter(!sex="") %>%
  summarise(mw=mean(weight,na.rm=TRUE))

wy<-surveys %>%
  filter(!sex=="") %>%
  filter(!is.na(weight)) %>%
  group_by(sex,species_id) %>%
  summarise(mw=mean(weight))

wz<-surveys %>%
  filter(!sex=="") %>%
  filter(!is.na(weight)) %>%
  group_by(sex,species_id) %>%
  summarise(mw=mean(weight),minw=min(weight),maxw=max(weight),medianw=median(weight))

wa<-surveys %>%
  filter(!sex=="") %>%
  count(sex,species)

wb <-surveys %>%
  filter(!sex=="") %>%
  count(sex,species) %>%
  arrange(species,desc())

wc <-surveys %>%
  filter(!sex=="") %>%
  count(sex,species) %>%
  arrange(species,n)

wd <-surveys %>%
  filter(!sex=="") %>%
  count(sex,species) %>%
  arrange(desc(n))

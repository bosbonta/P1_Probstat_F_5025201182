#1
?dgeom
dgeom(3,0.2)

rgeom(n = 10000, prob = .2)->dataNo1
mean(dataNo1 == 3)
dataNo1

library(dplyr)
library(ggplot2)

survey <- data.frame(x = 0:10,'data1' = dataNo1)
survey %>% ggplot() +
  geom_histogram(aes(x = data1,
                     y = stat(count / sum(count)),
                     fill = data1 == 3),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:20) + 
  labs(x = 'Jumlah kegagalan sebelum keberhasilan pertama kali (x)',
       y = 'Peluang',
       title = 'Peluang X = 3 gagal sebelum pertama kali sukses') 

mean(dataNo1)
var(dataNo1)

#2
?dbinom
dbinom(4,20,0.2)

data.frame(x = 0:10, prob = dbinom(x = 0:10, 20,prob = .2)) %>%
  mutate(Failures = ifelse(x == 4, 4, "bukan 4")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() + geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 4,
    vjust = 0) +
  labs(title = "Peluang 4 pasien sembuh dari 20 pasien",
       subtitle = "dengan prob=0.2",
       x = "Jumlah pasien (x) yang sembuh dari 20 pasien",
       y = "Peluang") 

n=20
p=0.2
q=0.8
mu=n*p
var=n*p*q
print(mu)
print(var)

#3
?dpois
dpois(6,4.5)

babies <- data.frame('data' = rpois(365, 4.5))
babies %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == 6),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:12) + 
  labs(x = 'jumlah bayi yang lahir',
       y = 'Peluang',
       title = 'kelahiran bayi pada 365 hari ')

mean(babies==6)
var(babies)

#4
?dchisq
dchisq(2, 10)


chiSquare <- data.frame('data4' = rchisq(100, 10))
chiSquare %>% ggplot() +
  geom_histogram(aes(x = data4,
                     y = stat(count / sum(count)),
                     fill = data4 == 2),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:20) + 
  labs(x = 'jumlah bayi yang lahir',
       y = 'Peluang',
       title = 'kelahiran bayi pada 365 hari ')

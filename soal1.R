library("Rlab")
library(ggplot2)
library(dplyr)

# Soal nomor 1a
n = 3
p = 0.20
output = dgeom(x = n, prob = p)
print(output)

#soal nomor 1b
10000->rand
m =mean(rgeom(n = rand, prob = p) == 3)
print(m)

#soal nomor 1c

# soal nomor 1d
data.frame(x = 0:5, prob = dgeom(x = 0:5, prob = p)) %>%
  mutate(Failures = ifelse(x == n, n, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Probabilitas dari x = 3 gagal sebelum sukses pertama",
       subtitle = "Distribusi Geometrik",
       x = "Kegagalan sebelum sukses pertama (x)",
       y = "Peluang") 

hist(dgeom(n, p))
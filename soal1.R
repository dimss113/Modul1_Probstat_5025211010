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
data.frame(x = seq(0, 5, by=1), prob = dgeom(x = seq(0, 5, by=1), prob = p)) %>%
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


# soal nomor 1d
# menentukan nilai rataan dan variance dari distrbusi geometrik
## rataan pada distribusi geomterik: 1/p
## variance pada distribusi geometrik: (1-p)/p^2
p <- 0.20
rataan = (1/p)
varian = ((1-p)/p^2)
print(paste("rataan: ", as.character(rataan)))
print(paste("varian: ", as.character(varian)))

# soal nomor 2a
## diketahui 20 pasien menderita covid dan peluang sembuh adalah 0.2
## terdapat 4 pasien sembuh
n = 20
p = 0.2
x = 4
print(paste("Peluang 4 pasien sembuh: ", as.character(dbinom(x, n, p))))

# soal nomor 2b
## gambarkan grafik histogram berdasarkan kasus diatas
x <- array(0:20)
plot(x, dbinom(x, n, p),
     type="h",
     main="Distribusi Binomial",
     ylab = "Probabilitas"
     )


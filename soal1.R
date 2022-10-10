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

# soal nomor 2c
## menentukan nilai rataan distribusi binomial dengan rumus n*p
n <- 20
p <- 0.2
rataan = n*p
varian = n*p*(1-p)
print(paste("rataan distribusi binomial(µ): ", rataan))
print(paste("varian distribusi binomial(s²): ", varian))
rataan = n*p


# soal nomor 3a
## menentukan peluang banyakanya 6 bayi yang lahir di rumah sakit jika rata-rata tiap hari adalah 4.5
x <- 6
lambda <- 4.5
peluang = dpois(x, lambda)
print(paste("probabilitas distribusi poisson 6 bayi lahir: ", peluang))

# soal nomor 3b
## buat histogram peluang kelahiran 6 bayi selama setahun (n=365)
set.seed(2)
n <-365
lambda <- 4.5
x <- rpois(n, lambda)
hist(x,main="Histogram Poisson Distribution",labels=T, col = "orange")

# soal nomor 3d
lambda <- 4.5
rataan = lambda
varian = lambda
print(paste("rataan distribusi poisson: ", rataan))
print(paste("varian distribusi poisson: ", varian))

# soal nomor 4a
## fungsi probabilitas distribusi Chi-Square.
x <- 2
v <- 10
print(paste("probabilitas distribusi chi-square: ", dchisq(x, v)))

# soal nomor 4b
## buatlah histogram dengan n = 100
set.seed(2)
n <- 100
v <- 10
x <- rchisq(n, v)
hist(x, main="Histogram Chi-Square Distribution", labels = T, col = "orange")

# soal nomor 4c
## menentukan rataan dan varian dari distribusi chi-square
rataan = v
varian = 2*v
print(paste("rataan distribusi chi-squre: ", rataan))
print(paste("varian distribusi chi-square: ", varian))

# soal nomor 5a
## fungsi probabilitas dari distribusi eksponensial
rate <- 3
x_dexp = seq(1, 10, by = 0.1)
y_dexp = dexp(x_dexp, rate)
plot(y_dexp)

# soal nomor 5b
## histogram dari distribusi eksponensial untuk 10, 100, 1000, dan 10000 bil random
rate <- 3
n1 <- 10
n2 <- 100
n3 <- 1000
n4 <- 10000
x1 = rexp(n1, rate)
x2 = rexp(n2, rate)
x3 = rexp(n3, rate)
x4 = rexp(n4, rate)
hist(x1, main = "Histogram Chi-Square Distribution for n = 10", labels = T, col = "lightblue")
hist(x2, main = "Histogram Chi-Square Distribution for n = 100", labels = T, col = "lightblue")
hist(x3, main = "Histogram Chi-Square Distribution for n = 1000", labels = T, col = "lightblue")
hist(x4, main = "Histogram Chi-Square Distribution for n = 10000", labels = T, col = "lightblue")


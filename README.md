# Praktikum Probabilitas Statistik Modul 1
**<br>Dimas Fadilah Akbar_5025211010**
**<br>Kelas Probstat A**

## Requirement
- R for windows
- RStudio

## Instalasi Library Rlab
- library Rlab
- library dplyr
- library ggplot
> pada praktikum ini akan menggunakan fungsi-fungsi yang tersedia pada library Rlab, dplyr, dan ggplot. Untuk itu perlu melakukan instalasi dengan mengetikkan code berikut pada console di RStudio
```
install.packages("Rlab")
install.packages("dplyr")
install.packages("ggplot2")
```

## Soal 1 (Distribusi Geometrik)

#### a) Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi  sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ?
dalam menyelesaikan soal tersebut dapat menggunakan fungsi dgeom khusus untuk distribusi geometrik
```
n = 3
p = 0.20
output = dgeom(x = n, prob = p)
print(output)
```

output:
```
0.1024
```

#### b) mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3?
> dalam menentukan distribusi geometriknya dapat menggunakan fungsi rgeom 
> dalam menentukan mean dari distribusi geometrik dapat menggunakan fungsi mean
```
rand <- 10000
p <- 0.20
m = mean(rgeom(n = rand, prob = p) == 3)
print(m)
```

output pada percobaan pertama: 
```
0.0997
```

output pada percobaan kedua:
```
0.1036
```

#### c) Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
> pada subsoal a didapatkan nilai yang konstan dan tidak berubah sedangkan pada subsoal b didapatkan nilai yang berubah-ubah. Hal tersebut menunjukkan bahwa distribusi geometrik pada a sama dan distribusi geometrik pada b acak

#### d) Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama
code:
```
library(ggplot2)
library(dplyr)

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
```
output:

![1d](documentation/1d.png)

#### e) Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.
- formula dalam menentukan rataan di distribusi geometrik adalah (1/p).
- formula dalam menentuka varian di distribusi geomtrik adalah (1-p)/p^2

code: 
```
p <- 0.20
rataan = (1/p)
varian = ((1-p)/p^2)
print(paste("rataan: ", as.character(rataan)))
print(paste("varian: ", as.character(varian)))
```
output:
```
"rataan: 5"
"varian: 20"
```

## Soal 2 (Distribusi Binomial)
### Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :

#### a) Peluang terdapat 4 pasien yang sembuh.
> Dalam menentukan peluang pada distribusi binomial dapat menggunakan fungsi dbinom dengan parameter x sebagai variable random, p sebagai peluang sukses, dan n sebagai total partisipan.

code:
```
n = 20
p = 0.2
x = 4
print(paste("Peluang 4 pasien sembuh: ", as.character(dbinom(x, n, p))))
```
output:
```
"Peluang 4 pasien sembuh:  0.218199401946101"
```

#### b) Gambarkan grafik histogram berdasarkan kasus tersebut.
> menentukan distribusi binomial dalam bentuk grafik histogram 

```
n <- 20
p <- 0.2
x <- array(0:20)
plot(x, dbinom(x, n, p),
     type="h",
     main="Distribusi Binomial",
     ylab = "Probabilitas"
     )
```

output:

![2b](documentation/2b.png)

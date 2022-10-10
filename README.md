# Praktikum Probabilitas Statistik Modul 1
**<br>Dimas Fadilah Akbar_5025201238**
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


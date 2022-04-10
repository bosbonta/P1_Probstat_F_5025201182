## Nama_NRP
| Nama             | NRP        |
|------------------|------------|
| Amsal Herbert    | 5025201182 |

## Soal 1
>Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya
- **Mencari peluang distribusi geometric dengan x = 3 dan p = 0,20**

Pada soal ini menggunakan “dgeom” yang gunanya untuk mengembalikan nilai fungsi probabilitas distribusi geometrik. Maka akan didapat probabilitas sebesar 0.1024

``` R
#1a
dgeom(x,p)
dgeom(3,0.2)
```
- **Mencari mean dengan 10.000 data random**

Pertama buat data random sebanyak n=10.000 dan prob=0,2. Dapat dibuat dengan menggunakan “rgeom” yang gunannya untuk menghasilkan daftar nilai acak yang mewakili jumlah kegagalan sebelum keberhasilan pertama

``` R
#1b
rgeom(n=10000,p=0.2)
```
dapat dilihat untuk 1000 data pertamanya

![1b](https://github.com/bosbonta/P1_Probstat_F_5025201182/blob/main/screenshoot/pic.1a.png)

isi data yang bisa ditampilkan hanya sampai 1000

lalu untuk mean kemunculan X==3 adalah 0.1017, didapatkan dengan "mean"
``` R
#1b
mean(dataNo1 == 3)
```
- **Membandingkan hasil a dan b**

Pada hasil a dan b, didapat penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi adalah 

| A     | B     |
|-------|-------|
| 0.1024| 0.1017|

Perbedaan dari hasil perhitungan data tersebut tidak signifikan, dengan persentase perbedaan hanya 0.6835%≈0.7%. Ini menandakan hasil perhitungan sebenarnya pada suatu data random nilainya akan mendekati dengan rumus peluang distribusi geometrik. Dengan syarat probabilitas berhasil sama.

- **Histogram distribusi geometrik, peluang X=3**

Untuk menampilkan histogram bisa menggunakan syntax dibawah, untuk dapat menjalankan syntax ini harus menginstall library (dplyr) dan (ggplot2) terlebih dulu

``` R
#1d
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
```

![1d](https://github.com/bosbonta/P1_Probstat_F_5025201182/blob/main/screenshoot/pic.1b.png)

Pada histogram diatas untuk data 3 memiliki probabilitas mendekati 0,1

- **Nilai rata-rata dan varian distribusi geometrik**

Untuk nilai rata-rata dari 10.000 data acak dapat dicari dengan menggunakan “mean”. Sedangkan untuk variannya didapat dengan menggunakan “var”

``` R
#1e
mean(dataNo1)
var(dataNo1)
```
untuk hasil mean yang didapat adalah sebesar 4.0089
sedangkan untuk variannya adalah sebesar 19.42616


## Soal 2
>Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2

-**Peluang terdapat 4 pasien yang sembuh**

Untuk mengerjakan soal ini dapat menggunakan “dbinom”
``` R
#2a
dbinom(4,20,0.2)
```

maka didapatkan hasilnya adalah 0.2181994

-**Gambarkan grafik histogram**

Pada soal ini menggunakan histogram, dengan syntax seperti di bawah

``` R
#2b
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
```

Bisa dilihat pada histogram di bawah bahwa, untuk probabilitas 4 pasien sembuh ada di 0.22

![2b](https://github.com/bosbonta/P1_Probstat_F_5025201182/blob/main/screenshoot/pic.2a.png)

-**Nilai rata-rata dan varians distribusi binomial**

Dapat menggunakan rumus dibawah

![1d](https://github.com/bosbonta/P1_Probstat_F_5025201182/blob/main/screenshoot/pic.2b.png)
``` R
#2c
n=20
p=0.2
q=0.8
mu=n*p
var=n*p*q
```
Maka, untuk rata-ratanya adalah 4 dan variansnya adalah 3.2

## Soal 3
>Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis
4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)

-**Peluang 6 bayi lahir dirumah sakit besok dengan rata-rata historis 4,5 bayi lahir per hari**

Untuk mendapatkan hasil peluang distribusi poison tersebut dapat menggunakan “dpois”
``` R
#3a
dpois(6,4.5)
```

maka didapat peluang distribusinya adalah sebesar 0.1281201

-**histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama setahun (n = 365)**

data randomnya didapat dengan random menggunakan “rpois” lalu untuk syntax histogramnya seperti dibawah
``` R
#3b
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
```

maka akan didapat histogram seperti gambar dibawah

![3b](https://github.com/bosbonta/P1_Probstat_F_5025201182/blob/main/screenshoot/pic.3.png)

Setelah data acak yang didapat, untuk mengetahui jumlah probabilitas pada satu hari terdapat 6 bayi lahir adalah dengan menggunakan “mean”
``` R
#3b
mean(babies==6)
```
maka akan didapatkan probabilitas suatu hari terdapat 6 bayi lahir adalah sebesar 0.1232877

-**bandingkan hasil a dan b**

dapat dilihat perbedaan dari hasil perhitungan rumus dan hasil perhitungan yang didapat dari 365 data random
| A       | B        |
|---------|----------|
|0.1281201| 0.1232877|

Perbedaan dari hasil perhitungan data tersebut tidak signifikan, dengan persentase perbedaan hanya 3.771%≈4%. Ini menandakan hasil perhitungan sebenarnya pada suatu data random nilainya akan mendekati dengan rumus peluang distribusi poissonnya. 

-**rata-rata dan varian**

Karena pada soal sudah diberitahu lambdanya, dan nilai lambda tersebut merupakan rata-rata maka untuk lambdanya adalah 4.5. sedangkan untuk varian juga merupakan nilai lambda untuk distribusi poisson, oleh karena itu nilainya juga 4.5

## Soal 4
>Diketahui nilai x = 2 dan v = 10

-**Fungsi probabilitas dari fungsi chi-square dengan x=2 dan v=10**
untuk mengetahui fungsi probabilitasnya dapat menggunakan “dchisq”

``` R
#4a
dchisq(2, 10)
```

-**Histogram dari Distribusi Chi-Square dengan 100 data random.**

data randomnya didapat dengan random menggunakan “rchisq” lalu untuk syntax histogramnya seperti dibawah
``` R
#4b
chiSquare <- data.frame('data4' = rchisq(100, 10))
chiSquare %>% ggplot() +
  geom_histogram(aes(x = data4,
                     y = stat(count / sum(count)),
                     fill = data4 == 2),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:20) + 
  labs(x = 'x',
       y = 'Peluang',
       title = 'Distribusi Chi-Square dengan 100 data random')
 ```
 
 maka akan didapat histogram seperti gambar dibawah

![4b](https://github.com/bosbonta/P1_Probstat_F_5025201182/blob/main/screenshoot/pic.4.png)

-**Nilai rata-rata dan variasi**

dalam pembuktian rumus yang ada pada link ini https://jagostat.com/teori-peluang/rataan-dan-varians-distribusi-chi-square
didapatkan bahwa 
```R
#4c
v=10
rata=v
vari=2*v
```

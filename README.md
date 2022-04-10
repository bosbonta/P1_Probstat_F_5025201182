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

![1d](https://github.com/bosbonta/P1_Probstat_F_5025201182/blob/main/screenshoot/pic.1a.png)

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
mean(dataNo1)
var(dataNo1)
```
untuk hasil mean yang didapat adalah sebesar 4.0089
sedangkan untuk variannya adalah sebesar 19.42616

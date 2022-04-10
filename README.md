## Nama_NRP
| Nama             | NRP        |
|------------------|------------|
| Amsal Herbert    | 5025201182 |

## Soal 1
>Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya
- Mencari peluang distribusi geometric dengan x = 3 dan p = 0,20

Pada soal ini menggunakan “dgeom” yang gunanya untuk mengembalikan nilai fungsi probabilitas distribusi geometrik.

``` R
#1a
dgeom(x,p)
dgeom(3,0.2)
[1]0.1024
```
- Mencari mean dengan 10.000 data random

Pertama buat data random sebanyak n=10.000 dan prob=0,2. Dapat dibuat dengan menggunakan “rgeom” yang gunannya untuk menghasilkan daftar nilai acak yang mewakili jumlah kegagalan sebelum keberhasilan pertama

``` R
#1b
rgeom(n=10000,p=0.2)
```
dapat dilihat untuk 1000 data pertamnya
![1d](https://https://github.com/bosbonta/P1_Probstat_F_5025201182/blob/main/screenshoot/pic.1a.png)

# Still Under Maintenance!!!
Saat ini aku sedang melakukan beberapa perubahan tentang Repository ini, Repo ini akan kurapikan agar step dan progress dalam Journeyku di bidang data menjadi lebih terstruktur dan rapi!
<br>
Saat ini aku sedang mencoba mengulang dari 0 pengetahuanku mengenai data. Pengulangan ini aku awali dengan mempelajari fondasi dasar dari Data, yaitu **EXCEL**. Setelah itu nanti akan dilanjutkan dengan berbagai tools lain yang biasa digunakan dalam ilmu data. Rencanaku kedepan adalah untuk fokus dalam belajar dengan menggunakan Roadmap yang aku buat, secara kasar roadmapku adalah sebagai berikut:
* ``` Belajar Excel untuk Data Analyst```
* ``` Belajar Power BI Untuk Data Analyst```
* ``` Mempelajari SQL untuk Pengolahan dan Manage Data Jumlah Besar```
* ``` Python untuk Data Analyst dan Data Scientist```
Untuk sementara fokusku hanya kesini dulu, jika tidak ada sesuatu yang mendadak hingga harus mengubah fokusku hahahaha.
<br>
Untuk perubahan yang terjadi adalah :
* ``` Pembuatan Folder-Folder yang lebih Deskriptif```
* ``` Fase akan diubah menjadi Tools dan Project```
<br>
Dengan Begini saat ada yang tertarik dan ingin membaca bagaimana Journeyku dalam Data akan bisa mendapatkan bayangan yang lebih jelas tentang bagaimana aku belajar Data. Mungkin juga dengan adanya Repository ini dapat membantu memberikan Inspirasi kepada orang lain dalam mempelajari bidang Data.


# My Journey to Become a Data Scientist
Dalam repository ini akan tersimpan bagaimana progress yang dijalankan selama Author mendalami pemahaman tentang **DATA**. <br>
Update dilakukan secara berkala dan bertahap. Tiap **Fase** dan **Tahap** akan mendalami tentang suatu topik yang berkaitan dengan **DATA**. <br>
<br>
Repository ini hanya berisikan overview projek-projek yang dilakukan oleh Author, dan melatih Author dalam membiasakan diri dalam menggunakan ```Github Repository``` dan ```Tools Git``` Lainnya. <br>
Penjelasan lebih lanjut dan mendalam untuk masing-masing **Fase** akan dibuatkan pada repo Lain. Repo ini murni hanya untuk Author mendokumentasikan perjalan dan pembelajaran yang didapatkan dari Petualangan ini.
 # ENJOY THE REPO!
## Table of Contents
* ``` Fase 1: Penguatan Fondasi Dasar```
* ``` Fase 2: TBC```
* ``` Fase 3: TBC```

## Fase 1: Penguatan Fondasi Dasar
Tujuan utama dari Fase 1 adalah agar Author bisa membiasakan diri dengan tools-tools dasar yang biasa digunakan dalam pengolahan dan manipulasi data. Tools-tools dasar yang ada pada ```Python``` seperti ```pandas```, ```seaborn```, ```numpy```, dan ```matplotlib```.
<br>
Fase 1 juga dibuatkan dipecah menjadi beberapa mini task yang bertujuan agar Author bisa lebih memahami tiap tools yang ada dari dasar.
### Tahap 1. Data Loading, Data Cleaning dan Data Understanding
Walau belum mampu melakukan pembersihan dengan benar (Author masih bingung, karena membuat Roadmap dan Task bersama GPT dan Gemini, agar Gratis hehehe), Author bisa melakukan loading data dan membuatkan ```dataframe``` untuk masing-masing kolom berdasarkan hubungan yang masih dekat. Seperti ```wilayah```, ```pos_code``` dan ```alamat```.
Selain itu Author juga berhasil menggunakan fungsi milik pandas untuk mengubah tanggal dari bentuk ```yy-mm-dd``` ke bentuk ```Month```. <br>

berikut fungsi untuk membuat kolom baru dengan value berdasarkan kolom yang sudah ada pada ```Dataframe```:
```python
df["MONTH"] = df["ORDERDATE"].dt.month_name()
```
berikut cara membuat ```Dataframe``` baru dari ```Dataframe``` yang sudah ada, dan hanya mengambil kolom yang diinginkan:
```python
wilayah = df[["TERRITORY", "COUNTRY"]]
pos_code = df["POSTALCODE"]
alamat = df[["ADDRESSLINE1", "ADDRESSLINE2"]]
```
Setelah itu, dengan menggunakan fungsi ```sum()``` dari ```pandas```, Author juga memahami cara mengolah data pada kolom yang diinginkan dari suatu ```Dataframe```. Pengolahan data dari kolom-kolom dataframe juga menjadi salah satu ilmu baru yang didapatkan Author tentang bagaimana cara memanipulasi data menggunakan ```pandas```.
Beberapa contoh manipulasi data yang dilakukan pada ```Tahap``` ini :
* Menjumlahkan nilai numerik yang ada pada suatu kolom ```Dataframe```
  ```python
  total = df["SALES"].sum()
  unit = df["QUANTITYORDERED"].sum()
  ```
  + ```total``` merupakan sebuah variable yang akan menyimpan nilai dari jumlah value yang ada pada kolom ```SALES```.
  + ```unit``` merupakan sebuah variable yang akan menyimpan nilai dari jumlah value yang ada pada kolom ```QUANTITYORDERED```
* Membuat suatu kolom baru dengan langsung melakukan perhitungan dari perbandingan value yang ada pada 2 kolom
  ```python
  df["REVENUEPERUNIT"] = df["SALES"] / df["QUANTITYORDERED"]
  ```
### Tahap 2. Visualisasi Data
Setelah mendapatkan insight tentang bagaimana data yang digunakan untuk latihan ini berbentuk dan diolah menjadi suatu data baru. Hal lain yang ada pada **Roadmap** yang telah aku buat sendiri adalah untuk visualisasi data. Visualisasi data menggunakan dua library utama yaitu ```Matplotlib``` dan ```seaborn```. ```Matplotlib``` digunakan untuk membuat plot-plot perbandingan dan trend. Sedangkan ```seaborn``` digunakan untuk membuat __boxplot__ dan __correlation heatmap__.
<br>
Visualisasi pertama yang dibuat berdasarkan data yang ada adalah visualisasi perbandingan antara total ```PRICEEACH``` dengan ```REVENUEPERUNIT```
```python
labels = ['Total PRICEEACH', 'Total REVENUEPERUNIT']
values = [total_each, total_revenue]

fig, ax = plt.subplots(figsize=(8, 5))
bars = ax.bar(labels, values, color=['skyblue', 'salmon'])
ax.set_ylabel('Jumlah Total')
ax.set_title('Perbandingan Total PRICEEACH vs REVENUEPERUNIT')
ax.bar_label(bars)
plt.show()
```
Dengan outputnya seperti ini

<img width="721" height="451" alt="image" src="https://github.com/user-attachments/assets/39a28a1e-b1c3-452c-8cf4-2f42f1c059f4" />

Setelah itu, Author juga belajar tentang penggunaan ```set_index()``` milik ```pandas``` yang berguna untuk mengolah value yang ada pada ```Dataframe```, dimana nantinya dari index baru yang sudah di set, data dalam ```Dataframe``` bisa dimanipulasi lagi untuk membuat chart baru. Penggunaan fungsi ```resample()``` yang mengambil data dari kolom yang di set sebagai index oleh ```set_index()``` juga sangat berguna. Mengambil data perbaris antara data pada index dengan kolom yang akan di ambil pada ```resample()```.
Berikut penggunaan kedua fungsi itu dalam **Tahap 2** :

```python
df.set_index("DATE").resample("W")["SALES"].sum().plot(figsize = (12, 5), title = "Weekly Sales")
```
Dengan outputnya seperti ini:

<img width="1012" height="486" alt="image" src="https://github.com/user-attachments/assets/9c518263-11c3-4624-b0d3-e600f1a2e913" />

* ```df.set_index("DATE")``` Mengambil kolom ```DATE``` dan mengubah posisinya menjadi index pada ```Dataframe```
* ```resample("W")["SALES].sum()``` mengambil total data perminggunya berdasarkan ```DATE``` dengan valuenya diambil dari total ```SALES``` yang terjadi pada minggu itu. ```"W"``` merupakan parameter yang berarti ```Week end```, terdapat beberapa parameter lainnya yang bisa dibaca pada link ini: https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.resample.html

Setelah mendapatkan hasil visualisasinya, Author mencoba agar bisa menyimpan visualisasi tersebut kedalam bentuk tabel. Tabel ini nantinya akan berisikan data ```bulan```, ```Penjualan Per Bulan``` dan ```Rata-rata Penjualan per Bulan``` tersebut.
Dengan menggunakan fungsi ```agg()``` atau aggregate dari ```pandas```, Author dapat melakukan banyak perhitungan dalam satu kali run blok code tersebut. Penggunaan fungsi ```agg()``` bisa dilihat dibawah:
```python
df_monthly = df.groupby("MONTH").resample("ME").agg(
    {
        "SALES": np.sum,
        "REVENUEPERUNIT": np.sum,
        #"ORDERDATE": lambda dates: len(set(dates)),
        "QUANTITYORDERED": np.sum,
        "PRICEEACH": np.mean
    }
).rename(
    columns = {
        "SALES": "MONTHLY_SALES",
        "REVENUEPERUNIT" : "REVENUE",
        "PRICEEACH": "MONTHLY_MEAN_PRICE"
    }
).reset_index()
```
Author membuat sebuah ```Dataframe``` baru bernama ```df_monthly```, dimana ```Dataframe``` ini berisikan 4 kolom yang didapatkan berdasarkan dari kolom yang ada pada ```df```: ```SALES```, ```REVENUEPERUNIT```, ```QUANTITYORDERED``` dan ```PRICEEACH```.<br>
Masing-masing kolom merupakan data yang didapat dari pengelompokan perbulan dengan fungsi ```df.groupby("MONTH")``` dan total valuenya didapat dari ```resample("ME")```.
Setelah melakukan perhitungan untuk tiap kolom yang ada pada ```df_monthly``` kolom-kolom tersebut namanya diubah sesuai dengan kebutuhan kita menggunakan fungsi ```.rename()```.
Hasilnya adalah sebagai berikut:
| MONTH | UNIQUEDATE_WITHSALES | MONTHLY_SALES | REVENUE | QUANTITYORDERED | MONTHLY_MEAN_PRICE |
|:---|:---|:---|:---|:---|:---|
| April | 2003-04-30 | 201609.55 | 5774.86 | 199 | 384.915690 |
| April | 2003-05-31 | 0.00 | 0.00 | 0 | NaN |
| April | 2003-06-30 | 0.00 | 0.00 | 0 | NaN |
| ... | ... | ... | ... | ... | ... |
| September | 2004-08-31 | 0.00 | 0.00 | 0 | NaN |
| September | 2004-09-30 | 320750.91 | 9521.54 | 317 | 182.847895 |


Karena data pada ```Dataframe``` masih terlihat kotor dengan value ```NaN```, kita filter data dalam ```Dataframe``` agar hanya menunjukan baris yang berisikan data saja.
Hal ini bisa kita capai dengan kode berikut:
```python
df_monthly['CHECK'] = df_monthly["MONTHLY_SALES"] == 0
df_monthly[df_monthly["CHECK"] == False].sort_values(by="UNIQUEDATE_WITHSALES", ascending=True)
```
```python
df_monthly['CHECK'] = df_monthly["MONTHLY_SALES"] == 0
```
Baris ini bertujuan untuk membuat suatu kolom baru yang melakukan pengecekan pada kolom ```MONTHLY_SALES``` dimana jika nilai pada kolom adalah ```0```, maka kolom akan bernilai ```True```. 
Kemudian pada line berikut
```python
df_monthly[df_monthly["CHECK"] == False].sort_values(by="UNIQUEDATE_WITHSALES", ascending=True)
```
Baris ini akan menampilkan data dari ```df_monthly``` yang dimana hanya data dengan kolom ```CHECK``` yang memiliki nilai ```False``` saja yang akan tampil. Setelah itu data akan diurutkan berdasarkan dengan cara ```ascending``` berdasarkan kolom ```UNIQUEDATE_WITHSALES```, ini dicapai dengan menggunakan fungsi ```sort_values``` milik ```pandas```.
Berikut hasilnya:
| MONTH     | UNIQUEDATE_WITHSALES | MONTHLY_SALES | REVENUE     | QUANTITYORDERED | MONTHLY_MEAN_PRICE | CHECK |
|-----------|----------------------|---------------|-------------|-----------------|--------------------|-------|
| January   | 2003-01-31           | 129,753.60    | 3944.95     | 1357            | 82.14              | False |
| February  | 2003-02-28           | 140,836.19    | 4066.29     | 1449            | 83.94              | False |
| March     | 2003-03-31           | 174,504.90    | 4968.66     | 1755            | 81.73              | False |
| April     | 2003-04-30           | 201,609.55    | 5774.86     | 1993            | 84.92              | False |
| May       | 2003-05-31           | 192,673.11    | 5584.06     | 2017            | 81.95              | False |
| June      | 2003-06-30           | 168,082.56    | 4612.60     | 1649            | 84.33              | False |
| July      | 2003-07-31           | 187,731.88    | 5365.62     | 1725            | 86.21              | False |
| August    | 2003-08-31           | 197,809.30    | 5696.57     | 1974            | 83.21              | False |
| September | 2003-09-30           | 263,973.36    | 8032.00     | 2510            | 84.31              | False |
| October   | 2003-10-31           | 568,290.97    | 16,387.50   | 5515            | 84.60              | False |
| November  | 2003-11-30           | 1,029,837.66  | 30,039.10   | 10,179          | 83.51              | False |
| December  | 2003-12-31           | 261,876.46    | 7293.95     | 2489            | 83.93              | False |
| January   | 2004-01-31           | 316,577.42    | 8910.30     | 3245            | 83.26              | False |
| February  | 2004-02-29           | 311,419.53    | 8661.96     | 3061            | 83.99              | False |
| March     | 2004-03-31           | 205,733.73    | 5797.90     | 1978            | 83.70              | False |
| April     | 2004-04-30           | 206,148.12    | 6185.59     | 2077            | 82.53              | False |
| May       | 2004-05-31           | 273,438.39    | 7699.60     | 2618            | 84.90              | False |
| June      | 2004-06-30           | 286,674.22    | 8198.24     | 2971            | 82.28              | False |
| July      | 2004-07-31           | 327,144.09    | 9453.50     | 3174            | 85.66              | False |
| August    | 2004-08-31           | 461,501.27    | 13,324.15   | 4564            | 83.82              | False |
| September | 2004-09-30           | 320,750.91    | 9521.54     | 3171            | 82.85              | False |
| October   | 2004-10-31           | 552,924.25    | 16,180.08   | 5483            | 83.31              | False |
| November  | 2004-11-30           | 1,089,048.01  | 30,791.34   | 10,678          | 83.96              | False |
| December  | 2004-12-31           | 372,802.66    | 10,926.59   | 3804            | 82.82              | False |
| January   | 2005-01-31           | 339,543.42    | 10,074.87   | 3395            | 84.16              | False |
| February  | 2005-02-28           | 358,186.18    | 10,146.79   | 3393            | 84.93              | False |
| March     | 2005-03-31           | 374,262.76    | 10,229.84   | 3852            | 81.69              | False |
| April     | 2005-04-30           | 261,633.29    | 5344.41     | 2634            | 81.36              | False |
| May       | 2005-05-31           | 457,861.06    | 12,360.24   | 4357            | 84.18              | False |

### Penutup Fase 1
Pada **Fase 1** banyak hal yang dapat dipelajari oleh Author. Ini merupakan sebuah fase yang membuka mata Author tentang bagaimana ```pandas``` merupakan sebuah tools yang sangat baik untuk melakukan manipulasi data.
Mulai dari **Loading**, **Cleaning** hingga dengan **Visualisasi**, ```pandas``` selalu menjadi bagian yang penting untuk membuat hal tersebut terjadi. Tidak hanya ```pandas```, library lainnya seperti ```seaborn``` dan ```matplotlib``` juga merupakan tools yang baik untuk Visualisasi data.
Fase selanjutnya adalah **Fase 1.5** karena hal selanjutnya yang author akan lakukan adalah mempelajari penggunaan dan menguasai ```MySQL```



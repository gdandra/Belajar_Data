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





# Analysis on Data Science Job Market 

## Introduction
Sebagai seorang pencari kerja di bidang Data aku masih bingung dengan apa saja keperluan yang diperlukan di bidang Data. Untuk mendapatkan insight tentang skill apa yang akan dibayar lebih tinggi sesuai dengan permintaan dari para Recruiter dan bagaimana caranya mendapatkannya.
<br>
## Pertanyaan yang akan Di Analisa
Untuk memahami bagaimana Pasar Data yang ada di Dunia, aku menanyakan beberapa pertanyaan seperti berikut:
1. Apakah dengan memiliki lebih banyak Skill akan mendapatkan gaji yang lebih tinggi?
2. Apa skill yang paling diminati oleh Pekerjaan Top di Data Scientist?
3. Apa 10 skill dengan bayaran tertinggi di bidang Data?

## Skill Excel yang Digunakan
Berikut adalah skill excel yang digunakan untuk melakukan analysis:
* 📊 Pivot Tables
* 📈 Pivot Charts
* 🧮 DAX (Data Analysis Expressions)
* 🔍 Power Query
* 💪 Power Pivot

## Data Job Dataset
Dataset yang digunakan dalam project ini berisikan data asli terkait bidang Data Science Pada tahun 2023. Dataset berasal dari Course Data Analyst milik Luke Barrouse. <br>
Dataset berisikan informasi seperti:
* 👨‍💼 Job titles
* 💰 Salaries
* 📍 Locations
* 🛠️ Skills

# 1. Apakah dengan memiliki lebih banyak Skill akan mendapatkan gaji yang lebih tinggi?
## Skill yang Digunakan: Power Querry (ETL)
### Extract
* Hal yang pertama aku lakukan adalah melakukan extract data dari dataset original (`data_salary_all.xslx`) dan membuat dua query.
  * Querry pertama dengan berisikan semua Informasi Data pekerjaan.
  * Querry kedua berisikan data dengan skill dan Job ID.

### Transform
* Lalu aku mentransform setiap querry dengan pertama mengganti tipe kolom, menghapus kolom yang tidak perlu, membersihkan text untuk menghapus kata-kata spesifik, dan menghapus whitespaces yang berlebihan.
  * data_jobs_all <br>
  <img width="317" height="337" alt="image" src="https://github.com/user-attachments/assets/def50d26-1144-44ff-aec1-665084a374d2" /> <br>
  * data_job_skills <br>
    <img width="317" height="337" alt="image" src="https://github.com/user-attachments/assets/f5edf60c-daac-45ff-9e3f-55421dde89bc" />

### Load
* Setelahnya, aku melakukan Load data querry ke Workbook. Menyiapkan data untuk analisis lebih lanjut.
  * data_jobs_all <br>
    <img width="1868" height="822" alt="image" src="https://github.com/user-attachments/assets/29353ffd-cb47-4fd2-8e7c-dc8916c0d5bc" />

  * data_jobs_skills <br>
  <img width="1869" height="819" alt="image" src="https://github.com/user-attachments/assets/1e8c7cd8-5e83-4201-bb32-0acf843b1113" />

## Analysis
### Insight
* Ada korelasi positif antara jumlah keahlian yang diminta dalam lowongan kerja dengan median gaji, terutama pada peran seperti Senior Data Engineer dan Data Scienti
* Peran yang membutuhkan lebih sedikit keahlian, seperti Business Analyst, cenderung menawarkan gaji yang lebih rendah, yang menunjukkan bahwa kumpulan keahlian yang lebih spesifik memiliki nilai pasar yang lebih tinggi.
  <br>
  <img width="742" height="457" alt="image" src="https://github.com/user-attachments/assets/e44807b3-41fd-4660-856c-ff0ac7936882" />

### Apa yang dapat Dipahami?
* Tren ini menekankan pentingnya menguasai berbagai keahlian yang relevan, terutama bagi individu yang menargetkan peran dengan gaji yang lebih tinggi.

# 2. Apa skill yang paling diminati oleh Pekerjaan Top di Data Scientist?
## Skills: PivotTables & DAX
### 📈Pivot Table
* Aku membuat PivotTable menggunakan Data Model yang telah aku buat dengan Power Querry
* Aku memindahkan `job_title_short` ke area row dan `salary_year_avg` ke area values
* Lalu aku membuat `Measure` baru untuk melakukan perhitungan `Median Salary` untuk pekerjaan di United States
  ```
  =CALCULATE(
    MEDIAN(data_jobs_all[salary_year_avg]),
    data_jobs_all[job_country] = "United States")
  ```
### DAX
* Untuk menghitung `Median Salary` aku menggunakan DAX
```
Median Salary := MEDIAN(data_jobs_all[salary_year_avg])
```
## Analysis
### Insights
* Peran pekerjaan seperti Senior Data Engineer dan Data Scientist memperoleh median gaji yang lebih tinggi baik di Amerika Serikat maupun secara internasional, yang menunjukkan tingginya permintaan global akan keahlian data tingkat tinggi.
* Kesenjangan gaji antara peran di AS dan Non-AS sangat mencolok pada pekerjaan teknologi tinggi, yang mungkin dipengaruhi oleh konsentrasi industri teknologi di Amerika Serikat.<br>
<img width="1011" height="361" alt="image" src="https://github.com/user-attachments/assets/acb1db90-af10-4301-9496-84254e6e6cbb" />

### Apa yang dapat Dipahami?
Wawasan gaji ini sangat penting untuk perencanaan dan negosiasi gaji, membantu para profesional dan perusahaan menyelaraskan penawaran mereka dengan standar pasar sambil mempertimbangkan variasi geografis.

# 3. Apa 10 skill dengan bayaran tertinggi di bidang Data?
##  Skill: Advanced Charts (Pivot Chart)
### PivotChart
* Aku membuat Combo PivotChart untuk melakukan plotting dari data Median Salary dan persentase dibutuhkannya suatu skill (%) dari PivotTableku
  * Primary Axis (Sumbu Utama): Median Salary — Ditampilkan dalam bentuk Clustered Column untuk membandingkan pendapatan antar jabatan secara jelas.
  * Secondary Axis (Sumbu Kedua): Skill Likelihood — Ditampilkan dalam bentuk Line with Markers untuk menunjukkan frekuensi keahlian yang diminta pada masing-masing peran tersebut.

## Analysis
### Insight
* Median gaji yang lebih tinggi dikaitkan dengan keahlian seperti Python, Oracle, dan SQL, yang menunjukkan peran krusial keahlian tersebut dalam pekerjaan teknologi dengan bayaran tinggi.
* Keahlian seperti PowerPoint dan Word memiliki median gaji dan probabilitas kemunculan (likelihood) terendah, yang mengindikasikan kurangnya spesialisasi dan rendahnya permintaan di sektor-sektor dengan gaji tinggi.
<br>
<img width="1011" height="361" alt="image" src="https://github.com/user-attachments/assets/24296164-9c6b-49f8-9faa-160ccfc588c7" />

## Apa yang dapat Dipahami?
* Grafik ini menonjolkan pentingnya menginvestasikan waktu untuk mempelajari keahlian bernilai tinggi seperti Python dan SQL, yang terbukti berkaitan erat dengan peran dengan gaji lebih tinggi, terutama bagi mereka yang ingin memaksimalkan pendapatan di industri teknologi.

# Kesimpulan 
Sebagai seorang antusias data dan mantan pencari kerja, saya memulai proyek berbasis Excel ini untuk mengungkap wawasan berharga mengenai pasar kerja di bidang data science. Menggunakan dataset yang saya susun dari lowongan kerja di dunia nyata, saya menganalisis berbagai aspek seperti jabatan, gaji, lokasi, dan keahlian esensial.
<br>
Dengan memanfaatkan fitur-fitur Excel seperti Power Query, PivotTables, DAX, dan grafik, saya menemukan korelasi utama antara penguasaan berbagai keahlian dengan gaji yang lebih tinggi, terutama pada penggunaan Python, SQL, dan teknologi cloud.
<br>
Saya berharap proyek ini dapat berfungsi sebagai panduan praktis bagi para profesional data dan memberikan gambaran menyeluruh tentang keahlian yang dibutuhkan untuk mencapai peran dengan gaji yang lebih tinggi.








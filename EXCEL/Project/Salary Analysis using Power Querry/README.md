# Excel Data Job Salary Dashboard

<img width="1895" height="802" alt="Salary Calculator Photo" src="https://github.com/user-attachments/assets/7a4a86c0-b7c5-4358-9d36-d9969bee87f9" />
<br>

# Introduction
Dashboard Data Job Salary ini dibuat untuk membantu menentukan gaji yang sesuai kepada para pencari kerja agar bisa menilai diri mereka secara objektif pada bidang pekerjaan mereka. <br>
Data yang saya gunakan saya dapatkan dari Course milik Luke Barrouse. Data ini sudah mengandung informasi detail seperti job_title, salaries, location dan skill yang umum diperlukan dalam bidang data. 
<br>

# DISCLAIMER !!!
Project ini merupakan project yang ada pada Course Milik Luke Barrouse. Project ini saya kerjakan dengan tujuan untuk memperdalam ilmu saya dalam bidang Data Analyst. Project ini merupakan project awal yang mengajarkan saya tentang bagaimana Excel digunakan untuk melakukan sebuah pengolahan data mentah menjadi Dashboard profesional yang rapi dan interaktif.

# Excel Skill Used
Skill excel yang digunakan dalam project ini adalah sebagai berikut:
* Chart
* Formula and Function
* Data Validation

# Data Job Dataset
Data yang digunakan dalam project ini merupakan real-world data yang dikumpulkan oleh Luke Barrouse. Pada project ini, fokus data yang digunakan adalah sebagai berikut:
* Job Title
* Salaries
* Location
* Skills

# Dashboard Build
## Data Job Salaries - Chart Bar
<img width="507" height="262" alt="Chartbar_salary Calculator" src="https://github.com/user-attachments/assets/28f50268-0a21-41ed-9ded-894fa15302d8" />
<br>

* Fitur Excel : Menggunakan fitur Bar Chart milik excel untuk memvisualisasikan perbandingan rentang gaji Data Job secara optimal
* Organisasi Data : Data diurutkan menggunakan `Descending order` untuk memperlihatkan gaji Data Job terbesar ke yang terkecil
* Insights yang Didapat : Membuat identifikasi data mana yang memberikan bayaran lebih tinggi secara cepat, seperti Pekerjaan data level senior membayar lebih tinggi dibandingkan dengan level Data Analyst seperti Data Analyst ataupun Business Analyst

## Country Median Salaries - Map Chart
<img width="611" height="297" alt="mapchart_salary Calculator" src="https://github.com/user-attachments/assets/e702f771-09c4-4ef3-af52-f8d2f11c5497" />
<br>

* Fitur Excel : Menggunakan fitur Map milik excel untuk melakukan plotting data sesuai dengan lokasinya pada peta dunia. 
* Data Representation : Melakukan plotting data Median_Salary untuk masing-masing negara yang memiliki data tersebut
* Insights yang Didapat : Memberikan gambaran tentang daerah mana yang memberikan bayaran lebih tinggi ataupun rendah secara secapat.

# Function
## Median Salary By Job Title
```
=MEDIAN(
IF(
    (jobs[job_title_short]=A2)*
    (jobs[job_country]=country)*
    (ISNUMBER(SEARCH(type,jobs[job_schedule_type])))*
    (jobs[salary_year_avg]<>0),
    jobs[salary_year_avg]
)
)
```
* Multi Criteria Filtering : Melakukan filtering untuk job title, negara, dan schedule type tiap pekerjaan serta melakukan exclude terhadap nilai blank pada salaries.
* Array Formula : menggunakan function `MEDIAN()` serta menggunakan nested `IF()` function untuk melakukan analisis pada array.
* Fungsi dari formula ini adalah untuk mengisi table dibawah dengan memberikan nilai Median Salary sesuai dengan Job Titles, negara serta schedule typenya.

## Table pada Excel
<img width="357" height="270" alt="image" src="https://github.com/user-attachments/assets/a04597ff-c78d-493f-b59b-6ce176af9a8b" />
<br>
## Implementasi pada Dashboard
<img width="526" height="610" alt="median_salary dashboard" src="https://github.com/user-attachments/assets/56abb9da-73ee-43ec-a4f1-41064d8de58e" />

## Count of Job Schedule Type
```
=FILTER(J2#,(NOT(ISNUMBER(SEARCH("and",J2#))+ISNUMBER(SEARCH(",",J2#))))*(J2#<>0))
```
* Fungsi : Formula excel ini berguna untuk melakukan filtering menggunakan `FILTER()` function yang dimana hasilnya akan melakukan exclude data yang mengandung "and" atau comma dan value bernilai nol.
* Tujuan : Formula ini bertujuan untuk mengisi table dibawah dengan list data yang berisikan schedule type secara unique.

## Table pada Excel
<img width="241" height="145" alt="image" src="https://github.com/user-attachments/assets/89309696-8f6c-43d6-a694-fa946ca2d4b5" />

## Implementasi pada Dashboard
<img width="650" height="603" alt="image" src="https://github.com/user-attachments/assets/62463ca4-bc86-48f3-b974-adb256f3fe02" />

## Data Validation
### Membuat filter list
* Membuatkan filter list pada dashboard yang berisikan validation rule untuk Job Title, Country, dan Schedule Type. Dengan adanya validation rules ini membuatkan suatu kepastian seperti:
  * Membatasi input dari user, hanya agar bisa melakukan input pada bagian yang ditentukan
  * Tidak membolehkan data yang salah atau tidak konsisten
  * Meningkatkan Usability pada Dashboard secara menyeluruh

<img width="565" height="390" alt="Data Validation" src="https://github.com/user-attachments/assets/01830d41-8343-4a60-9531-db7878aa77cc" />

# Conclusion
Saya membuat project Dashbord ini untuk memperlihatkan insight yang didapatkan dari trend yang ada pada beberapa Data Jobs yang ada diseluruh Dunia. Dengan menggunakan fitur yang ada pada Excel, membuat dashboard sederhana seperti ini dapat membantu dalam mencari tahu lebih dalam tentang pekerjaan yang berkaitan dengan data dan bagaimana sebarannya di Dunia mulai dari populasi pekerjaan hingga bayaran yang diberikan dari pekerjaan tersebut.
<br>
Project ini juga merupakan suatu project yang berguna bagi saya untuk membiasakan diri dengan Excel dan fitur-fitur didalamnya. Special Thanks Kepada Luke Barrouse untuk ilmu dan pelajaran yang diberikan dalam Excel untuk Data Analyst.

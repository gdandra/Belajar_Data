# Data Analyst Jobs Skills, Pays and Requirement Analysis
## Introduction
Dalam pasar kerja yang digerakkan oleh data saat ini, menavigasi karier sebagai Data Analyst bisa terasa seperti mencari jarum dalam tumpukan jerami. Dengan ribuan lowongan kerja dan persyaratan skill yang terus berubah, pertanyaan besar bagi setiap pencari kerja adalah: "Skill apa yang sebenarnya bernilai tinggi di mata perusahaan?"

Proyek Data Analyst Jobs Skills, Pays, and Requirement Analysis ini dirancang untuk menjawab pertanyaan tersebut secara objektif. Dengan memanfaatkan kekuatan SQL, saya melakukan eksplorasi mendalam terhadap dataset lowongan kerja untuk mengungkap korelasi antara keterampilan teknis, tingkat permintaan pasar, dan kompensasi gaji yang ditawarkan.
<br>
## Objektif
Proyek ini berfokus pada 5 pilar analisis utama:
1. Market Demand: Mengidentifikasi keterampilan yang paling sering muncul di berbagai deskripsi pekerjaan.
2. Salary Benchmarking: Membedah peran Data Analyst dengan bayaran tertinggi untuk melihat standar industri.
3. Skill-to-Salary Correlation: Menemukan keterampilan spesifik yang memberikan dampak signifikan terhadap kenaikan gaji.
4. Optimal Learning Path: Menentukan "Sweet Spot", yang merupakan kombinasi antara high demand dan high pay—untuk membantu para profesional memprioritaskan apa yang harus dipelajari selanjutnya.

Melalui analisis ini, proyek ini tidak hanya menyajikan angka, tetapi juga memberikan kompas bagi para praktisi data untuk mengambil keputusan karier yang lebih strategis dan berbasis data (data-driven).

## Skill yang digunakan
Dalam melakukan analisis pada project ini, digunakan beberapa Skills yang digunakan antara lain:
* SQL : SQL digunakan untuk melakukan penarikan data relevan dan filtering data dari dataset yang berjumlah ratus ribuan baris dengan cepat menggunakan `querry`.
* Excel : Excel digunakan untuk melakukan analisis lebih dalam dari hasil querry yang telah dilakukan di SQL. Excel sendiri digunakan beberapa fiturnya untuk membuat visualisasi menjadi menarik, seperti:
    * Power Querry
    * Pivot Table
    * Charts
## Dataset Informations
Dataset yang digunakan merupakan dataset yang dikumpulkan pada tahun 2023, dataset ini berisikan informasi terkait pekerjaan pada bidang Data Science seperti:
* Nama Perusahaan
* Nama Pekerjaan
* Rata-Rata Gaji
* Skills yang Diperlukan pada Pekerjaan terkait

# Market Demand: Mengidentifikasi keterampilan yang paling sering muncul di berbagai deskripsi pekerjaan.
Sebagai seorang yang baru mulai fokus untuk masuk kedalam dunia data, tantangan terbesar yang saya hadapi bukan pada kekurangan informasi, namun terlalu banyak informasi yang ada. Dengan adanya ratusan tools dan bahasa pemrograman yang bisa dipelajari untuk memulai data analis, seperti Python, SQL, R, hingga dengan Excel. Pertanyaannya yang muncul sekarang adalah: *Mana Skills yang harus saya prioritaskan agar relevan dengan pasar saat ini?*

Dalam analisis ini, saya tidak ingin menebak-nebak skills mana yang mungkin cocok untuk dipelajari. Saya ingin melihat apa yang sebenarnya diminta oleh perusahaan. Secara spesifik juga saya memfokuskan pencarian pada lowongan *Data Analyst* yang menawarkan posisi *Work From Home*. Mengapa ini menjadi fokus pencarian saya saat ini? Karena saat ini saya pekerjaan dengan tipe Remote Work sedang trending dan seringkali memiliki standar kompetensi teknis yang lebih ketat.

## The Strategy
Untuk menjawab ini, saya menggabungkan tiga tabel utama dari dataset saya, yaitu:
1. `job_postings_fact`: Tabel ini berisikan data tentang pekerjaan Data Analyst dan tipe lokasi kerjanya boleh remote, disini saya melalukan filtering agar data yang muncul hanya benilai sama dengan `Data Analyst` dan lokasi kerjanya `Remote`
2. `skills_dim`: Tabel ini berisikan nama skills-skills yang berkaitan dengan pekerjaan `Data Analyst`
3. `skills_job_dim` : Tabel ini berfungsi sebagai jembatan untuk menghubungkan tabel `job_postings_fact` dengan `skills_dim`. Tabel ini berisikan foreign key yang didapat dari kedua tabel sebelumnya.

Dengan menghitung frekuensi kemunculan setiap skill (COUNT), saya bisa memetakan 5 besar keterampilan yang paling krusial untuk dikuasai.
<br>
```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = true
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
```
<br>

## Visualisasi Dengan Excel
Setelah mendapatkan hasil dari querry di SQL, selanjutnya hasil tersebut di export dalam bentuk CSV dan kemudian akan diolah menggunakan Power Querry pada Excel.
Dalam power querry, perlu dilakukan sedikit cleaning agar data terlihat lebih enak saat divisualisasikan.
### Pembersihan data melalui Power Querry
<img width="326" height="315" alt="image" src="https://github.com/user-attachments/assets/50735cb7-2d6b-4b03-ba18-028d725968e4" />

### Visualisasi Top 5 Skill yang paling Dibutuhkan 
<img width="1033" height="622" alt="image" src="https://github.com/user-attachments/assets/ab37ae7b-7376-446e-ab96-c5b029b7df32" />

*Note: Kedepannya hanya akan diperlihatkan hasil Visualisasi dari excel dikarenakan hampir semua pembersihan data dari Power Querry menggunakan steps yang sama*

## Mengapa ini Penting?
Hasil dari querry ini memberikanku gambaran yang jelas. Daripada aku mempelajari semua skills yang ada secara sekaligus, querry ini membantu memberikan fokus pada 5 skills utama yang memberikan peluang terbesar untuk mendapatkan pekerjaan di remote industri data saat ini.

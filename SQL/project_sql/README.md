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

# 1. Market Demand: Mengidentifikasi keterampilan yang paling sering muncul di berbagai deskripsi pekerjaan.
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
Hasil dari querry ini memberikanku gambaran yang jelas. Daripada aku mempelajari semua skills yang ada secara sekaligus, querry ini membantu memberikan fokus pada 5 skills utama yang memberikan peluang terbesar untuk mendapatkan pekerjaan di remote industri data saat ini. Dari data yang kudapat saat ini aku harus fokus dalam mendalami pengetahuanku tentang SQL, Excel dan juga Python!

# 2. Salary Benchmarking: Membedah Top 5 Pekerjaan dengan Gaji Tertinggi
Setelah mengetahui skill apa yang paling banyak dicari, pertanyaan berikutnya yang muncul secara alami adalah: `Berapa besar apresiasi pasar terhadap peran ini?` Bagi seorang analis, memahami distribusi gaji bukan sekadar tentang angka, melainkan tentang memahami standar industri. Saya ingin mengidentifikasi posisi Data Analyst mana yang menawarkan kompensasi tertinggi secara global (Remote/'Anywhere'). Dengan melihat 5 besar pekerjaan dengan gaji tertinggi, saya bisa membedah lebih dalam: Apakah ada spesialisasi tertentu dalam judul pekerjaan tersebut? Perusahaan mana saja yang berani membayar mahal untuk talenta data?

## The Strategy
Dalam query ini, saya melakukan pembersihan data sekaligus penggabungan informasi:
1. `Data Cleaning`: Menggunakan WHERE salary_year_avg IS NOT NULL untuk memastikan hanya data yang memiliki informasi gaji valid yang dianalisis.
2. `Global Scope`: Memfokuskan pada job_location = 'Anywhere' untuk melihat standar gaji remote internasional.
3. `Entity Linking`: Melakukan LEFT JOIN dengan company_dim agar saya tidak hanya melihat angka gaji, tetapi juga mengetahui identitas perusahaan yang mempekerjakan posisi tersebut.

```sql
SELECT
    job_id,
    job_title,
    salary_year_avg,
    job_schedule_type,
    job_posted_date,
    company_dim.name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id 
WHERE 
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere' AND
    job_title_short = 'Data Analyst'
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
```
## Visualisasi menggunakan Excel
<img width="991" height="552" alt="image" src="https://github.com/user-attachments/assets/7a2b2e84-5492-45ec-bf5b-edaebbc896e2" />

*Saat ini untuk Data Analyst Remote masih menjadi top 5 Most Highest paying job!*

## Insight
Dari analisis ini aku bisa melihat bahwa rencanaku untuk menjadi seorang Data Analyst secara Remote masih menjadi pilihan yang bagus, dengan data pendukung bahwa posisi Data Analyst Remote masih berada pada Top 5 Highest Paying Data Analyst Job!

# 3. Skill-to-Salary Correlation: Bedah Skill di Balik Pekerjaan Berbayar Tinggi
Mengetahui angka gaji saja tidak cukup. Saya ingin mencari tahu apa yang membedakan kandidat "biasa" dengan mereka yang berhasil menembus angka gaji teratas. Dengan menganalisis 10 pekerjaan dengan gaji tertinggi, saya bisa memetakan apakah kunci suksesnya terletak pada kombinasi teknologi canggih (seperti Cloud atau Big Data) yang melampaui kemampuan standar industri.

## The Strategy
Untuk mendapatkan jawaban ini, saya menggunakan pendekatan CTE (Common Table Expression):
1. *CTE* (`top_paying_jobs`) : Saya mengisolasi 10 pekerjaan dengan gaji tertinggi terlebih dahulu. Ini membantu agar query tetap rapi dan performanya efisien.
2. *The Deep Dive*: Saya kemudian menghubungkan (joining) 10 pekerjaan "elit" tersebut dengan tabel keterampilan (`skills_dim`).
3. *The Goal*: Hasil akhirnya adalah daftar lengkap keterampilan yang secara langsung berkorelasi dengan angka gaji di atas rata-rata industri.

```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        job_schedule_type,
        job_posted_date,
        company_dim.name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE 
        salary_year_avg IS NOT NULL AND
        job_location = 'Anywhere' AND
        job_title_short = 'Data Analyst'
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    top_paying_jobs.salary_year_avg DESC;
```
## Visualisasi Menggunakan Excel
<img width="1651" height="734" alt="image" src="https://github.com/user-attachments/assets/f2c16c5f-deed-4565-b22a-78bac3515ee8" />

## Insight
Dari hasil visualisasi ini, aku menjadi paham suatu hal penting: dalam pasar kerja data, kualitas dan spesialisasi jauh lebih bernilai daripada sekadar kuantitas. Meskipun peran kepemimpinan seperti Associate Director mendominasi puncak gaji, posisi spesifik seperti Marketing Analyst terbukti mampu meraih kompensasi tinggi dengan jumlah skill yang jauh lebih efisien. Hal ini menegaskan bahwa strategi karier yang paling menguntungkan bukanlah menjadi "pengoleksi" alat teknis, melainkan fokus pada kedalaman domain tertentu dan tanggung jawab strategis yang memberikan dampak bisnis terbesar.

# Kesimpulan
Analisis ini bukan sekadar pengolahan data, melainkan sebuah kompas karier yang memberikan arah jelas bagi siapa pun yang ingin terjun ke industri data secara strategis. Dari eksplorasi yang telah dilakukan, dapat disimpulkan bahwa:
* _Fondasi yang Kuat adalah Kunci_: SQL, Excel, dan Python bukan lagi sekadar pilihan, melainkan "bahasa wajib" yang harus dikuasai. Data menunjukkan bahwa ketiga skill ini mendominasi permintaan pasar, terutama untuk peran Remote Data Analyst yang sedang berkembang pesat.
* _Peluang Global yang Menjanjikan_ : Bekerja secara remote (WFH) bukan hanya tentang fleksibilitas, tetapi juga tentang akses terhadap kompensasi global. Posisi Remote Data Analyst terbukti konsisten berada dalam jajaran pekerjaan dengan gaji tertinggi, membuktikan bahwa batasan geografis tidak lagi menjadi penghalang untuk mendapatkan apresiasi finansial yang layak.
* _Kualitas Mengalahkan Kuantitas_ : Menjadi seorang "jenderal" yang tahu sedikit tentang banyak hal tidak lebih menguntungkan daripada menjadi seorang "spesialis" yang mendalami domain tertentu. Hasil analisis menunjukkan bahwa gaji tertinggi diraih oleh mereka yang mampu menghubungkan keahlian teknis dengan dampak strategis bisnis (seperti pada Marketing Insights atau peran Director), bukan sekadar mereka yang menguasai daftar tools terpanjang.
* _Strategi Belajar Berbasis Data_ : Dengan temuan ini, prioritas belajar saya kini lebih terarah. Fokus utama adalah memperdalam kedalaman (depth) pada core skills (SQL & Python) sambil membangun pemahaman bisnis yang kuat untuk meningkatkan nilai tawar di pasar kerja elit.

Proyek ini membuktikan bahwa dengan pendekatan data-driven, kita bisa mengubah ketidakpastian pasar kerja menjadi sebuah strategi pertumbuhan karier yang terukur dan objektif.

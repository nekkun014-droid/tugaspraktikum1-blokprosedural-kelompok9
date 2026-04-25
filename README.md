# Tugas Praktikum 1 - Blok Prosedural Kelompok 7

## 📋 Deskripsi

Repository ini berisi tugas praktikum pertama untuk mata kuliah **Blok Prosedural** yang berfokus pada penggunaan **Stored Procedure** dalam MySQL.

## 👥 Anggota Kelompok 7

| No | Nama | NIM |
|----|------|-----|
| 1 | Farida Nur Intan | IK2411013 |
| 2 | Thizya Tri Firma | IK2411057 |
| 3 | Andi Dewa Firdaus | IK2411037 |

## 📁 Struktur File

```
├── README.md
├── Tugas_Praktikum.(01)sql.sql
├── Tugas_Praktikum.(02)sql.sql
└── Tugas_Praktikum.sql
```

## 🔧 Penjelasan Tugas_Praktikum.(02)sql.sql

File ini berisi 5 stored procedure utama:

### Bagian A - Identitas Mahasiswa
Menampilkan identitas mahasiswa dengan informasi:
- **Farida Nur Intan** (IK2411013) - Program Studi Informatika - semester 4
- **Thizya Tri Firma** (IK2411057) - Program Studi Informatika - semester 3
- **Andi Dewa Firdaus** (IK2411037) - Program Studi Informatika - semester 5

Kampus: **Mega Buana Palopo**

### Bagian B - Status Validasi
Menampilkan data validasi mahasiswa:

| Nama | Status | Beban SKS | Performa |
|------|--------|-----------|----------|
| Farida Nur Intan | Valid | Padat | Sangat Baik |
| Thizya Tri Firma | Valid | Sedang | Baik |
| Andi Dewa Firdaus | Tidak Valid | Padat | Perlu Pembinaan |

### Bagian C - Validasi Data Lengkap
Data mahasiswa yang divalidasi:

| Nama | NIM | Semester | Prodi | SKS | IPK | UKT |
|------|-----|----------|-------|-----|-----|-----|
| Farida Nur Intan | IK2411013 | 4 | Informatika | 21 | 3.80 | BELUM |
| Thizya | IK2411057 | 4 | Informatika | 18 | 3.40 | LUNAS |
| Andi | IK2411037 | 4 | Informatika | 10 | 2.40 | BELUM |

**Logika Validasi:**
- **Status KRS**: Valid jika UKT='LUNAS' DAN semester>0 DAN SKS>0
- **Kategori Beban SKS**:
  - ≤ 12 SKS = Ringan
  - 13-18 SKS = Sedang
  - > 18 SKS = Padat
- **Kategori IPK**:
  - ≥ 3.50 = Sangat Baik
  - ≥ 3.00 = Baik
  - ≥ 2.50 = Cukup
  - < 2.50 = Perlu Pembinaan

### Bagian D - Pemeringkatan IPK
Menampilkan ranking mahasiswa berdasarkan IPK:

| Rank | Nama | NIM | IPK |
|------|------|-----|-----|
| 1 | Farida Nur Intan | IK2411013 | 3.90 |
| 2 | Thizya | IK2411057 | 3.80 |
| 3 | Andi | IK2411037 | 3.40 |

**Mahasiswa Terbaik**: Farida Nur Intan (IPK 3.90)

### Procedure Tambahan - validasi_data_mahasiswa_3
Prosedur tambahan dengan data berbeda:

| Nama | NIM | Semester | SKS | IPK | UKT |
|------|-----|----------|-----|-----|-----|
| Andi Dewa | IK2411037 | 3 | 22 | 3.45 | Lunas |
| Thizya Tri | IK2411057 | 2 | 18 | 2.40 | Belum Lunas |
| Farida | IK2411013 | 4 | 24 | 3.80 | Lunas |

## 🚀 Cara Menjalankan

1. Buka MySQL (via XAMPP/phpMyAdmin)
2. Import file `Tugas_Praktikum.(02)sql.sql`
3. Panggil procedure yang diinginkan:

```sql
-- Untuk Bagian A
CALL bagian_a();

-- Untuk Bagian B
CALL bagian_b();

-- Untuk Bagian C
CALL bagian_c();

-- Untuk Bagian D
CALL bagian_d();

-- Untuk Procedure Tambahan
CALL validasi_data_mahasiswa_3();
```

## 📚 Konsep yang Dipelajari

- ✅ `DECLARE` - Deklarasi variabel dalam MySQL
- ✅ `IF` condition - Kondisi tunggal dan nested
- ✅ `UNION ALL` - Menggabungkan hasil dari multiple SELECT
- ✅ `CONCAT` - Manipulasi string
- ✅ `CREATE PROCEDURE` - Membuat stored procedure
- ✅ `DELIMITER` - Mengubah delimiter untuk procedure
- ✅ `SET` - Menetapkan nilai ke variabel

---
*Dibuat untuk Tugas Praktikum Blok Prosedural - Semester 4*

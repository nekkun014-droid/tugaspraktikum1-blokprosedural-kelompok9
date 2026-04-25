-- =========================
-- BAGIAN A
-- =========================
DROP PROCEDURE IF EXISTS bagian_a;
DELIMITER $$

CREATE PROCEDURE bagian_a()
BEGIN
    DECLARE v_prodi VARCHAR(50) DEFAULT 'Informatika';
    DECLARE v_kampus VARCHAR(50) DEFAULT 'Mega Buana Palopo';

    SELECT CONCAT(
        'Mahasiswa Farida Nur Intan (IK2411013) dari Program Studi ',
        v_prodi, ' terdaftar di ', v_kampus, ' pada semester 4.'
    ) AS Identitas

    UNION ALL

    SELECT CONCAT(
        'Mahasiswa Thizya Tri Firma (IK2411057) dari Program Studi ',
        v_prodi, ' terdaftar di ', v_kampus, ' pada semester 3.'
    )

    UNION ALL

    SELECT CONCAT(
        'Mahasiswa Andi Dewa Firdaus (IK2411037) dari Program Studi ',
        v_prodi, ' terdaftar di ', v_kampus, ' pada semester 5.'
    );
END $$

DELIMITER ;

-- =========================
-- BAGIAN B
-- =========================
DROP PROCEDURE IF EXISTS bagian_b;
DELIMITER $$

CREATE PROCEDURE bagian_b()
BEGIN
    SELECT 
        'Farida Nur Intan' AS Nama,
        'Valid' AS Status,
        'Padat' AS Beban,
        'Sangat Baik' AS Performa

    UNION ALL

    SELECT 
        'Thizya Tri Firma',
        'Valid',
        'Sedang',
        'Baik'

    UNION ALL

    SELECT 
        'Andi Dewa Firdaus',
        'Tidak Valid',
        'Padat',
        'Perlu Pembinaan';
END $$

DELIMITER ;

-- =========================
-- BAGIAN C
-- =========================
DROP PROCEDURE IF EXISTS bagian_c;
DELIMITER $$

CREATE PROCEDURE bagian_c()
BEGIN
    DECLARE nama1 VARCHAR(50) DEFAULT 'Farida Nur Intan';
    DECLARE nim1 VARCHAR(20) DEFAULT 'IK2411013';
    DECLARE smt1 INT DEFAULT 4;
    DECLARE prodi1 VARCHAR(50) DEFAULT 'Informatika';
    DECLARE sks1 INT DEFAULT 21;
    DECLARE ipk1 DECIMAL(3,2) DEFAULT 3.80;
    DECLARE ukt1 VARCHAR(10) DEFAULT 'BELUM';

    DECLARE nama2 VARCHAR(50) DEFAULT 'Thizya';
    DECLARE nim2 VARCHAR(20) DEFAULT 'IK2411057';
    DECLARE smt2 INT DEFAULT 4;
    DECLARE prodi2 VARCHAR(50) DEFAULT 'Informatika';
    DECLARE sks2 INT DEFAULT 18;
    DECLARE ipk2 DECIMAL(3,2) DEFAULT 3.40;
    DECLARE ukt2 VARCHAR(10) DEFAULT 'LUNAS';

    DECLARE nama3 VARCHAR(50) DEFAULT 'Andi';
    DECLARE nim3 VARCHAR(20) DEFAULT 'IK2411037';
    DECLARE smt3 INT DEFAULT 4;
    DECLARE prodi3 VARCHAR(50) DEFAULT 'Informatika';
    DECLARE sks3 INT DEFAULT 10;
    DECLARE ipk3 DECIMAL(3,2) DEFAULT 2.40;
    DECLARE ukt3 VARCHAR(10) DEFAULT 'BELUM';

    DECLARE status1, status2, status3 VARCHAR(30);
    DECLARE beban1, beban2, beban3 VARCHAR(30);
    DECLARE perf1, perf2, perf3 VARCHAR(30);
    DECLARE alasan1, alasan2, alasan3 VARCHAR(100);

    -- Mahasiswa 1
    SET status1 = IF(ukt1='LUNAS' AND smt1>0 AND sks1>0,'Valid','Tidak Valid');
    SET alasan1 = IF(status1='Valid',
        'UKT lunas, semester aktif, dan SKS memenuhi syarat',
        'Salah satu syarat tidak terpenuhi');
    SET beban1 = IF(sks1<=12,'Ringan',IF(sks1<=18,'Sedang','Padat'));
    SET perf1 = IF(ipk1>=3.50,'Sangat Baik',
        IF(ipk1>=3.00,'Baik',
        IF(ipk1>=2.50,'Cukup','Perlu Pembinaan')));

    -- Mahasiswa 2
    SET status2 = IF(ukt2='LUNAS' AND smt2>0 AND sks2>0,'Valid','Tidak Valid');
    SET alasan2 = IF(status2='Valid',
        'UKT lunas, semester aktif, dan SKS memenuhi syarat',
        'Salah satu syarat tidak terpenuhi');
    SET beban2 = IF(sks2<=12,'Ringan',IF(sks2<=18,'Sedang','Padat'));
    SET perf2 = IF(ipk2>=3.50,'Sangat Baik',
        IF(ipk2>=3.00,'Baik',
        IF(ipk2>=2.50,'Cukup','Perlu Pembinaan')));

    -- Mahasiswa 3
    SET status3 = IF(ukt3='LUNAS' AND smt3>0 AND sks3>0,'Valid','Tidak Valid');
    SET alasan3 = IF(status3='Valid',
        'UKT lunas, semester aktif, dan SKS memenuhi syarat',
        'Salah satu syarat tidak terpenuhi');
    SET beban3 = IF(sks3<=12,'Ringan',IF(sks3<=18,'Sedang','Padat'));
    SET perf3 = IF(ipk3>=3.50,'Sangat Baik',
        IF(ipk3>=3.00,'Baik',
        IF(ipk3>=2.50,'Cukup','Perlu Pembinaan')));

    SELECT nama1, nim1, prodi1, smt1, status1, beban1, perf1, alasan1
    UNION ALL
    SELECT nama2, nim2, prodi2, smt2, status2, beban2, perf2, alasan2
    UNION ALL
    SELECT nama3, nim3, prodi3, smt3, status3, beban3, perf3, alasan3;
END $$

DELIMITER ;

-- =========================
-- BAGIAN D
-- =========================
DROP PROCEDURE IF EXISTS bagian_d;
DELIMITER $$

CREATE PROCEDURE bagian_d()
BEGIN
    SELECT 
        'Thizya' AS Nama, 'IK2411057' AS NIM, 3.80 AS IPK
    UNION ALL
    SELECT 
        'Andi', 'IK2411037', 3.40
    UNION ALL
    SELECT 
        'Farida Nur Intan', 'IK2411013', 3.90;

    SELECT 'Mahasiswa terbaik: Farida Nur Intan (IPK 3.90)' AS Kesimpulan;
END $$

DELIMITER ;

DROP PROCEDURE IF EXISTS validasi_data_mahasiswa_3;
DELIMITER $$

CREATE PROCEDURE validasi_data_mahasiswa_3()
BEGIN
    -- =========================
    -- DATA MAHASISWA
    -- =========================
    DECLARE nama1 VARCHAR(50) DEFAULT 'Andi Dewa';
    DECLARE nim1 VARCHAR(20) DEFAULT '2310112345';
    DECLARE smt1 INT DEFAULT 3;
    DECLARE sks1 INT DEFAULT 22;
    DECLARE ipk1 DECIMAL(3,2) DEFAULT 3.45;
    DECLARE ukt1 VARCHAR(15) DEFAULT 'Lunas';

    DECLARE nama2 VARCHAR(50) DEFAULT 'Thizya Tri';
    DECLARE nim2 VARCHAR(20) DEFAULT '2310112346';
    DECLARE smt2 INT DEFAULT 2;
    DECLARE sks2 INT DEFAULT 18;
    DECLARE ipk2 DECIMAL(3,2) DEFAULT 2.40;
    DECLARE ukt2 VARCHAR(15) DEFAULT 'Belum Lunas';

    DECLARE nama3 VARCHAR(50) DEFAULT 'Farida';
    DECLARE nim3 VARCHAR(20) DEFAULT '2310112347';
    DECLARE smt3 INT DEFAULT 4;
    DECLARE sks3 INT DEFAULT 24;
    DECLARE ipk3 DECIMAL(3,2) DEFAULT 3.80;
    DECLARE ukt3 VARCHAR(15) DEFAULT 'Lunas';

    -- =========================
    -- VARIABEL HASIL
    -- =========================
    DECLARE status_krs1, status_krs2, status_krs3 VARCHAR(20);
    DECLARE kategori_sks1, kategori_sks2, kategori_sks3 VARCHAR(20);
    DECLARE kategori_ipk1, kategori_ipk2, kategori_ipk3 VARCHAR(20);
    DECLARE kesimpulan1, kesimpulan2, kesimpulan3 VARCHAR(20);

    -- =========================
    -- LOGIKA MAHASISWA 1
    -- =========================
    SET status_krs1 = IF(ukt1='Lunas','Boleh KRS','Tidak Bisa KRS');
    SET kategori_sks1 = IF(sks1<=12,'Ringan',IF(sks1<=18,'Sedang','Berat'));
    SET kategori_ipk1 = IF(ipk1>=3.50,'Sangat Baik',
                        IF(ipk1>=3.00,'Baik',
                        IF(ipk1>=2.50,'Cukup','Perlu Perbaikan')));
    SET kesimpulan1 = IF(ukt1='Lunas','Layak KRS','Tidak Layak');

    -- =========================
    -- LOGIKA MAHASISWA 2
    -- =========================
    SET status_krs2 = IF(ukt2='Lunas','Boleh KRS','Tidak Bisa KRS');
    SET kategori_sks2 = IF(sks2<=12,'Ringan',IF(sks2<=18,'Sedang','Berat'));
    SET kategori_ipk2 = IF(ipk2>=3.50,'Sangat Baik',
                        IF(ipk2>=3.00,'Baik',
                        IF(ipk2>=2.50,'Cukup','Perlu Perbaikan')));
    SET kesimpulan2 = IF(ukt2='Lunas','Layak KRS','Tidak Layak');

    -- =========================
    -- LOGIKA MAHASISWA 3
    -- =========================
    SET status_krs3 = IF(ukt3='Lunas','Boleh KRS','Tidak Bisa KRS');
    SET kategori_sks3 = IF(sks3<=12,'Ringan',IF(sks3<=18,'Sedang','Berat'));
    SET kategori_ipk3 = IF(ipk3>=3.50,'Sangat Baik',
                        IF(ipk3>=3.00,'Baik',
                        IF(ipk3>=2.50,'Cukup','Perlu Perbaikan')));
    SET kesimpulan3 = IF(ukt3='Lunas','Layak KRS','Tidak Layak');

    -- =========================
    -- OUTPUT
    -- =========================
    SELECT 
        nama1 AS Nama, nim1 AS NIM, smt1 AS Semester, sks1 AS SKS, ipk1 AS IPK,
        ukt1 AS Status_UKT, status_krs1 AS Status_KRS,
        kategori_sks1 AS Kategori_SKS, kategori_ipk1 AS Kategori_IPK,
        kesimpulan1 AS Kesimpulan

    UNION ALL

    SELECT 
        nama2, nim2, smt2, sks2, ipk2,
        ukt2, status_krs2,
        kategori_sks2, kategori_ipk2,
        kesimpulan2

    UNION ALL

    SELECT 
        nama3, nim3, smt3, sks3, ipk3,
        ukt3, status_krs3,
        kategori_sks3, kategori_ipk3,
        kesimpulan3;

END $$

DELIMITER ;
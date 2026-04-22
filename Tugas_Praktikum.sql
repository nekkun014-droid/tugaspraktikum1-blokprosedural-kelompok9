DROP PROCEDURE IF EXISTS BagianA_Otomatis;

DELIMITER //

CREATE PROCEDURE BagianA()
BEGIN
    /* 1. Deklarasi Variabel */
    DECLARE v_nama1, v_nama2, v_nama3 VARCHAR(50);
    DECLARE v_nim1, v_nim2, v_nim3 VARCHAR(20);
    DECLARE v_sem1, v_sem2, v_sem3 INT;
    DECLARE v_prodi VARCHAR(50);

    /* 2. Pengisian Data */
    SET @NAMA_KAMPUS := 'Mega Buana Palopo';
    SET v_prodi = 'Informatika';
    
    SET v_nama1 = 'Farida Nur Intan', v_nim1 = 'IK2411013', v_sem1 = 4;
    SET v_nama2 = 'Thizya Tri Firma', v_nim2 = 'IK2411057', v_sem2 = 3;
    SET v_nama3 = 'Andi Dewa Firdaus', v_nim3 = 'IK241137', v_sem3 = 5;

    /* 3. Menampilkan Hasil dengan CAST untuk menghindari Collation Error */
    SELECT CAST(CONCAT('Mahasiswa ', v_nama1, ' (', v_nim1, ') dari Program Studi ', 
                  v_prodi, ' terdaftar di ', @NAMA_KAMPUS, ' pada semester ', v_sem1, '.') AS CHAR) AS Identitas_Mahasiswa
    UNION ALL
    SELECT CAST(CONCAT('Mahasiswa ', v_nama2, ' (', v_nim2, ') dari Program Studi ', 
                  v_prodi, ' terdaftar di ', @NAMA_KAMPUS, ' pada semester ', v_sem2, '.') AS CHAR)
    UNION ALL
    SELECT CAST(CONCAT('Mahasiswa ', v_nama3, ' (', v_nim3, ') dari Program Studi ', 
                  v_prodi, ' terdaftar di ', @NAMA_KAMPUS, ' pada semester ', v_sem3, '.') AS CHAR);
END //

DELIMITER ;

/* 4. Cara Menjalankan */
CALL BagianA();
DELIMITER //

CREATE PROCEDURE BagianB()
BEGIN
    /* Deklarasi Variabel untuk 3 Mahasiswa */
    DECLARE v_nama1, v_nama2, v_nama3 VARCHAR(50);
    DECLARE v_sks1, v_sks2, v_sks3 INT;
    DECLARE v_ipk1, v_ipk2, v_ipk3 DECIMAL(3,2);
    DECLARE v_ukt1, v_ukt2, v_ukt3 VARCHAR(20);

    /* Pengisian Data Manual di Dalam Kode */
    SET v_nama1 = 'Farida Nur Intan', v_sks1 = 20, v_ipk1 = 3.80, v_ukt1 = 'LUNAS';
    SET v_nama2 = 'Thizya Tri Firma', v_sks2 = 18, v_ipk2 = 3.45, v_ukt2 = 'LUNAS';
    SET v_nama3 = 'Andi Dewa Firdaus', v_sks3 = 22, v_ipk3 = 2.40, v_ukt3 = 'BELUM LUNAS';

    /* Output Hasil Validasi dalam satu tabel */
    SELECT v_nama1 AS Nama, 
           IF(v_ukt1='LUNAS' AND v_ipk1 > 0, 'Valid', 'Tidak Valid') AS Status_Data,
           CASE WHEN v_sks1 <= 12 THEN 'Ringan' WHEN v_sks1 <= 18 THEN 'Sedang' ELSE 'Padat' END AS Beban,
           CASE WHEN v_ipk1 >= 3.5 THEN 'Sangat Baik' WHEN v_ipk1 >= 3.0 THEN 'Baik' ELSE 'Perlu Pembinaan' END AS Performa
    UNION ALL
    SELECT v_nama2, IF(v_ukt2='LUNAS', 'Valid', 'Tidak Valid'),
           CASE WHEN v_sks2 <= 12 THEN 'Ringan' WHEN v_sks2 <= 18 THEN 'Sedang' ELSE 'Padat' END,
           CASE WHEN v_ipk2 >= 3.5 THEN 'Sangat Baik' WHEN v_ipk2 >= 3.0 THEN 'Baik' ELSE 'Perlu Pembinaan' END
    UNION ALL
    SELECT v_nama3, IF(v_ukt3='LUNAS', 'Valid', 'Tidak Valid'),
           CASE WHEN v_sks3 <= 12 THEN 'Ringan' WHEN v_sks3 <= 18 THEN 'Sedang' ELSE 'Padat' END,
           CASE WHEN v_ipk3 >= 3.5 THEN 'Sangat Baik' WHEN v_ipk3 >= 3.0 THEN 'Baik' ELSE 'Perlu Pembinaan' END;
END //
DELIMITER ;

CALL BagianB();
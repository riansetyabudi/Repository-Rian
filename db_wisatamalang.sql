-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 05:00 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_wisatamalang`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_alternatif_wisata`
--

CREATE TABLE `tb_alternatif_wisata` (
  `id_AlternatifWisata` varchar(7) NOT NULL,
  `id_Pengunjung` varchar(7) NOT NULL,
  `Nama_Wisata` varchar(30) NOT NULL,
  `Alamat_wisata` varchar(30) NOT NULL,
  `Kategori` varchar(30) NOT NULL,
  `Harga_Tiket_Masuk` int(30) NOT NULL,
  `Fasilitas` varchar(30) NOT NULL,
  `Rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bobot kriteria`
--

CREATE TABLE `tb_bobot kriteria` (
  `id_BobotKriteria` varchar(7) NOT NULL,
  `Nama_Kriteria` varchar(30) NOT NULL,
  `Bobot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_hasilkeputusan`
--

CREATE TABLE `tb_hasilkeputusan` (
  `id_HasilKeputusan` varchar(7) NOT NULL,
  `id_AlternatifWisata` varchar(7) NOT NULL,
  `Nama_Wisata` varchar(30) NOT NULL,
  `Alamat` varchar(30) NOT NULL,
  `Kategori` varchar(10) NOT NULL,
  `Harga_Tiket_Masuk` int(20) NOT NULL,
  `Fasilitas` int(10) NOT NULL,
  `Rating` float NOT NULL,
  `Nilai_Preferensi` float NOT NULL,
  `Peringkat` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_nilaikriteria`
--

CREATE TABLE `tb_nilaikriteria` (
  `id_NilaiKriteria` varchar(7) NOT NULL,
  `id_AlternatifWisata` varchar(7) NOT NULL,
  `Nama_Kriteria` varchar(30) NOT NULL,
  `Nilai` float NOT NULL,
  `Normalisasi` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_normalisasi`
--

CREATE TABLE `tb_normalisasi` (
  `id_Normalisasi` varchar(7) NOT NULL,
  `id_AlternatifWisata` varchar(7) NOT NULL,
  `Nama_Wisata` varchar(30) NOT NULL,
  `Jumlah_Pengunjung` float NOT NULL,
  `Fasilitas` float NOT NULL,
  `Harga_Tiket_Masuk` float NOT NULL,
  `Rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengunjung`
--

CREATE TABLE `tb_pengunjung` (
  `id_Pengunjung` varchar(7) NOT NULL,
  `id_AlternatifWisata` varchar(7) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `No_HP` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penilaianpreferensi`
--

CREATE TABLE `tb_penilaianpreferensi` (
  `id_PenilaianPreferensi` varchar(7) NOT NULL,
  `id_AlternatifWisata` varchar(7) NOT NULL,
  `Nama_Wisata` varchar(30) NOT NULL,
  `Nilai_Preferensi` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_perangkingan`
--

CREATE TABLE `tb_perangkingan` (
  `id_Perangkingan` varchar(7) NOT NULL,
  `id_AlternatifWisata` varchar(7) NOT NULL,
  `Nama_Wisata` varchar(30) NOT NULL,
  `Nilai_Preferensi` float NOT NULL,
  `Peringkat` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_alternatif_wisata`
--
ALTER TABLE `tb_alternatif_wisata`
  ADD PRIMARY KEY (`id_AlternatifWisata`),
  ADD KEY `id_Pengunjung` (`id_Pengunjung`);

--
-- Indexes for table `tb_bobot kriteria`
--
ALTER TABLE `tb_bobot kriteria`
  ADD PRIMARY KEY (`id_BobotKriteria`);

--
-- Indexes for table `tb_hasilkeputusan`
--
ALTER TABLE `tb_hasilkeputusan`
  ADD PRIMARY KEY (`id_HasilKeputusan`),
  ADD KEY `id_AlternatifWisata` (`id_AlternatifWisata`);

--
-- Indexes for table `tb_nilaikriteria`
--
ALTER TABLE `tb_nilaikriteria`
  ADD PRIMARY KEY (`id_NilaiKriteria`),
  ADD KEY `id_AlternatifWisata` (`id_AlternatifWisata`);

--
-- Indexes for table `tb_normalisasi`
--
ALTER TABLE `tb_normalisasi`
  ADD PRIMARY KEY (`id_Normalisasi`),
  ADD KEY `id_AlternatifWisata` (`id_AlternatifWisata`);

--
-- Indexes for table `tb_pengunjung`
--
ALTER TABLE `tb_pengunjung`
  ADD PRIMARY KEY (`id_Pengunjung`),
  ADD KEY `id_AlternatifWisata` (`id_AlternatifWisata`);

--
-- Indexes for table `tb_penilaianpreferensi`
--
ALTER TABLE `tb_penilaianpreferensi`
  ADD PRIMARY KEY (`id_PenilaianPreferensi`),
  ADD KEY `id_AlternatifWisata` (`id_AlternatifWisata`);

--
-- Indexes for table `tb_perangkingan`
--
ALTER TABLE `tb_perangkingan`
  ADD PRIMARY KEY (`id_Perangkingan`),
  ADD KEY `Id_BobotKriteria` (`id_AlternatifWisata`),
  ADD KEY `Id_BobotKriteria_2` (`id_AlternatifWisata`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_alternatif_wisata`
--
ALTER TABLE `tb_alternatif_wisata`
  ADD CONSTRAINT `tb_alternatif_wisata_ibfk_1` FOREIGN KEY (`id_Pengunjung`) REFERENCES `tb_pengunjung` (`id_Pengunjung`);

--
-- Constraints for table `tb_hasilkeputusan`
--
ALTER TABLE `tb_hasilkeputusan`
  ADD CONSTRAINT `tb_hasilkeputusan_ibfk_1` FOREIGN KEY (`id_AlternatifWisata`) REFERENCES `tb_alternatif_wisata` (`id_AlternatifWisata`);

--
-- Constraints for table `tb_nilaikriteria`
--
ALTER TABLE `tb_nilaikriteria`
  ADD CONSTRAINT `tb_nilaikriteria_ibfk_1` FOREIGN KEY (`id_AlternatifWisata`) REFERENCES `tb_alternatif_wisata` (`id_AlternatifWisata`);

--
-- Constraints for table `tb_normalisasi`
--
ALTER TABLE `tb_normalisasi`
  ADD CONSTRAINT `tb_normalisasi_ibfk_1` FOREIGN KEY (`id_AlternatifWisata`) REFERENCES `tb_alternatif_wisata` (`id_AlternatifWisata`);

--
-- Constraints for table `tb_pengunjung`
--
ALTER TABLE `tb_pengunjung`
  ADD CONSTRAINT `tb_pengunjung_ibfk_1` FOREIGN KEY (`id_AlternatifWisata`) REFERENCES `tb_alternatif_wisata` (`id_AlternatifWisata`);

--
-- Constraints for table `tb_penilaianpreferensi`
--
ALTER TABLE `tb_penilaianpreferensi`
  ADD CONSTRAINT `tb_penilaianpreferensi_ibfk_1` FOREIGN KEY (`id_AlternatifWisata`) REFERENCES `tb_alternatif_wisata` (`id_AlternatifWisata`);

--
-- Constraints for table `tb_perangkingan`
--
ALTER TABLE `tb_perangkingan`
  ADD CONSTRAINT `tb_perangkingan_ibfk_1` FOREIGN KEY (`id_AlternatifWisata`) REFERENCES `tb_alternatif_wisata` (`id_AlternatifWisata`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

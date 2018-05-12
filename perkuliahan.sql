-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2018 at 02:24 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perkuliahan`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nama_dosen` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama_dosen`) VALUES
(220, 'DANIND'),
(229, 'SAPUTRI'),
(245, 'KARINA'),
(246, 'AYU'),
(292, 'ASTARINA');

-- --------------------------------------------------------

--
-- Table structure for table `dosen_has_matakuliah`
--

CREATE TABLE `dosen_has_matakuliah` (
  `kode_mkFK` varchar(20) NOT NULL,
  `id_dosenFK` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen_has_matakuliah`
--

INSERT INTO `dosen_has_matakuliah` (`kode_mkFK`, `id_dosenFK`) VALUES
('ALSD4', 292),
('BINDO4', 246),
('JK4', 220),
('LGH4', 292),
('RPL4', 229),
('SBD4', 245);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim_mhs` varchar(10) NOT NULL,
  `nama_mhs` varchar(45) NOT NULL,
  `alamat_mhs` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim_mhs`, `nama_mhs`, `alamat_mhs`) VALUES
('L200110000', 'ELZA', 'YKT'),
('L200120000', 'ANNOR', 'JKT'),
('L200130000', 'YESS', 'SBY'),
('L200140000', 'AYA', 'KRA'),
('L200150000', 'budi', 'solo'),
('L200160000', 'DIND', 'YGK'),
('L200170000', 'DWIR', 'MLG');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_has_dosen`
--

CREATE TABLE `mahasiswa_has_dosen` (
  `nim_mhsFK` varchar(10) NOT NULL,
  `id_dosenFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_has_matakuliah`
--

CREATE TABLE `mahasiswa_has_matakuliah` (
  `nim_mhsFK` varchar(10) NOT NULL,
  `kode_mkFK` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa_has_matakuliah`
--

INSERT INTO `mahasiswa_has_matakuliah` (`nim_mhsFK`, `kode_mkFK`) VALUES
('L200110000', 'RPL4'),
('L200120000', 'ALSD4'),
('L200120000', 'JK4'),
('L200140000', 'ALSD4'),
('L200150000', 'SBD4'),
('L200160000', 'LGH4'),
('L200160000', 'RPL4'),
('L200170000', 'SBD4');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_mk` varchar(20) NOT NULL,
  `nama_mk` varchar(45) NOT NULL,
  `waktu_mk` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_mk`, `nama_mk`, `waktu_mk`) VALUES
('ALSD4', 'Algoritma Struktur Data', '0000-00-00 00:00:00'),
('BINDO4', 'Bahasa Indonesia', '0000-00-00 00:00:00'),
('JK4', 'Jaringan Komputer', '0000-00-00 00:00:00'),
('LGH4', 'Logika Himpunan', '0000-00-00 00:00:00'),
('RPL4', 'Rekayasa Perangkat Lunak', '0000-00-00 00:00:00'),
('SBD4', 'Sistem Basis Data', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `kode_rk` varchar(20) NOT NULL,
  `id_dosenFK` int(11) DEFAULT NULL,
  `nim_mhsFK` varchar(10) DEFAULT NULL,
  `kode_mkFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indexes for table `dosen_has_matakuliah`
--
ALTER TABLE `dosen_has_matakuliah`
  ADD KEY `id_dosenFK` (`id_dosenFK`),
  ADD KEY `kode_mkFK` (`kode_mkFK`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim_mhs`);

--
-- Indexes for table `mahasiswa_has_dosen`
--
ALTER TABLE `mahasiswa_has_dosen`
  ADD PRIMARY KEY (`nim_mhsFK`,`id_dosenFK`);

--
-- Indexes for table `mahasiswa_has_matakuliah`
--
ALTER TABLE `mahasiswa_has_matakuliah`
  ADD PRIMARY KEY (`nim_mhsFK`,`kode_mkFK`),
  ADD KEY `kode_mkFK` (`kode_mkFK`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kode_rk`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen_has_matakuliah`
--
ALTER TABLE `dosen_has_matakuliah`
  ADD CONSTRAINT `dosen_has_matakuliah_ibfk_1` FOREIGN KEY (`id_dosenFK`) REFERENCES `dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dosen_has_matakuliah_ibfk_2` FOREIGN KEY (`kode_mkFK`) REFERENCES `mata_kuliah` (`kode_mk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa_has_matakuliah`
--
ALTER TABLE `mahasiswa_has_matakuliah`
  ADD CONSTRAINT `mahasiswa_has_matakuliah_ibfk_1` FOREIGN KEY (`nim_mhsFK`) REFERENCES `mahasiswa` (`nim_mhs`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_has_matakuliah_ibfk_2` FOREIGN KEY (`kode_mkFK`) REFERENCES `mata_kuliah` (`kode_mk`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

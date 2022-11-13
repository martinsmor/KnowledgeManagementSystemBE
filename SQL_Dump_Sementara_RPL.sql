-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2022 at 03:08 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `rpl_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `contentId` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `isi_comment` varchar(1000) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `contentId`, `username`, `isi_comment`, `tanggal`) VALUES
(1, '2', 'user1', 'Waduh sia sia dong panen ganja 1 ton', '2022-11-16'),
(2, '1', 'user4', 'Kamu nanya?', '0000-00-00'),
(3, '1', 'user4', 'Kamu nanya?', '0000-00-00'),
(4, '5', 'user4', 'Kamu nanya?', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `contentId` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` varchar(50) NOT NULL,
  `isi_konten` longtext NOT NULL,
  `thumbnail` varchar(50) DEFAULT NULL,
  `liked` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `tags` text NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`contentId`, `username`, `tanggal`, `judul`, `isi_konten`, `thumbnail`, `liked`, `kategori`, `tags`, `status`) VALUES
('1', 'user3', '2022-11-13', 'Content Error', 'Kesalahan yang disebabkan oleh jawaban responden maupun kesalahan pencatatan oleh petugas. Pengukuran dilakukan dengan mengukur perbedaan isian yang tercantum pada dokumen hasil pencacahan GB SE dengan UC PES.', 'https://dmm0a91a1r04e.cloudfront.net/i3O7AswS3pMet', 0, 'Ekonomi', 'Survei Pencacahan 2022', 'Pending'),
('10', 'user1', '2022-11-13', 'Pernikahan Not Found', 'ahhahahahaha', 'https://upload.wikimedia.org/wikipedia/commons/3/3', 0, 'Kependudukan', 'SP2020 Rudi', 'Pending'),
('15', 'user2', '2022-11-13', 'Pernikahan Not Found', 'ahhahahahaha', 'https://upload.wikimedia.org/wikipedia/commons/3/3', 0, 'Kependudukan', 'SP2020 Rudi', 'Pending'),
('16', 'user2', '2022-11-13', 'Pernikahan Not Found', 'ahhahahahaha', 'https://upload.wikimedia.org/wikipedia/commons/3/3', 0, 'Kependudukan', 'SP2020 Rudi', 'Pending'),
('2', 'user5', '2022-11-13', 'Pernikahan ini', 'testestes', NULL, 0, 'Kependudukan', '', 'Menunggu'),
('3', 'user3', '2022-11-13', 'Pernikahan ini', 'ahhahahahaha', NULL, 2, 'Kependudukan', '', 'Menunggu'),
('4', 'user6', '2022-11-13', 'Pernikahan ini', 'testestes', NULL, 0, 'Kependudukan', '', 'Approved'),
('5', 'user5', '2022-11-13', 'Pernikahan ini', 'testestes', NULL, 0, 'Kependudukan', '', 'Menunggu'),
('7', 'user3', '2022-11-13', 'Pernikahan ini', 'testestes', NULL, 0, 'Kependudukan', '', 'Menunggu');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `contentId` varchar(100) NOT NULL,
  `feedback` text NOT NULL,
  `from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `contentId`, `feedback`, `from`) VALUES
(1, '1', 'Kontennya busuk', 'user4');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_list`
--

CREATE TABLE `kategori_list` (
  `kategoriId` int(10) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_list`
--

INSERT INTO `kategori_list` (`kategoriId`, `nama_kategori`) VALUES
(7, 'Demografi'),
(3, 'Ekonomi'),
(6, 'Inflasi'),
(2, 'Kependudukan'),
(8, 'Kesejahteraan'),
(4, 'Pendidikan'),
(1, 'Pertanian'),
(5, 'Zakat');

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `id` int(11) NOT NULL,
  `contentId` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`id`, `contentId`, `username`) VALUES
(1, '1', 'user1');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Approval'),
(3, 'Content Creator'),
(4, 'Mitra');

-- --------------------------------------------------------

--
-- Table structure for table `unit_kerja`
--

CREATE TABLE `unit_kerja` (
  `id` int(11) NOT NULL,
  `unit_kerja_kode` varchar(10) NOT NULL,
  `unit_kerja` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit_kerja`
--

INSERT INTO `unit_kerja` (`id`, `unit_kerja_kode`, `unit_kerja`) VALUES
(2, '2', 'VISDAT'),
(3, '3', 'METSTAT'),
(4, '4', 'SAMPLING'),
(6, '6', 'SPD');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `unit_kerja` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nama`, `role`, `unit_kerja`) VALUES
('user1', '$2y$10$WRXO6PXDyXo8ZChh61RqJOB269EReckrYgIcG5odKP2ps7RRKUruW', 'Binog', 'Administrator', 'INSIS'),
('user2', '$2y$10$vOuTNHPywPU2Pnns9G6WLOxsKMvXpMZFLflfld27c7L2MDbfk/KvW', 'Nakano Miku', 'Approval', 'METSTAT'),
('user3', '$2y$10$bV01VA1.riWmxCuVeFvKmOt/Cj3WtTqMz3Y7NzXD2juy/FNsZOzcq', 'Aizen-sama', 'Mitra', 'METSTAT'),
('user4', '$2y$10$irZ87tbdZuUyNMQEyGv8CemzDfbhMB1FcNlP2pwZad1ij2JshOPAG', 'Gojo Satoru', 'Approval', 'SAMPLING'),
('user5', '$2y$10$SgfTSDydLz6.ANKSLf8mV./c7Pfemz30c6BqzBaKvYoRWj/t1tD7O', 'Kitagawa Marin', 'Content Creator', 'SAMPLING'),
('user6', '$2y$10$L6cELWnWqjWpb3TE30Pw5O2oYEe.06k0yCtrdSa7Ix5e2h3k6ZSC6', 'Katou Megumi', 'Content Creator', 'INSIS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`contentId`),
  ADD KEY `kategori` (`kategori`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_list`
--
ALTER TABLE `kategori_list`
  ADD PRIMARY KEY (`kategoriId`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cont_like` (`contentId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`);

--
-- Indexes for table `unit_kerja`
--
ALTER TABLE `unit_kerja`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unit_kerja_kode` (`unit_kerja_kode`),
  ADD UNIQUE KEY `unit_kerja` (`unit_kerja`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori_list`
--
ALTER TABLE `kategori_list`
  MODIFY `kategoriId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `unit_kerja`
--
ALTER TABLE `unit_kerja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

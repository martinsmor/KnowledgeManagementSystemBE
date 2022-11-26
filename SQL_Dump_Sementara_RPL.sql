-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2022 at 07:36 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `rpl_database`
--
CREATE DATABASE IF NOT EXISTS `rpl_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rpl_database`;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentId` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `isi_comment` varchar(1000) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `contentId`, `username`, `isi_comment`, `tanggal`) VALUES
(1, '2', 'user1', 'Waduh sia sia dong panen ganja 1 ton', '2022-11-16'),
(4, '5', 'user4', 'Kamu nanya?', '0000-00-00'),
(5, '2', 'user4', 'Kamu nanya?', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `contentId` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` varchar(50) NOT NULL,
  `isi_konten` longtext NOT NULL,
  `thumbnail` varchar(50) DEFAULT NULL,
  `liked` int(11) NOT NULL,
  `commented` int(11) NOT NULL DEFAULT 0,
  `kategori` varchar(50) NOT NULL,
  `tags` text NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`contentId`),
  KEY `kategori` (`kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`contentId`, `username`, `tanggal`, `judul`, `isi_konten`, `thumbnail`, `liked`, `commented`, `kategori`, `tags`, `status`) VALUES
('1', 'user3', '2022-11-25', 'Content Error', 'Kesalahan yang disebabkan oleh jawaban responden maupun kesalahan pencatatan oleh petugas. Pengukuran dilakukan dengan mengukur perbedaan isian yang tercantum pada dokumen hasil pencacahan GB SE dengan UC PES.', ' ', 3, 0, 'Ekonomi', 'Survei Pencacahan 2022', 'Diterima'),
('10', 'user1', '2022-11-13', 'Pernikahan Not Found', 'ahhahahahaha', 'https://upload.wikimedia.org/wikipedia/commons/3/3', 0, 0, 'Kependudukan', 'SP2020 Rudi', 'Pending'),
('15', 'user2', '2022-11-13', 'Pernikahan Not Found', 'ahhahahahaha', 'https://upload.wikimedia.org/wikipedia/commons/3/3', 0, 0, 'Kependudukan', 'SP2020 Rudi', 'Pending'),
('16', 'user2', '2022-11-13', 'Pernikahan Not Found', 'ahhahahahaha', 'https://upload.wikimedia.org/wikipedia/commons/3/3', 0, 0, 'Kependudukan', 'SP2020 Rudi', 'Pending'),
('2', 'user5', '2022-11-13', 'Pernikahan ini', 'testestes', NULL, 0, 1, 'Kependudukan', '', 'Menunggu'),
('3', 'user3', '2022-11-13', 'Pernikahan ini', 'ahhahahahaha', NULL, 2, 0, 'Kependudukan', '', 'Menunggu'),
('4', 'user6', '2022-11-13', 'Pernikahan ini', 'testestes', NULL, 0, 0, 'Kependudukan', '', 'Approved'),
('5', 'user5', '2022-11-13', 'Pernikahan ini', 'testestes', NULL, 0, 0, 'Kependudukan', '', 'Menunggu'),
('637245c106eea', 'user5', '2022-11-14', 'Content Error', 'Kesalahan yang disebabkan oleh jawaban responden maupun kesalahan pencatatan oleh petugas. Pengukuran dilakukan dengan mengukur perbedaan isian yang tercantum pada dokumen hasil pencacahan GB SE dengan UC PES.', '637245c102b4f.png', 0, 0, 'Ekonomi', 'Survei Pencacahan 2022', 'Pending'),
('637245d08bf37', 'user5', '2022-11-14', 'Content Error', 'Kesalahan yang disebabkan oleh jawaban responden maupun kesalahan pencatatan oleh petugas. Pengukuran dilakukan dengan mengukur perbedaan isian yang tercantum pada dokumen hasil pencacahan GB SE dengan UC PES.', '637245d088497.png', 0, 0, 'Ekonomi', 'Survei Pencacahan 2022', 'Pending'),
('637246691c9ce', 'user5', '2022-11-14', 'Content Error', 'Kesalahan yang disebabkan oleh jawaban responden maupun kesalahan pencatatan oleh petugas. Pengukuran dilakukan dengan mengukur perbedaan isian yang tercantum pada dokumen hasil pencacahan GB SE dengan UC PES.', '637246691883b.png', 0, 0, 'Ekonomi', 'Survei Pencacahan 2022', 'Pending'),
('7', 'user3', '2022-11-13', 'Pernikahan ini', 'testestes', NULL, 0, 0, 'Kependudukan', '', 'Menunggu');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` varchar(100) NOT NULL,
  `contentId` varchar(100) NOT NULL,
  `feedback` text NOT NULL,
  `from` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `contentId`, `feedback`, `from`) VALUES
('4user2', '4', 'Yang bikin goblok', 'user2'),
('7user4', '7', 'Ga layak dibaca', 'user4');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_list`
--

CREATE TABLE IF NOT EXISTS `kategori_list` (
  `kategoriId` int(10) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`kategoriId`),
  UNIQUE KEY `nama_kategori` (`nama_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE IF NOT EXISTS `like` (
  `id` varchar(100) NOT NULL,
  `contentId` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cont_like` (`contentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`id`, `contentId`, `username`) VALUES
('16user5', '16', 'user5'),
('1user1', '1', 'user1'),
('1user2', '1', 'user2'),
('1user3', '1', 'user3');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `username`, `text`, `status`, `created_at`) VALUES
(1, 'user3', 'Welcome', 'unread', '2022-11-23'),
(2, 'user3', 'Anda Terblokir', 'unread', '2022-11-23'),
(3, 'user5', 'Selamat Pagi', 'unread', '2022-11-23'),
(4, 'user6', 'Minggato', 'unread', '2022-11-24'),
(11, 'user2', 'Aizen-sama telah mengajukan konten (edit)', 'unread', '2022-11-25');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE IF NOT EXISTS `unit_kerja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_kerja_kode` varchar(10) NOT NULL,
  `unit_kerja` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit_kerja_kode` (`unit_kerja_kode`),
  UNIQUE KEY `unit_kerja` (`unit_kerja`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `unit_kerja` varchar(100) NOT NULL,
  `profile_photo` varchar(100) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nama`, `role`, `unit_kerja`, `profile_photo`) VALUES
('user1', '$2y$10$WRXO6PXDyXo8ZChh61RqJOB269EReckrYgIcG5odKP2ps7RRKUruW', 'Binog', 'Administrator', 'INSIS', ''),
('user2', '$2y$10$vOuTNHPywPU2Pnns9G6WLOxsKMvXpMZFLflfld27c7L2MDbfk/KvW', 'Nakano Miku', 'Approval', 'METSTAT', ''),
('user3', '$2y$10$bV01VA1.riWmxCuVeFvKmOt/Cj3WtTqMz3Y7NzXD2juy/FNsZOzcq', 'Aizen-sama', 'Content Creator', 'METSTAT', ''),
('user4', '$2y$10$irZ87tbdZuUyNMQEyGv8CemzDfbhMB1FcNlP2pwZad1ij2JshOPAG', 'Gojo Satoru', 'Approval', 'SAMPLING', ''),
('user5', '$2y$10$SgfTSDydLz6.ANKSLf8mV./c7Pfemz30c6BqzBaKvYoRWj/t1tD7O', 'Kitagawa Marin', 'Content Creator', 'METSTAT', ''),
('user6', '$2y$10$L6cELWnWqjWpb3TE30Pw5O2oYEe.06k0yCtrdSa7Ix5e2h3k6ZSC6', 'Katou Megumi', 'Content Creator', 'INSIS', '');
COMMIT;

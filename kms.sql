-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Mar 2024 pada 06.42
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kms`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `contentId` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `isi_comment` varchar(1000) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `comment`
--

INSERT INTO `comment` (`id`, `contentId`, `username`, `isi_comment`, `tanggal`) VALUES
(0, 'test-65e7852d204ee', 'martin', '<p>kk</p>', '2024-03-05 14:49:49'),
(0, 'laporan-keuangan-65e872078d959', 'martin', '<p>kenapa laporan keuangan bisa begini???</p>', '2024-03-06 07:44:49'),
(0, 'laporan-keuangan-65e872078d959', 'martin', '<p>awdmwa</p>', '2024-03-06 07:45:00'),
(0, 'cobba-65ebe46e5c44a', 'user2', '<p>oke</p>', '2024-03-08 22:39:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `content`
--

CREATE TABLE `content` (
  `contentId` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `tanggal` datetime NOT NULL,
  `judul` varchar(200) NOT NULL,
  `isi_konten` longtext NOT NULL,
  `thumbnail` varchar(50) DEFAULT NULL,
  `liked` int(11) NOT NULL,
  `commented` int(11) NOT NULL DEFAULT 0,
  `kategori` varchar(50) NOT NULL,
  `tags` text NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `content`
--

INSERT INTO `content` (`contentId`, `username`, `tanggal`, `judul`, `isi_konten`, `thumbnail`, `liked`, `commented`, `kategori`, `tags`, `status`) VALUES
('laporan-keuangan-65e872078d959', 'user2', '2024-03-06 20:39:19', 'laporan keuangan ', '<p>keuangan pusat statistika</p>', 'default.png', 1, 2, 'test', '#bigdata', 'Diterima'),
('cobba-65ebe46e5c44a', 'user5', '2024-03-09 11:24:14', 'cobba', '<p>ccoba</p>', '1709958254_f0612ea36e73bfc25c95.png', 1, 1, 'test', '', 'Diterima'),
('ss-65ebe58a00657', 'martin', '2024-03-09 11:28:58', 'ss', '<p>12</p>', 'default.png', 0, 0, 'test', '', 'Ditolak'),
('ss-65ebe5aaa9858', 'martin', '2024-03-09 11:29:30', 'ss', '<p>asdasd</p>', 'default.png', 0, 0, 'test', '', 'Ditolak'),
('testt-65ebe6049aaa3', 'user2', '2024-03-09 11:31:00', 'testt', '<p>123123</p>', 'default.png', 0, 0, 'test', '', 'Diterima'),
('dfdf-65ebe8c9ccec9', 'martin', '2024-03-09 11:42:49', 'dfdf', '<p>dasd</p>', '1709959369_7d902b0baa3af035b4e0.jpg', 0, 0, 'test', '#ask', 'Menunggu'),
('s-65ebfdf766253', 'user2', '2024-03-09 13:13:11', 's', '<p>s</p>', 'default.png', 0, 0, 'test', '', 'Ditolak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `id` varchar(100) NOT NULL,
  `contentId` varchar(100) NOT NULL,
  `feedback` text NOT NULL,
  `from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_list`
--

CREATE TABLE `kategori_list` (
  `kategoriId` int(10) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_list`
--

INSERT INTO `kategori_list` (`kategoriId`, `nama_kategori`) VALUES
(2, 'test');

-- --------------------------------------------------------

--
-- Struktur dari tabel `like`
--

CREATE TABLE `like` (
  `id` varchar(100) NOT NULL,
  `contentId` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `like`
--

INSERT INTO `like` (`id`, `contentId`, `username`) VALUES
('cobba-65ebe46e5c44auser2', 'cobba-65ebe46e5c44a', 'user2'),
('laporan-keuangan-65e872078d959martin', 'laporan-keuangan-65e872078d959', 'martin'),
('tessss-65e7b12bdaafbmartin', 'tessss-65e7b12bdaafb', 'martin'),
('test-65e7852d204eeuser1', 'test-65e7852d204ee', 'user1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `contentId` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `notification`
--

INSERT INTO `notification` (`id`, `username`, `text`, `status`, `created_at`, `contentId`) VALUES
(1, 'martin', 'Pengajuan konten Anda telah diterima', 'unread', '2024-03-05 00:00:00', 'test-65e7852d204ee'),
(2, 'martin', 'Konten Anda disukai oleh Martin Hasiholan Simamora', 'unread', '2024-03-05 00:00:00', 'test-65e7852d204ee'),
(3, 'martin', 'Konten Anda dikomentari oleh Martin Hasiholan Simamora', 'unread', '2024-03-05 14:49:49', 'test-65e7852d204ee'),
(4, 'martin', 'Konten Anda disukai oleh user1', 'unread', '2024-03-05 00:00:00', 'test-65e7852d204ee'),
(5, 'martin', 'Pengajuan konten Anda telah diterima', 'unread', '2024-03-05 00:00:00', 'tesss-65e7b11409ea3'),
(6, 'martin', 'Pengajuan konten Anda telah diterima', 'unread', '2024-03-05 00:00:00', 'tessss-65e7b12bdaafb'),
(7, 'martin', 'Konten Anda disukai oleh Martin Hasiholan Simamora', 'unread', '2024-03-06 00:00:00', 'tessss-65e7b12bdaafb'),
(8, 'martin', 'Konten Anda disukai oleh user2', 'unread', '2024-03-06 00:00:00', 'test-65e7852d204ee'),
(9, 'martin', 'Konten Anda disukai oleh user2', 'unread', '2024-03-06 00:00:00', 'test-65e7852d204ee'),
(10, 'martin', 'Konten Anda disukai oleh user2', 'unread', '2024-03-06 00:00:00', 'test-65e7852d204ee'),
(11, 'user2', 'user2 telah membuat pengajuan konten', 'unread', '2024-03-06 20:39:19', 'laporan-keuangan-65e872078d959'),
(12, 'user2', 'Pengajuan konten Anda telah diterima', 'unread', '2024-03-06 00:00:00', 'laporan-keuangan-65e872078d959'),
(13, 'user2', 'Konten Anda dikomentari oleh Martin Hasiholan Simamora', 'unread', '2024-03-06 07:44:49', 'laporan-keuangan-65e872078d959'),
(14, 'user2', 'Konten Anda dikomentari oleh Martin Hasiholan Simamora', 'unread', '2024-03-06 07:45:00', 'laporan-keuangan-65e872078d959'),
(15, 'user2', 'Konten Anda disukai oleh Martin Hasiholan Simamora', 'unread', '2024-03-06 00:00:00', 'laporan-keuangan-65e872078d959'),
(16, 'martin', 'Konten Anda disukai oleh Martin Hasiholan Simamora', 'unread', '2024-03-06 00:00:00', 'tessss-65e7b12bdaafb'),
(17, 'user2', 'user5 telah membuat pengajuan konten', 'unread', '2024-03-09 11:24:14', 'cobba-65ebe46e5c44a'),
(18, 'user5', 'Pengajuan konten Anda telah diterima', 'unread', '2024-03-08 00:00:00', 'cobba-65ebe46e5c44a'),
(19, 'martin', 'Pengajuan konten Anda ditolak oleh Approval', 'unread', '2024-03-08 00:00:00', 'ss-65ebe58a00657'),
(20, 'martin', 'Pengajuan konten Anda ditolak oleh Approval', 'unread', '2024-03-08 00:00:00', 'ss-65ebe5aaa9858'),
(21, 'user2', 'user2 telah membuat pengajuan konten', 'unread', '2024-03-09 11:31:00', 'testt-65ebe6049aaa3'),
(22, 'user5', 'Konten Anda dikomentari oleh user2', 'unread', '2024-03-08 22:39:24', 'cobba-65ebe46e5c44a'),
(23, 'user5', 'Konten Anda disukai oleh user2', 'unread', '2024-03-08 00:00:00', 'cobba-65ebe46e5c44a'),
(24, 'user2', 'Pengajuan konten Anda telah diterima', 'unread', '2024-03-08 00:00:00', 'testt-65ebe6049aaa3'),
(25, 'user2', 'user2 telah membuat pengajuan konten', 'unread', '2024-03-09 13:13:11', 's-65ebfdf766253'),
(26, 'user2', 'Pengajuan konten Anda ditolak oleh Approval', 'unread', '2024-03-09 00:00:00', 's-65ebfdf766253');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Approval'),
(3, 'Content Creator'),
(4, 'Mitra');

-- --------------------------------------------------------

--
-- Struktur dari tabel `unit_kerja`
--

CREATE TABLE `unit_kerja` (
  `id` int(3) NOT NULL,
  `unit_kerja_kode` int(3) DEFAULT NULL,
  `unit_kerja` varchar(83) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `unit_kerja`
--

INSERT INTO `unit_kerja` (`id`, `unit_kerja_kode`, `unit_kerja`) VALUES
(1, 1, 'test'),
(2, 2, 'testtest');

-- --------------------------------------------------------

--
-- Struktur dari tabel `unit_kerja1`
--

CREATE TABLE `unit_kerja1` (
  `id` int(11) NOT NULL,
  `unit_kerja_kode` varchar(10) NOT NULL,
  `unit_kerja` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `unit_kerja` varchar(100) NOT NULL,
  `profile_photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `password`, `nama`, `role`, `unit_kerja`, `profile_photo`) VALUES
('martin', '$2y$10$oHSAVfnXV5Gf6DQOFTGEEuyAgFehVAXJjevp0B1Y.DBQ./soYI96.', 'Martin Hasiholan Simamora', 'Content Creator', 'Direktorat Statistik Kependudukan dan Ketenagakerjaan', '1639535117.png'),
('user1', '$2y$10$UzM1nmTfCmxXAC6OGJ8wnu0JYJU6lzMxuuYOlGwL5IhY8oWn7wDhu', 'user1', 'Mitra', 'test', '2151578300.png'),
('user2', '$2y$10$hFodrP1CJncUfpzwwmlCx.CwhhTbfl.dxwim1YvxzCcIpt/0dNpx.', 'user2', 'Approval', 'test', '6374580193.png'),
('user3', '$2y$10$UzKRlRyx7.WhhnoBgUVj8.uWXJ.pFnA76eH5uK.qK3CyY2.V4ph6O', 'user3', 'Administrator', 'testtest', '9774243071.png'),
('user4', '$2y$10$BhMeF6CPRflmsrQ3Xh7jc.QoiiVCY7k4qGmNjhti2ToPycCR0sZay', 'user4', 'Content Creator', 'testtest', '4492462980.png'),
('user5', '$2y$10$zY8wqgBfL06NBSbjCCQDlO0/48soY8yo8i3f.abE5dxlfAGgkJiVy', 'user5', 'Content Creator', 'test', 'default.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_list`
--
ALTER TABLE `kategori_list`
  ADD PRIMARY KEY (`kategoriId`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indeks untuk tabel `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cont_like` (`contentId`);

--
-- Indeks untuk tabel `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`);

--
-- Indeks untuk tabel `unit_kerja`
--
ALTER TABLE `unit_kerja`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `unit_kerja1`
--
ALTER TABLE `unit_kerja1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unit_kerja_kode` (`unit_kerja_kode`),
  ADD UNIQUE KEY `unit_kerja` (`unit_kerja`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori_list`
--
ALTER TABLE `kategori_list`
  MODIFY `kategoriId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `unit_kerja`
--
ALTER TABLE `unit_kerja`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `unit_kerja1`
--
ALTER TABLE `unit_kerja1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

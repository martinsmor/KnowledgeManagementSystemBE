-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2022 at 05:41 PM
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
  `contentId` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `isi_comment` varchar(1000) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `contentId`, `username`, `isi_comment`, `tanggal`) VALUES
(1, 2, 'user1', 'Waduh sia sia dong panen ganja 1 ton', '2022-11-16');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `contentId` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` varchar(50) NOT NULL,
  `isi_konten` longtext NOT NULL,
  `liked` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`contentId`, `username`, `tanggal`, `judul`, `isi_konten`, `liked`, `type`, `status`) VALUES
(1, 'user3', '2022-11-10', 'Pedoman Survey untuk Inflasi', 'Inflasi:\r\n\r\nInflasi adalah kecenderungan naiknya harga barang dan jasa pada umumnya yang berlangsung secara terus menerus. Jika harga barang dan jasa di dalam negeri meningkat, maka inflasi mengalami kenaikan. Naiknya harga barang dan jasa tersebut menyebabkan turunnya nilai uang. Dengan demikian, inflasi dapat juga diartikan sebagai penurunan nilai uang terhadap nilai barang dan jasa secara umum.\r\n\r\nIndeks Harga konsumen (IHK):\r\n\r\nIndeks yang menghitung rata-rata perubahan harga dari suatu paket barang dan jasa yang dikonsumsi oleh rumah tangga dalam kurun waktu tertentu. IHK merupakan indikator yang digunakan untuk mengukur tingkat inflasi. Perubahan IHK dari waktu ke waktu menggambarkan tingkat kenaikan (inflasi) atau tingkat penurunan (deflasi) dari barang dan jasa.\r\n\r\nAndil Inflasi:\r\n\r\nAndil Inflasi adalah besarnya sumbangan setiap komoditas yang mengalami fluktuasi harga terhadap inflasi atau deflasi yang terjadi di suatu kota atau secara nasional. Besarnya nilai perubahan indeks (inflasi/deflasi) yang terjadi setiap bulan, merupakan gabungan andil dari jenis barang/jasa yang mengalami fluktuasi harga pada bulan yang bersangkutan.', 0, 'Artikel', 'Menunggu'),
(2, 'user5', '2022-11-13', 'Apakah bertani itu boleh?', 'Bertani itu boleh asalkan jangan ganja', 0, 'Pertanyaan', 'Disetujui'),
(3, 'user3', '2022-11-06', 'Tata Cara Pernikahan Hewan', 'Menurut dr Roslan Yusni Hasan, spesialis bedah saraf, manusia tidak mungkin bisa menghamili binatang. \"Kalau manusia yang bersetubuh dengan binatang memang banyak, tetapi tidak mungkin bisa hamil karena genusnya berbeda,\" kata dokter yang akrab disapa dr Ryu ini saat dihubungi Kompas.com, Senin (21/12/2015)', 2, 'Video', 'Ditolak'),
(4, 'user6', '2022-11-06', 'Lagu Apuse Mempengaruhi Peradaban', 'Apuse kokon dao Yarabe soren doreri Wuf lenso bani nema baki pase Apuse kokon dao Yarabe soren doreri Wuf lenso bani nema baki pase Arafabye aswarakwar Arafabye aswarakwar\r\n\r\nArtikel ini telah tayang di www.inews.id dengan judul \" Lirik Lagu Apuse Beserta Notnya, Arti dan Asal Daerahnya \", Klik untuk baca: https://www.inews.id/news/nasional/lirik-lagu-apuse-beserta-notnya-arti-dan-asal-daerahnya.\r\n\r\n\r\nDownload aplikasi Inews.id untuk akses berita lebih mudah dan cepat:\r\nhttps://www.inews.id/apps', 0, 'Audio', 'Menunggu'),
(5, 'user5', '2022-11-01', 'Koruptor', 'Korupsi adalah semua yang memiliki keterkaitan terhadap tindakan yang diancam dengan sanksi sebagaimana diatur didalam Undang-undang No. 31 Tahun 1999 Tentang Pemberantasan Tindak Pidana Korupsi dan Undang-undang No. 20 Tahun 2001 tentang pengubahan Atas UU No. 31 Tahun 1999 tentang Pemberantasan Tindak Pidana Korupsi[1][2]. Dan Peraturan Mahkamah Agung Nomor 1 tahun 2020[3].\r\n\r\nRasuah atau mencuri (bahasa Latin: corruptio dari kata kerja corrumpere yang bermakna busuk, haram, menggoyahkan, memutarbalik, menyogok, mencuri, maling) ialah tindakan pejabat publik, baik politisi maupun pegawai negeri sipil, serta pihak lain yang terlibat dalam tindakan itu yang secara tidak wajar dan tidak legal menyalahgunakan kepercayaan publik dan masyarakat yang dikuasakan kepada mereka untuk mendapatkan keuntungan sepihak.[4]', 0, 'Artikel', 'Disetujui');

-- --------------------------------------------------------

--
-- Table structure for table `c_type`
--

CREATE TABLE `c_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c_type`
--

INSERT INTO `c_type` (`id`, `type`) VALUES
(1, 'Artikel'),
(5, 'Audio'),
(3, 'Foto'),
(2, 'Pertanyaan'),
(4, 'Video');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `contentId` int(10) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `contentId`, `kategori`) VALUES
(1, 1, 'Pertanian'),
(2, 3, 'Sosial'),
(3, 1, 'Pendidikan'),
(4, 4, 'Ekonomi'),
(5, 3, 'Kependudukan'),
(6, 5, 'Pertanian'),
(7, 2, 'Kependudukan'),
(8, 5, 'Inflasi'),
(9, 2, 'Pertanian'),
(10, 3, 'Pertanian'),
(11, 5, 'Pertanian'),
(12, 1, 'Pendidikan');

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
(4, 'Pendidikan'),
(1, 'Pertanian'),
(5, 'Sosial');

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `id` int(11) NOT NULL,
  `contentId` int(10) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`id`, `contentId`, `username`) VALUES
(1, 1, 'user1');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `contentId` int(10) NOT NULL,
  `mediaId` int(10) NOT NULL,
  `medialink` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(3, 'Content Creator');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `contentId` int(10) NOT NULL,
  `tag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `contentId`, `tag`) VALUES
(1, 1, 'Penjahat'),
(2, 2, 'SP2020'),
(3, 3, 'IndonesiaHebat'),
(4, 4, 'KamiMaju'),
(5, 5, 'DataBerkualitas'),
(6, 4, 'MelawanKoruptor'),
(7, 1, 'AyoBergerak'),
(8, 2, 'KerjaKerjaKerja'),
(9, 3, 'PantangMenyerah');

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
(1, '1', 'INSIS'),
(2, '2', 'VISDAT'),
(3, '3', 'METSTAT'),
(4, '4', 'SAMPLING');

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
('user3', '$2y$10$bV01VA1.riWmxCuVeFvKmOt/Cj3WtTqMz3Y7NzXD2juy/FNsZOzcq', 'Aizen-sama', 'Content Creator', 'METSTAT'),
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
  ADD KEY `type` (`type`);

--
-- Indexes for table `c_type`
--
ALTER TABLE `c_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kat` (`kategori`),
  ADD KEY `cont_kat` (`contentId`);

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
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`mediaId`),
  ADD KEY `id_cont` (`contentId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content` (`contentId`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `contentId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `c_type`
--
ALTER TABLE `c_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kategori_list`
--
ALTER TABLE `kategori_list`
  MODIFY `kategoriId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `mediaId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `unit_kerja`
--
ALTER TABLE `unit_kerja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `type` FOREIGN KEY (`type`) REFERENCES `c_type` (`type`);

--
-- Constraints for table `kategori`
--
ALTER TABLE `kategori`
  ADD CONSTRAINT `cont_kat` FOREIGN KEY (`contentId`) REFERENCES `content` (`contentId`),
  ADD CONSTRAINT `kat` FOREIGN KEY (`kategori`) REFERENCES `kategori_list` (`nama_kategori`);

--
-- Constraints for table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `cont_like` FOREIGN KEY (`contentId`) REFERENCES `content` (`contentId`);

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `id_cont` FOREIGN KEY (`contentId`) REFERENCES `content` (`contentId`);

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `content` FOREIGN KEY (`contentId`) REFERENCES `content` (`contentId`);
COMMIT;

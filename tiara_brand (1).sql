-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Bulan Mei 2021 pada 11.05
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiara_brand`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `nama_penerima` varchar(255) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `alamat_lengkap` varchar(255) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_product`, `qty`, `subtotal`) VALUES
(4, 1, 1, 1, 200000),
(5, 3, 1, 1, 200000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(1, 'hijab', 'Hijab'),
(2, 'outer', 'Outer'),
(3, 'dress', 'Dress'),
(4, 'womans-bottom', 'Woman\'s Bottom'),
(5, 'womans-top', 'Woman\'s Top'),
(6, 'mans-top', 'Man\'s Top');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `status` enum('waiting','paid','packaging','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 3, 1, 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`, `stock`) VALUES
(1, 3, 'batik-dress-dark-choco', 'Batik Dress Dark Choco', 'Batik Dress Dark Choco\r\nItem Type: Batik Dress,\r\nItem Material: Batik Cotton,\r\nItem Size: All Size fit to XL,\r\nItem Colours: Black + Batik', 200000, 1, 'batik-dress-dark-choco-20201102224101.jpg', 2),
(2, 3, 'wolfish-dress-autumn-red', 'Wolfish Dress Autumn Red', 'Wolfish Dress Autumn Red\r\n\r\nItem Type: Dress\r\nItem Material: Cotton Stretch\r\nItem Size: All Size fit to L\r\nItem Colour: Mix Colour', 200000, 0, 'wolfish-dress-autumn-red-20201103213639.jpg', 0),
(3, 5, 'peplum-organza-pantone', 'Peplum Organza Pantone', 'Peplum Organza Pantone\r\n\r\nItem Type: Peplum\r\nItem Material: Brokat+Organza\r\nItem Size: All size fit to L\r\nItem Colors: Pink', 100000, 1, 'peplum-organza-pantone-20201103200936.jpg', 3),
(4, 5, 'peplum-organza-torquise', 'Peplum Organza Torquise', 'Peplum Organza Torquise\r\nItem Type: Peplum\r\nItem Material: Brocade+Organza\r\nItem Size: All Size fit to L\r\nItem Colours: Torquise (Cyan)', 200000, 1, 'peplum-organza-torquise-20201103213816.jpg', 4),
(5, 5, 'batik-sunshine', 'Batik Sunshine', 'Batik Sunshine\r\n\r\nItem Type: Baju Kurung\r\nItem Material: Batik Cotton\r\nItem Size: All Size fit to L\r\nItem Colors: Gold', 200000, 0, 'batik-sunshine-20201103214033.jpg', 0),
(6, 5, 'peplum-silky-gold', 'Peplum Silky Gold', 'Peplum Silky Gold\r\n\r\nItem Type: Peplum\r\nItem Material: Satin\r\nItem Size: All Size fit to L\r\nItem Colour: Gold', 200000, 1, 'peplum-silky-gold-20201103212304.jpg', 4),
(7, 5, 'peplum-organza-red', 'Peplum Organza Red', 'Peplum Organza Red\r\n\r\nItem Type: Peplum\r\nItem Material: Brocade+Organza\r\nItem Size: All Size fit to L\r\nItem Colour: Red', 200000, 1, 'peplum-organza-red-20201103212501.jpg', 3),
(8, 3, 'dress-mermaid-dusty-pink', 'Dress Mermaid Dusty Pink', 'Dress Mermaid Dusty Pink\r\n\r\nItem Type: Dress\r\nItem Size: fit to XL\r\nItem Colour: Dusty Pink', 300000, 1, 'dress-mermaid-dusty-pink-20201103212623.jpg', 2),
(9, 3, 'dress-mermaid-silver', 'Dress Mermaid Silver', 'Dress Mermaid Silver\r\n\r\nItem Type: Dress\r\nItem Size: All size fit to L\r\nItem Colour: Silver', 300000, 1, 'dress-mermaid-silver-20201103212746.jpg', 4),
(10, 3, 'dress-mermaid-creamy', 'Dress Mermaid Creamy', 'Dress Mermaid Creamy\r\n\r\nItem Type: Dress\r\nItem Size: All size fit to L\r\nItem Colour: Cream Milo', 300000, 1, 'dress-mermaid-creamy-20201103212858.jpg', 3),
(11, 3, 'batik-dress-deep-blue', 'Batik Dress Deep Blue', 'Batik Dress Deep Blue\r\n\r\nItem Type: Dress Batik\r\nItem Size: fit to XL\r\nItem Colour: Deep Blue', 250000, 0, 'batik-dress-deep-blue-20201103213010.jpg', 0),
(12, 3, 'batik-dress-violet', 'Batik Dress Violet', 'Batik Dress Violet\r\n\r\nItem Type: Dress Batik\r\nItem Size: All Size fit to L\r\nItem Colour: Violet', 250000, 0, 'batik-dress-violet-20201103213106.jpg', 0),
(13, 4, 'batik-skirt-deep-blue', 'Batik Skirt Deep Blue', 'Batik Skirt Deep Blue\r\n\r\nItem Type: Skirt\r\nItem Material: Batik Cotton\r\nItem Size: All Size fit to L\r\nItem Colour: Deep Blue', 150000, 1, 'batik-skirt-deep-blue-20201103213306.jpg', 4),
(14, 3, 'batik-dress-red', 'Batik Dress Red', 'Batik Dress Red\r\n\r\nItem Type: Batik Dress\r\nItem Material: Cotton Stretch\r\nItem Size: All Size fit to L\r\nItem Colour: Red', 270000, 1, 'batik-dress-red-20201103213455.jpg', 2),
(15, 6, 'batik-shirt-umbrella', 'Batik Shirt Umbrella', 'Batik Shirt Umbrella\r\n\r\nItem Type: Shirt\r\nItem Material: Batik Cotton\r\nItem Size: S, M, L, XL, XXL\r\nItem Colour: Red', 150000, 1, 'batik-shirt-umbrella-20201103214238.jpg', 5),
(16, 6, 'batik-shirt-umbrella-purple', 'Batik Shirt Umbrella Purple', 'Batik Shirt Umbrella Purple\r\n\r\nItem Type: Shirt\r\nItem Material: Batik Cotton\r\nItem Size: S, M, L, XL, XXL\r\nItem Colour: Purple', 150000, 1, 'batik-shirt-umbrella-purple-20201103214347.jpg', 4),
(17, 6, 'batik-shirt-on-fire', 'Batik Shirt on Fire', 'Batik Shirt on Fire\r\n\r\nItem Type: Shirt\r\nItem Material: Batik Cotton\r\nItem Size: S, M, L, XL, XXL\r\nItem Colour: Red', 150000, 0, 'batik-shirt-on-fire-20201103214446.jpg', 0),
(18, 1, 'apaja', 'apaja', 'asdasfas', 50000, 1, 'apaja-20201125150426.jpg', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$l12cZZFnldsRQGOUGJXHzuz3Vaev0zjCv.2zGgeLMc/b5ZSWYnK.S', 'admin', 1, 'admin-20210430005430.png'),
(2, 'Member', 'member@gmail.com', '$2y$10$T6MsIftATVqCswIo8qypi.Xu8YVgb.3ZuNSYgbUjvl0lJkQyzWDbe', 'member', 1, NULL),
(3, 'bayu setyo prayogi', 'bayu@gmail.com', '$2y$10$LwOqBcO076wOOFVAdcYY0OjMSwctuHlVyieIeTOgiBbyxT/VF0IUe', 'member', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

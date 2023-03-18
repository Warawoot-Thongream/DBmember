-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2023 at 17:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmember`
--

-- --------------------------------------------------------

--
-- Table structure for table `resturant`
--

CREATE TABLE `resturant` (
  `resturant_id` int(11) NOT NULL COMMENT 'รหัสร้านอาหาร',
  `resturant_name` varchar(100) NOT NULL COMMENT 'ชื่อร้านอาหาร'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resturant`
--

INSERT INTO `resturant` (`resturant_id`, `resturant_name`) VALUES
(1, 'โกนขแมร์ แหนมเนือง สุรินทร์'),
(2, 'กวยจั๊บเจ้ฟาง สาขาสุรินทร์'),
(3, 'เฮียเกี๊ยกเย็นตาโฟ สุรินทร์'),
(4, 'บ้านสวนปลาเผา'),
(5, 'แม่พิมพ์ปลาเผา สาขา2');
(6, 'ป้าพิมพ์ปลาเผา สาขาสุรินทร์');
(7, 'แก่นจันทร์เนื้อย่าง แจ๋วฮ้อน');
(8, 'สวนป่ารีสอร์ท');
(9, 'ภัตตาคารแป๊ะตี๋');
(10, 'สุรินทร์วากิว ริมคลอง');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `emp_id` int(11) NOT NULL COMMENT 'รหัสพนักงาน',
  `name` varchar(100) NOT NULL COMMENT 'ชื่อ',
  `sname` varchar(100) NOT NULL COMMENT 'นามสกุล',
  `email` varchar(100) NOT NULL COMMENT 'อีเมล์',
  `resturant_id` int(11) NOT NULL COMMENT 'รหัสร้านอาหาร'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`emp_id`, `name`, `sname`, `email`, `resturant_id`) VALUES
(2, 'นายวราวุฒิ', 'ทองเรียม', '64222200106@sruu.ac.th', 1),
(3, 'นายวิษณุพร', 'พันธ์ภา', '64222200101@srru.ac.th', 3);
(4, 'นายวีรวัชร์', 'อัคราวัชรโรจน์', '64222200116@sruu.ac.th', 4;),
(5, 'นายสุริยา', 'เครือจันทร์', '64222200114@srru.ac.th', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT 'รหัสผู้ใช้',
  `username` varchar(50) NOT NULL COMMENT 'ชื่อผู้ใช้',
  `password` varchar(50) NOT NULL COMMENT 'รหัสผ่าน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', '9dc9d5ed5031367d42543763423c24ee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `resturant`
--
ALTER TABLE `resturant`
  ADD PRIMARY KEY (`resturant_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `resturant_id` (`resturant_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `resturant`
--
ALTER TABLE `resturant`
  MODIFY `resturant_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสร้านอาหาร', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสพนักงาน', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสผู้ใช้', AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`resturant_id`) REFERENCES `resturant` (`resturant_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

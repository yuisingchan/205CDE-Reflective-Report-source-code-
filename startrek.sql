-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2019 年 04 月 10 日 16:50
-- 伺服器版本: 10.1.35-MariaDB
-- PHP 版本： 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `startrek`
--

-- --------------------------------------------------------

--
-- 資料表結構 `batteries`
--

CREATE TABLE `batteries` (
  `productID` int(6) NOT NULL,
  `productName` varchar(70) COLLATE utf8_bin NOT NULL,
  `productBrand` varchar(10) COLLATE utf8_bin NOT NULL,
  `Price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `batteries`
--

INSERT INTO `batteries` (`productID`, `productName`, `productBrand`, `Price`) VALUES
(30180, 'LP-E6 Battery', 'Sidane', 260),
(30240, ' LP-E10 1020mAh 7.55Wh 7.4V BATTERY', 'KINGMA', 140),
(30280, 'EN-EL14 Battery', 'Sidane', 260),
(30290, 'EN-EL15 Battery', 'Sidane', 260),
(30685, 'EN-EL14A / EN-EL14 2pcs Battery with LCD Dual Charger', 'KINGMA', 460),
(30695, 'EN-EL15A / EN-EL15 2pcs Battery with LCD Dual Charger', 'KIGMA', 550),
(30760, '3X LP-E17 Battery with DC163 Travel Charger', 'DSTE', 490),
(30920, 'LP-E17 dual batteries + USB dual charger', 'KINGMA', 370);

-- --------------------------------------------------------

--
-- 資料表結構 `customers`
--

CREATE TABLE `customers` (
  `customerid` int(11) NOT NULL,
  `username` char(20) CHARACTER SET utf8 NOT NULL,
  `email` char(30) CHARACTER SET utf8 NOT NULL,
  `HKID` char(8) CHARACTER SET utf8 NOT NULL,
  `pwd` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `TelNo` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `customers`
--

INSERT INTO `customers` (`customerid`, `username`, `email`, `HKID`, `pwd`, `TelNo`) VALUES
(10001, 'Tigerleung', 'tiger41r@ymail.com', 'Y5266366', '38A238M238X', 65784670),
(10002, 'yiuschan7', 'chanyiusing@ymail.com', 'Y711414A', 'lychee19h5', 92648148),
(10003, 'tablehui', 'tcuncle@ymail.com', 'R6758788', 'LWBMK8411', 59899958),
(10004, 'fattsui', 'tcw1998@yahoo.com', 'Y433567A', 'TCW88K', 67610350),
(10005, 'cythinalam', 'cllam@yahoo.com', 'Y7454466', 'ilove80', 97198428),
(10006, 'SamuelLeung', 'samue1991@gmail.com', 'Y3456178', 'fushin73X', 65988674),
(10007, 'qwe', 'qwe@qwe', 'qwe', 'qwe', 123),
(10008, '%s', '%s', '%s', '%s', 0),
(10009, 'James Kwok', 'jameskch@gmail.com', 'Y711515A', '24681012', 91820978),
(10010, 'Moses Luk', 'MLredminibus@yahoo.com', 'Y6884534', '5617856190', 69722361);

-- --------------------------------------------------------

--
-- 資料表結構 `dslr`
--

CREATE TABLE `dslr` (
  `productID` int(6) NOT NULL,
  `productName` varchar(70) COLLATE utf8_bin NOT NULL,
  `productBrand` varchar(10) COLLATE utf8_bin NOT NULL,
  `Price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `dslr`
--

INSERT INTO `dslr` (`productID`, `productName`, `productBrand`, `Price`) VALUES
(23119, 'EOS 80D with EF-S 18-135mm f/3.5-5.6 IS USM Kit', 'Canon', 8520),
(23140, ' 77D body', 'Canon', 2450),
(23145, 'EOS 77D with EF-S 18-55mm f/4-5.6 IS STM Kit', 'Canon', 4700),
(23158, 'EOS 800D with EF-S 18-135MM f/3.5-5.6G IS STM Kit', 'Canon', 6500),
(23161, ' EOS 760D with EF-S 18-55mm f/3.5-5.6 IS STM Kit', 'Canon', 5260),
(23177, ' EOS 3000D with EF-S 18-55mm f/3.5-5.6 III Kit', 'Canon', 2500),
(23178, 'EOS 200D + EF-S 18-55mm f/3.5-5.6 III Lens', 'Canon', 13000),
(23210, 'EOS 5D Mark IV body', 'Canon', 15880),
(23211, ' 1500D with EF-S 18-55mm f/3.5-5.6 IS II Kit', 'Canon', 3650),
(23220, 'EOS 6D Mark II body', 'Canon', 8800),
(23232, 'EOS 7D Mark II with EF-S 18-135mm f/3.5-5.6 IS STM Kit', 'Canon', 9000),
(23242, '5D Mark III with EF 24-70mm f/4L IS USM Kit', 'Canon', 18500),
(32240, 'D3400 body', 'Nikon', 2450),
(32456, ' D3500 with AF-P DX NIKKOR 18-55mm f/3.5-5.6G VR kit', 'Nikon', 3880),
(32544, ' D5500 KIT with 18-140mm F/3.5-5.6G', 'Nikon', 4320),
(32553, 'D5600 KIT with 18-140mm VR', 'Nikon', 5520),
(32675, ' D7500 w/AF-P 18-55mm Kit', 'Nikon', 7150),
(32777, ' D750 (with Nikon AF 50mm F1.8D)', 'Nikon', 8450),
(32780, ' D850 body', 'Nikon', 21200),
(32785, ' D850 with AF-S NIKKOR 24-120MM F/4G ED ', 'Nikon', 23500),
(32790, 'D810 body', 'Nikon', 13000),
(32833, ' D7100 w/AF-S NIKKOR 16-85mm f/3.5-5.6G ED VR II Kit', 'Nikon', 8600),
(32847, ' D7200 w/AF-S NIKKOR 18-200mm f/3.5-5.6G', 'Nikon', 7300),
(32866, 'D500 AF-S DX NIKKOR 16-80MM F/2.8-4E ED ', 'Nikon', 14500);

-- --------------------------------------------------------

--
-- 資料表結構 `filters`
--

CREATE TABLE `filters` (
  `productID` int(6) NOT NULL,
  `productName` varchar(70) COLLATE utf8_bin NOT NULL,
  `productBrand` varchar(10) COLLATE utf8_bin NOT NULL,
  `Price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `filters`
--

INSERT INTO `filters` (`productID`, `productName`, `productBrand`, `Price`) VALUES
(40187, '77mm NanoPro CPL Filter', 'Haida', 830),
(40250, '77mm NanoPro Solid Neutral Density Filter ND1000 (3.0)', 'Haida', 830),
(40320, 'XS-Pro UV MRC Nano (010M) 77mm', 'B+W', 445),
(40480, 'HD Filter UV 77mm', 'Hoya', 330),
(40484, ' 52mm HMC Digital UV (C) Slim Frame Filter', 'Hoya', 260),
(40650, ' 72mm Pro1 Digital Circular PL', 'Kenko', 550);

-- --------------------------------------------------------

--
-- 資料表結構 `kart`
--

CREATE TABLE `kart` (
  `productID` int(10) NOT NULL,
  `productName` varchar(70) CHARACTER SET utf8 NOT NULL,
  `productBrand` varchar(10) CHARACTER SET utf8 NOT NULL,
  `Price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `lens`
--

CREATE TABLE `lens` (
  `productID` int(6) NOT NULL,
  `productName` varchar(70) COLLATE utf8_bin NOT NULL,
  `productBrand` varchar(10) COLLATE utf8_bin NOT NULL,
  `Price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `lens`
--

INSERT INTO `lens` (`productID`, `productName`, `productBrand`, `Price`) VALUES
(51234, '35mm F1.4 DG HSM ', 'Sigma', 1680),
(51586, '70-200mm F2.8 DG OS HSM (Sport)', 'Sigma', 9680),
(52213, '18-35mm F1.8 DC HSM Art', 'Sigma', 4560),
(53212, '16mm F1.4 DC DN Contemporary', 'Sigma', 2580),
(53324, 'MARCO 150mm F2.8 EX DG OS HSM  (Canon)', 'Sigma', 6800),
(53422, '150-600mm F5-6.3 DG OS HSM Contemporary', 'Sigma', 6550),
(54242, '17-50mm F2.8 EX DC OS HSM', 'Sigma', 1850),
(56105, ' AF-S DX NIKKOR 18-140MM f/3.5-5.6G ED VR ', 'Nikkor', 1680),
(56136, ' AF-S DX Zoom-NIKKOR 70-300MM f/4.5-5.6G IF ED', 'Nikkor', 4360),
(56139, ' AF-S DX Zoom-NIKKOR 18-135MM f/3.5-5.6G ED VR', 'Nikkor', 2380),
(56160, 'AF-S DX NIKKOR 18-105mm f/3.5-5.6G ED VR', 'Nikkor', 1780),
(56178, ' AF-S DX NIKKOR 18-200MM f/3.5-5.6G ED VR II', 'Nikkor', 2850),
(56190, 'AF-S NIKKOR 70-200MM f/4G ED VR Product', 'Nikkor', 8400),
(56222, 'AF-S DX Zoom-NIKKOR 18-300MM f/3.5-5.6G ED VR', 'Nikkor', 5490),
(56245, 'AF-S DX NIKKOR 55-300mm f/4.5-5.6G ED VR', 'Nikkor', 1800),
(56320, 'AF-S DX NIKKOR 55-200MM F/4-5.6G ED VR II', 'Nikkor', 1250),
(56505, 'AF-S NIKKOR 24-120mm f/4G ED VR', 'Nikkor', 4580),
(56629, 'AF-S DX Zoom-NIKKOR 16-85MM f/3.5-5.6G ED VR', 'Nikkor', 5000),
(56777, 'AF-S DX NIKKOR 24-70MM f/2.8G ED Product', 'Nikkor', 9800),
(61085, 'Canon EF 24-70mm f/2.8L II USM', 'Canon', 10600),
(61123, ' EF 16-35mm f/4L IS USM', 'Canon', 6200),
(61234, ' EF-S 10-18mm f/4.5-5.6 IS STM', 'Canon', 1700),
(61332, 'EF-S 18-55mm f/3.5-5.6 IS STM', 'Canon', 820),
(61432, 'RF 24-105mm f/4L IS USM', 'Canon', 5500),
(61600, 'EF-S 18-135mm f/3.5-5.6 IS USM', 'Canon', 2150),
(62234, 'EF 70-200mm f/4L IS II USM', 'Canon', 8500),
(62321, ' EF70-300mm f/4-5.6 IS II USM', 'Canon', 3200),
(62441, 'EF 100mm f/2.8L Macro IS STM ', 'Canon', 6000),
(64225, ' EF-S 55-250mm F4-5.6 IS STM', 'Canon', 1970),
(71122, '28-75mm F2.8 Di III RXD (Model A036)', 'Tamron', 6400),
(71342, 'SP AF90mm F/2.8 Di MARCO1:1 (Model 272E)', 'Tamron', 2500),
(72114, 'SP 24-70mm F/2.8 Di VC USD Model A007', 'Tamron', 5150),
(72234, 'SP 70-200mm F2.8 Di VC USD G2 (Model A025)', 'Tamron', 9020),
(72311, 'SP AF70-300mm F/4-5.6 Di VC USD (Model A005)', 'Tamron', 2280),
(72343, 'SP 70-200mm F/2.8 Di VC USD (A009)', 'Tamron', 6500),
(72344, '  70-210MM F/4 Di VC USD (Model A034)', 'Tamron', 1990),
(72355, 'SP 70-300mm f/4-5.6 Di VC USD (Model A030)', 'Tamron', 3350),
(73022, '18-200mm F3.5-6.3 Di III VC B011', 'Tamron', 3800),
(73088, '18-270mm F/3.5-6.3 Di II VC PZD (Model B008TS)', 'Tamron', 2290),
(74322, ' SP 45mm F1.8 Di VC USD (Model F013)', 'Tamron', 1990);

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `orderID` int(8) NOT NULL,
  `customerid` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `arrivalDate` date DEFAULT NULL,
  `status` varchar(15) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `orders`
--

INSERT INTO `orders` (`orderID`, `customerid`, `orderDate`, `arrivalDate`, `status`) VALUES
(28008900, 10003, '2019-04-01', NULL, 'not arrived'),
(40516491, 10001, '2019-03-03', '2019-03-09', 'Arrived'),
(72776087, 10004, '2019-03-27', '2019-04-03', 'Arrived'),
(80829625, 10002, '2019-02-28', '2019-03-04', 'Arrived');

-- --------------------------------------------------------

--
-- 資料表結構 `payment`
--

CREATE TABLE `payment` (
  `productID` int(8) NOT NULL,
  `amount` decimal(10,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `batteries`
--
ALTER TABLE `batteries`
  ADD PRIMARY KEY (`productID`);

--
-- 資料表索引 `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerid`);

--
-- 資料表索引 `dslr`
--
ALTER TABLE `dslr`
  ADD PRIMARY KEY (`productID`);

--
-- 資料表索引 `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`productID`);

--
-- 資料表索引 `lens`
--
ALTER TABLE `lens`
  ADD PRIMARY KEY (`productID`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`,`customerid`),
  ADD KEY `customerID` (`customerid`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `customers`
--
ALTER TABLE `customers`
  MODIFY `customerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10011;

--
-- 使用資料表 AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `customerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10005;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

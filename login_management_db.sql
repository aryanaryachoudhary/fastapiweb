-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 07, 2023 at 05:37 PM
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
-- Database: `login_management_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `createdon` datetime NOT NULL,
  `validtill` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `username`, `email`, `api_key`, `createdon`, `validtill`) VALUES
(1, 'aryan', 'aryan@gmail.com', 'c91321ecdb7c9a633cc60ba151ba5f954adbcb8d694b8d7d5147b08ccba6c752', '2023-06-04 13:47:32', '2024-06-03 13:47:32'),
(2, 'asdf', 'asd@asd.asd', '5cf268d429062799fdc77878f134b153c2ec26f5dd5e311e47dfb150ef5f10dd', '2023-06-04 14:28:37', '2024-06-03 14:28:37'),
(3, 'qwe', 'asd@asd.com', '981577f3306ba37f91418491afe81146e623d4682a25a4d70cd78ab77d81e863', '2023-06-04 14:29:05', '2024-06-03 14:29:05'),
(4, 'rty', 'zxc@asd.com', '9fa08827ecdb8d9403d94a33b17d8c69260faebbdb2a08ae296817b7c7fc24cb', '2023-06-04 16:32:31', '2024-06-03 16:32:31'),
(5, 'dfg', 'vbn@asg.com', 'gAAAAABkfHCcFs9Pd7or5amxoR-mvWXSDo0BVxfXPW9_pjY_pYBdLeKTyGwaWgmPrAmZBdMiij2B4dFCqPG15IWBuELnt55uvA==', '2023-06-04 16:38:12', '2024-06-03 16:38:12'),
(6, 'kfg', 'vfn@wsg.com', 'gAAAAABkfHPEBmMX94jDi9saZ-1NYp9P5UZ3rTW5di7O8lkZ7Mr6hBYkzuLn1e-LbkJjiDfpqvm5MCY-4YuKTr4HYlHpaFsDdQ==', '2023-06-04 16:51:41', '2024-06-03 16:51:41'),
(7, 'kkg', 'vfi@wrg.com', 'gAAAAABkfN2Xsk6H_Crl0888BxeToxhrEsAz1X6f49TQ3ByXVUB-aFJoWHomLkP039qRIEa5NhdEBw0T04YBMulULalRAb5uOQ==', '2023-06-05 00:23:11', '2024-06-04 00:23:11'),
(8, 'agh', 'agh@uhg.com', 'gAAAAABkfbFhYHenzl_dNDVnY1XxhSWI8oc90j8sWbsic6R2AdjlCfP7kRG1kN0VRHHyDqpLzSPWD1I33XPJRhiu-Bvcx97rrg==', '2023-06-05 15:26:49', '2024-06-04 15:26:49'),
(9, 'kljh', 'avdf@ght.com', 'gAAAAABkfb5P-qI-j-kKAlyYZG07zxoYuYi13aXK70KLOSTEcycCYpmVjlQm19W9IQURhIikwEPGjOQLBANXA_11vgi1y4-qDg==', '2023-06-05 16:22:02', '2024-06-04 16:22:02'),
(10, 'kljh', 'apdf@gkht.com', 'gAAAAABkfb73PZWhW5-c041xNSiBj5KCv6LCer54k4MgFBoBfE4Jzh_FR6dKM9WABaacFdTQBTlwer-HIcDAPm-MvELe_Dc4ow==', '2023-06-05 16:24:47', '2024-06-04 16:24:47'),
(11, 'kljjh', 'apjdf@gtkht.com', 'gAAAAABkfb_1s71V5jq2ClFyxoKhVCjz4dviP73g5T1DVSAoAthja2r_-XDIXM9NLLec-EIKvbXJKRakrExbM-A3eWaqI0-m-Q==', '2023-06-05 16:29:01', '2024-06-04 16:29:01'),
(12, 'klujjh', 'apjkdf@gtkht.com', 'gAAAAABkfcDpL8cYr1kS32S7M928gVQE6_wO0RBdJ4rAnDbho3hEq9ZnKZy7CL9P4JHFcmqWjPNgneIHZLNW_nw1EXJu88Ut5w==', '2023-06-05 16:33:05', '2024-06-04 16:33:05'),
(13, 'ksujjh', 'arjkdf@gtkht.com', 'gAAAAABkfcEX8zAgcisQMEfHdMNPi3H9tf0jo3OgyeavN-X-JgQGWt_b6OFun8GQn3B7ngwdO8hzR7RywnXDmH5kQf8uOqZcFQ==', '2023-06-05 16:33:51', '2024-06-04 16:33:51'),
(14, 'kkjh', 'auy@gtkht.com', 'gAAAAABkfcJI4drqY73BuvYcXj7_yiALhxJ9WFgVpN4gCD3bchPzhKgG2z5uaoKNOY7sDbfkkG44N_tNxjOKNYbiXyx0lx3o5w==', '2023-06-05 16:38:56', '2024-06-04 16:38:56'),
(15, 'akjh', 'bauy@ktkht.com', 'gAAAAABkfcPBKlz9uXqRDQxwbmIRPK0jWgZOmYE2QB0YIA-G0Zgy0jS23kneTYBaRqTNBFIQyXZ6o0myh2fB_Zl4qLnP_Ws-Mg==', '2023-06-05 16:45:14', '2024-06-04 16:45:14'),
(16, 'akwjh', 'bauwy@ktkht.com', 'gAAAAABkfcV1hkMZf4pTEBkVb6KAybpv9rDik2tYRMB-z_PGx36KGX0ZzacW1kvaofXhH3BQT_noBptsvGcne9sR3bl4jf4H1g==', '2023-06-05 16:52:47', '2024-06-04 16:52:47'),
(18, 'akwjhdd', 'bauwy@ktkht.comdd', 'gAAAAABkfcffdxvvIXyhxzWim186WVqedknffrCwfIsaqQzOJvJJAi3TjzejK2iDmyaplaJpcEeLNHfwkiK0e39tss_lJYAajg==', '2023-06-05 17:03:01', '2024-06-04 17:03:01'),
(20, 'akwjhddss', 'bauwy@ktkht.comddss', 'gAAAAABkfcqD2uaprh0Dy2BhXirfzJCgbsOQTRF6acisbchfkWWlFMc2Ykn6vuQTfDwenkEnFzdRhoptcutz3rAMGqVhpFkLNw==', '2023-06-05 17:14:03', '2024-06-04 17:14:03'),
(21, 'akwjhddssww', 'bauwy@ktkht.comddssww', 'gAAAAABkfdNefD2rYWlIXOmNEV-h-1vzIC6qDu9aHxPlLKVKjHp3NCziXOl5PrQGeBTB_4JJala9Ffm1X_r2UaRLd3ouDDO8OQ==', '2023-06-05 17:51:55', '2024-06-04 17:51:53'),
(23, 'akwjhddsswwww', 'bauwy@ktkht.comddsswwww', 'gAAAAABkfdPVjvENPN1afEFK0u4F4BOM42G0j8HFsT4ZKlx1q26RRtC8XB9G1NmyCpJegRIYa_fG2cHO2vXWNE2f6bbVKod9Stf3azQikRB_jCJvxSrQg_yGHrNQptKORlnCoMIKqXmFrGBp71cCETVU3GJ3avdTWUbs5-c9lhga-EbToFyWois=', '2023-06-05 17:53:49', '2024-06-04 17:53:49'),
(24, 'tes', 'faesed@ktkht.comddsswwww', '$pbkdf2-sha256$29000$dK7VGgPAuDcGAABgbE1pzQ$eHI1OZAte3QDZ6LeRuHGY291dJf.Rx4IhaH11jFTx3w', '2023-06-05 18:05:01', '2024-06-04 18:05:00'),
(27, 'efe', 'efwf@ktkht.comddsswwww', '$pbkdf2-sha256$29000$TonRmtO6d44RYqxVau3d2w$fG3LNBY0DXxWxpw0qinvSCJCm9UEae2/o7/fQMqSK54', '2023-06-05 18:07:08', '2024-06-04 18:07:08'),
(28, 'egfe', 'efwqf@ktfkht.comddsswwww', 'gAAAAABkfuUxs-yB-UTpld8txQll9HJPJtx3RFBr9Ge0lN51YT7BtuhtS1PZfMR1ZzfyEOSoMbPtt3X4vGO6o-U_LDkPggB_S0wZjNFomrLdlcQ0kK6Mutc8feRc_EEUwwKqxgzoaHbgcUqL5W7jw4B0Xo3BXqA9PDRXKVtsmyS58MUMtmDaH24=', '2023-06-06 13:20:13', '2024-06-05 13:20:13'),
(29, 'kfksf', 'artyy@yfg.com', 'gAAAAABkfuV95HDFskEJAiii6FiXFgeUljYyeYgOGF7wrqo3LhmEXZjbILXsys0CgGLy-Gz2SdZ9HnM1_Hwqqz3O7-R7tbzPDqy2bFtu-q87e1RXhpIk_jNHjELVIXPFvtpsfYwJ2t3V-bjV3aer8roNTe8ZNfOuUDqYjjIn0axHsHFihAlibgs=', '2023-06-06 13:21:25', '2024-06-05 13:21:25'),
(30, 'egfesss', 'ss@ktfkht.comddsswwww', '$pbkdf2-sha256$29000$ao2xNub8f2.t1RqD0JozBg$AmHVsaSh2V.25uEapSoz/b2hiVTTQjfVUXuPB/na520', '2023-06-06 14:35:45', '2024-06-05 14:35:40'),
(31, 'egfessss', 'ssa@ktfkht.comddsswwww', 'gAAAAABkfvgjbpNdoGkTUPn4OivAE-JlQrAgl-J1ytzAiV-Q4VY_Dpfh-ik0obql_iU0Xjacfq7y7mFCKoY1Lc3Kmx1DtM7fVg==', '2023-06-06 14:40:59', '2024-06-05 14:40:59'),
(32, 'egfessQss', 'sQsa@ktfkht.comddsswwww', 'gAAAAABkfvjH-HxysggWI9dxtYVtRVRRmjCt0ad_SeQ2WtKr8ymM05uhl-P49-Sm2sNpQfiAusGvtX9_iPox-JNrQUSOYlVYpA==', '2023-06-06 14:43:43', '2024-06-05 14:43:43'),
(33, 'sssaqq', 'sQsa@ktfkht.comddsswwwws', '8HbzLf0BG3rPLShfWMOIog==', '2023-06-06 15:24:20', '2024-06-05 15:24:20'),
(34, 'aryanarya', 'aryan@arya.ccom', '1GbMyAKaX383ZuCpCfhJ3w==', '2023-06-06 15:28:32', '2024-06-05 15:28:32'),
(35, 'arvia', 'acvbhn@rttyro.com', 'sxKkkBwUbKC+wY34wyliGw==', '2023-06-06 16:12:28', '2024-06-05 16:12:28'),
(36, 'aruyta', 'aghjhn@rttypo.com', 'nva/YP/DSBxLb0L36B/lsw==', '2023-06-06 16:31:02', '2024-06-05 16:30:58'),
(37, 'ariyta', 'agppjhn@rttrrpo.com', '1kLd9WEh9qkmyy+PohYB6g==', '2023-06-06 17:16:50', '2024-06-05 17:16:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

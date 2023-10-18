-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2022 at 04:09 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ketering_sluzba`
--

-- --------------------------------------------------------

--
-- Table structure for table `agencija`
--

CREATE TABLE `agencija` (
  `idAgencije` int(11) NOT NULL,
  `naziv` varchar(30) NOT NULL,
  `opis` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agencija`
--

INSERT INTO `agencija` (`idAgencije`, `naziv`, `opis`) VALUES
(1, 'Agencija \"Kod Dače\"', 'Agencija koja je prvobitno počela kao mali lokal kome je narod dao ime \"Kod Dače \". To ime je i dan danas zadržano, iako je taj mali lokal postao velika ketering služba. I dalje narod voli da sedne kod Dače, ali još više voli što se Dačina hrana sada može naći na svim proslavama i veseljima. Pregledajte i poručite usluge koje nudi Dača, i nećete biti iznevereni.'),
(2, 'Agencija \"Pinokio\"', 'Pinokio je poslastičarnica koja je otvorena 2012 godine, i najviše se bavi izradom slatkiša, kolača i torti za dečije rođendane. Pored slatkiša su uvedeni i slaniši od 2015 godine, i tada postaje jako popularna ketering služba za dečije rođendane. Pregledajte i poručite neku od Pinokiovih usluga, verujte nam da Vas neće izneveriti.'),
(3, 'Agencija \"Poseban dan\"', 'Ketering agencija specijalizovana za svadbe. Zašto naziv \"Poseban dan\"? Jer smatramo da je to jedan od najposebnijih i jedan od najlepših dana u Vašem životu. I zato se trudimo da Vas naš naziv podseća na to. Isto se i trudimo da svaka od naših usluga bude kvalitetna, ukusna i lepo aranžirana. Dopustite nam da Vam ulepšamo vaše slavlje kako mi to najbolje umemo!'),
(4, 'Agencija \"Korporacija\"', 'Potreban Vam je ketering za poslovnu žurku ili važan biznis dogadjaj? Od 2005. godine smo specijalizovani samo za to. Pregledajte naše usluge i videćete zašto smo već godinama na odličnom glasu.'),
(5, 'Agencija \"Family\"', 'U današnjem brzom svetu znamo koliko vremena oduzima kuvanje i spremanje toplog obroka za Vašu porodicu. Dopustite nam da Vam pomognemo i da Vašem domu obezbedimo doručak, ručak ili večeru za Vas i vaše najmilije. '),
(6, 'Agencija \"Ketering za slave\"', 'Nemate vremena da organizujete bogatu trpezu za Vašu slavu? Tu smo da Vam pomognemo. \r\nDopustite sebi da uživate sa gostima bez obaveze spremanja predjela, jela i slatkiša.  ');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `idKorisnika` int(11) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `Adresa` varchar(50) NOT NULL,
  `Grad` varchar(30) NOT NULL,
  `korisnickoIme` varchar(30) NOT NULL,
  `lozinka` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `poeni` int(30) NOT NULL DEFAULT 100,
  `privilegije` enum('0','1','2','3') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`idKorisnika`, `ime`, `prezime`, `Adresa`, `Grad`, `korisnickoIme`, `lozinka`, `email`, `poeni`, `privilegije`) VALUES
(9, 'Kristina', 'Gagic', '', '', 'gagickristina', 'kris123', 'kgagic999@gmail.com', 100, '3'),
(22, 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin@gmail.com', 300, '3'),
(23, 'menadzer', 'menadzer', 'menadzer', 'menadzer', 'menadzer', 'menadzer', 'menadzer@gmail.com', 300, '2'),
(24, 'ime korisnika', 'prezime korisnika', 'adresa korisnika', 'grad korisnika', 'korisnik', 'korisnik', 'korisnik@gmail.com', 300, '1'),
(26, 'ime korisnika2', 'prezime korisnika2', 'adresa korisnika2', 'grad korisnika2', 'korisnik2', 'korisnik2', 'korisnik2@gmail.com', 200, '1');

-- --------------------------------------------------------

--
-- Table structure for table `rezervacija`
--

CREATE TABLE `rezervacija` (
  `idRezervacije` int(11) NOT NULL,
  `idKorisnika` int(11) NOT NULL,
  `idUsluge` int(11) NOT NULL,
  `cena` int(11) NOT NULL,
  `poruka` varchar(300) NOT NULL,
  `datum` varchar(20) NOT NULL,
  `korisnickoIme` varchar(30) NOT NULL,
  `adresa` varchar(100) NOT NULL,
  `grad` varchar(50) NOT NULL,
  `naziv` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rezervacija`
--

INSERT INTO `rezervacija` (`idRezervacije`, `idKorisnika`, `idUsluge`, `cena`, `poruka`, `datum`, `korisnickoIme`, `adresa`, `grad`, `naziv`) VALUES
(122, 26, 3, 9500, '', '2022-08-30', 'korisnik2', 'adresa korisnika2', 'grad korisnika2', 'Mini rođendanski ketering'),
(124, 24, 5, 15000, '', '2022-09-20', 'korisnik', 'adresa korisnika', 'grad korisnika', 'Srednji rođendanski ketering'),
(125, 24, 5, 15000, '', '2022-09-14', 'korisnik', 'adresa korisnika', 'grad korisnika', 'Srednji rođendanski ketering');

-- --------------------------------------------------------

--
-- Table structure for table `usluga`
--

CREATE TABLE `usluga` (
  `idUsluge` int(11) NOT NULL,
  `naziv` varchar(30) NOT NULL,
  `opis` mediumtext NOT NULL,
  `cena` int(30) NOT NULL,
  `idAgen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usluga`
--

INSERT INTO `usluga` (`idUsluge`, `naziv`, `opis`, `cena`, `idAgen`) VALUES
(1, 'Srednji ketering', 'Pravite žurku do 20 gostiju?\r\nOva usluga je odličan izbor za vas!\r\nOd slanog posluženja ubrajamo:\r\n- 10 ljutih kobasica,\r\n- 10 blagih kobasica,\r\n- 1 kg pomfrita, \r\n- 1 kg pekarskog krompira,\r\n- 2 kg lepinjica,\r\n- 600g kupus salate,\r\n- priloge (senf, kečap, majonez).\r\nOd slatkog posluženja ubrajamo:\r\n- 10 čokoladnih mafina, \r\n- 10 voćnih mafina, \r\n- 3kg isečene lubenice.', 15500, 1),
(2, 'Ketering \"Malo ali vredno\"', 'Pravite malu svadbu, samo sa najbližim gostima (do 50 gostiju)? \r\nMislimo da je ovo super opcija za vas.\r\nOd slanog posluženja ubrajamo:\r\n- 10kg mešanog suvog mesa,\r\n- 10kg sečene slane torte, \r\n- 6kg kiflica,\r\n- 6kg žužu-a,\r\n- 6kg projica, \r\n- 10kg slanih rolata sa urnebesom, \r\n- 50kg kupus salate,\r\n- 50 sarmi, \r\n- 30kg prasetine,\r\n- 30kg junetine,\r\n- 30 sečenih vekni hleba.\r\nOd slanog posluženja ubrajamo:\r\n- Mafin torta od 5kg,\r\n- Torta sa orasima od 5kg,\r\n- Rafaelo torta od 5kg,\r\n- Moskva šnit od 5kg,\r\n- Reforma od 5kg. \r\n', 100000, 3),
(3, 'Mini rođendanski ketering', 'Organizujete malu proslavu dečijeg rođendana?\r\nPreporučujemo Vam ovu uslugu. \r\nSlani meni:\r\n- 1kg mini sendviča,\r\n- 500g kiflica,\r\n- 500g projica, \r\n- 500g žužu-a,\r\n- 2kg pomfrita,\r\n- 500g mini pica.\r\nSlatki meni:\r\n- 1kg mešanih kolačića, \r\n- 1kg mešanog isečenog sezonskog voća,\r\n- Rođendanska torta sa orasima od 3kg\r\n', 9500, 2),
(4, 'Ketering \"Utakmica\"', 'Organizujete malo prijateljsko okupljanje za gledanje utakmice u Vašem domu?\r\nPreporučujemo Vam ovu uslugu.\r\nSlano posluženje:\r\n- 500g kiflica,\r\n- 1kg burgijica,\r\n- 600g žužu-a,\r\n-3kg mešanog suvog mesa (pečenica, kulen, čajna, slanina),\r\n- 1kg kačkavalja, \r\n- prilozi (senf, kečap, majonez).\r\nSlatko posluženje:\r\n- 10 mešanih mafina (čokolani i voćni),\r\n- 1kg mešanih kolačića.\r\n', 8500, 1),
(5, 'Srednji rođendanski ketering', 'Organizujete proslavu dečijeg rodjendana do 30 gostiju? Preporučujemo Vam ovu uslugu. Slani meni: - 4kg mini sendviča, - 1kg kiflica, - 1kg projica, - 2kg žužu-a, - 3kg pomfrita, - 2g mini pica. Slatki meni: - 3kg mešanih kolačića, - 3kg mešanog isečenog sezonskog voća, - Rođendanska torta sa orasima od 10kg.', 15000, 2),
(6, 'Ketering \"Taman\"', 'Pravite svadbu do 150 gostiju? Mislimo da je ovo super opcija za vas. Od slanog posluženja ubrajamo: - 30kg mešanog suvog mesa, - 30kg sečene slane torte, - 20kg kiflica, - 20kg žužu-a, - 20kg projica, - 30kg slanih rolata sa urnebesom, - 100kg kupus salate, - 150 sarmi, - 180kg prasećeg pečenja, - 180kg junećeg pečenja, - 90 sečenih vekni hleba. Od slanog posluženja ubrajamo: - Mafin torta od 15kg, - Torta sa orasima od 15kg, - Rafaelo torta od 15kg, - Moskva šnit od 15kg, - Reforma od 15kg.', 200000, 3),
(7, 'Veliki rođendanski ketering', 'Organizujete veliku proslavu dečijeg rođendana uz roditelje malih gostiju? Preporučujemo Vam ovu uslugu. Slani meni: - 4kg mini sendviča, - 1kg kiflica, - 1kg projica, - 2kg žužu-a, - 3kg pomfrita, - 2kg mini pica, - 5kg mešanog suvog mesa, - 2kg kačkavalja, - 1kg kupus salate, - 1kg ruske salate, - 3kg mini burgera. Slatki meni: - 3kg mešanih kolačića, - 3kg mešanog isečenog sezonskog voća, - 20 mešanih mafina (čokoladni i voćni), - Rođendanska torta sa orasima od 10kg, - Rođendanska mafin torta od 5kg.', 25500, 2),
(11, 'Švedski sto \"Mini\"', 'Slani meni:\r\n- 1kg brusketa sa pizza sosom i bosiljkom,\r\n- 1kg brusketa sa pateom od piletine, \r\n- 2kg pitica sa pečurkama, \r\n- 2kg, spring rools-a sa kineskim povrćem,\r\n- 2kg, pohovanog kačkavalja, \r\n- 4kg, mešanog mesa, \r\n- 500g ruske salate, \r\n- 500g šopske salate, \r\n- 2kg kombinacije mini peciva. \r\nSlatki meni:\r\n- 10 tiramisu kolača u čašama, \r\n- 10 čokoladnih museva u čašama, \r\n- 10 voćnih salatica u čašama (koristimo sezonsko voće).', 10500, 4),
(12, 'Doručak', 'Slatki meni: \r\n- 500g kajagne,\r\n- 200g slanine, \r\n- 200g pečenice\r\n- 5 svežih lepinja, \r\n- 200g šopske salate, \r\n- 500g žužu-a, \r\nSlatki meni:\r\n- 5 slatkih prženica sa kremom, \r\n- 300g mini rolata sa džemom od jagode. ', 3500, 5),
(14, 'Veliki ketering', 'Pravite žurku do 60 gostiju? Ova usluga je odličan izbor za vas! Od slanog posluženja ubrajamo: - 30 ljutih kobasica, - 30 blagih kobasica, - 20 kg pomfrita, - 20 kg pekarskog krompira, - 6 kg lepinjica, - 5g kupus salate, - priloge (senf, kečap, majonez). Od slatkog posluženja ubrajamo: - 30 čokoladnih mafina, - 30 voćnih mafina, - 20kg isečene lubenice, -30kg mešanih kolačića.', 30000, 1),
(15, 'Mini ketering', 'Pravite malo porodično okupljanje? Ova usluga je odličan izbor za vas! Od slanog posluženja ubrajamo: - 5 ljutih kobasica, - 5 blagih kobasica, - 500g pomfrita, - 500g pekarskog krompira, - 1 kg lepinjica, - 350g kupus salate, - priloge (senf, kečap, majonez). Od slatkog posluženja ubrajamo: - 5 čokoladnih mafina, - 5 voćnih mafina, - 1,5kg isečene lubenice.', 7000, 1),
(16, 'Švedski sto \"Srednji\"', 'Slani meni: - 2kg brusketa sa pizza sosom i bosiljkom, - 2kg brusketa sa pateom od piletine, - 4kg pitica sa pečurkama, - 4kg, spring rools-a sa kineskim povrćem, - 4kg, pohovanog kačkavalja, - 8kg, mešanog mesa, - 1kg ruske salate, - 1kg šopske salate, - 4kg kombinacije mini peciva. Slatki meni: - 20 tiramisu kolača u čašama, - 20 čokoladnih museva u čašama, - 20 voćnih salatica u čašama (koristimo sezonsko voće).', 25000, 4),
(17, 'Švedski sto \"Veliki\"', 'Slani meni: - 4kg brusketa sa pizza sosom i bosiljkom, - 4kg brusketa sa pateom od piletine, - 8kg pitica sa pečurkama, - 8kg, spring rools-a sa kineskim povrćem, - 8kg, pohovanog kačkavalja, - 16kg, mešanog mesa, - 2kg ruske salate, - 2kg šopske salate, - 8kg kombinacije mini peciva. Slatki meni: - 25 tiramisu kolača u čašama, - 25 čokoladnih museva u čašama, - 30 voćnih salatica u čašama (koristimo sezonsko voće).', 50000, 4),
(18, 'Ručak', 'Slani meni:\r\n- 2l teleće čorbe, \r\n- 300g sarmica sa zeljem, \r\n- 500g musake sa tikvicama, \r\n- 500g mešanog mesa sa roštilja, \r\n- 5 svežih lepinja, \r\n- 300g kupus salate.\r\nSlatki meni:\r\n- 500g bakinog kolača,\r\n- 8 slatkih palačinki sa kremom.\r\n', 5500, 5),
(19, 'Večera', 'Slani meni:\r\n- 1kg rižota sa piletinom,\r\n- 3 karađorđeve šnicle,\r\n- 3 porcije taljatela sa pečurkama, \r\n- 5 svežih lepinja.\r\nSladak meni:\r\n- 5 velikih knedli sa kremom i višnjama, \r\n- 5 voćnih salata u čaši, \r\n- 5 parčića čiz kejka. \r\n', 7200, 5),
(20, 'Paket \"Mrsna slava\"', 'Slani meni:\r\n- 5kg projica sa kajmakom i domaćom pršutom,\r\n- 5kg kiflica sa kraškim vratom,\r\n- 7kg slane torte sa kajmakom i pečenicom, \r\n- 7kg mešanog suvog mesa, \r\n- 8kg jagnjećeg pečenja, \r\n- 8kg prasećeg pečenja, \r\n- 2kg kupus salate, \r\n- 2 kg šopske salate, \r\n- 20 svežih lepinja, \r\n- 10l teleće čorbe.\r\n- 30 sarmi.\r\nSladak meni:\r\n- 5kg mešanih slavskih kolačića,\r\n- Torta sa višnjama od 5kg, \r\n- Čokoladna torta od 5 kg. ', 45000, 6),
(21, 'Paket \"Posna slava\"', 'Slani meni: \r\n- 5 kg korpica sa tunjevinom u povrću i maslinama, \r\n- 5kg rolovanih grilovanih tikivica sa dimljenim biljnim kačkavaljem, \r\n- 7 kg slane torte sa prazilukom, pečurkama i ribom, \r\n- 7 kg surimi štapića sa gamborima, \r\n- 4kg posne ruske salate, \r\n- 10 kg fileta oslića prženih u kukuruznom brašnu, \r\n- 10 kg fileta soma, \r\n- 4kg krompir salate, \r\n- 30 posnih sarmi, \r\n- 7kg prebranca, \r\n- 20 svežih lepinja.\r\nSladak meni:\r\n- 5kg posnih mešanih slavskih kolačića, - Posna torta sa višnjama od 10kg.', 47000, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencija`
--
ALTER TABLE `agencija`
  ADD PRIMARY KEY (`idAgencije`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`idKorisnika`);

--
-- Indexes for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD PRIMARY KEY (`idRezervacije`),
  ADD KEY `rezervacija_ibfk_1` (`idKorisnika`),
  ADD KEY `rezervacija_ibfk_2` (`idUsluge`);

--
-- Indexes for table `usluga`
--
ALTER TABLE `usluga`
  ADD PRIMARY KEY (`idUsluge`),
  ADD KEY `idAgencije` (`idAgen`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agencija`
--
ALTER TABLE `agencija`
  MODIFY `idAgencije` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `idKorisnika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `rezervacija`
--
ALTER TABLE `rezervacija`
  MODIFY `idRezervacije` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `usluga`
--
ALTER TABLE `usluga`
  MODIFY `idUsluge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD CONSTRAINT `rezervacija_ibfk_1` FOREIGN KEY (`idKorisnika`) REFERENCES `korisnik` (`idKorisnika`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rezervacija_ibfk_2` FOREIGN KEY (`idUsluge`) REFERENCES `usluga` (`idUsluge`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usluga`
--
ALTER TABLE `usluga`
  ADD CONSTRAINT `usluga_ibfk_1` FOREIGN KEY (`idAgen`) REFERENCES `agencija` (`idAgencije`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

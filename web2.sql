-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Nov 08. 18:11
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `web2`
--
CREATE DATABASE IF NOT EXISTS `web2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `web2`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
                                `id` int(10) UNSIGNED NOT NULL,
                                `csaladi_nev` varchar(45) NOT NULL DEFAULT '',
                                `utonev` varchar(45) NOT NULL DEFAULT '',
                                `bejelentkezes` varchar(12) NOT NULL DEFAULT '',
                                `jelszo` varchar(40) NOT NULL DEFAULT '',
                                `jogosultsag` varchar(3) NOT NULL DEFAULT '_1_'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `csaladi_nev`, `utonev`, `bejelentkezes`, `jelszo`, `jogosultsag`) VALUES
                                                                                                         (1, 'Rendszer', 'Admin', 'Admin', sha1('admin'), '__1'),
                                                                                                         (2, 'Proba', 'Felhasznalo', 'Probauser12', sha1('Probauser12'), '_1_');


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hir`
--

CREATE TABLE `hir` (
                       `id` int(11) NOT NULL,
                       `cim` varchar(100) NOT NULL,
                       `bevezeto` varchar(2000) NOT NULL,
                       `torzs` mediumtext NOT NULL,
                       `ido` timestamp NOT NULL DEFAULT current_timestamp(),
                       `felhasznalo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `hir`
--

INSERT INTO `hir` (`id`, `cim`, `bevezeto`, `torzs`, `ido`, `felhasznalo_id`) VALUES
                                                                                  (1, 'Munkalehetőség', 'Munkalehetőség a pizzériánkban', 'MUNKALEHETŐSÉG  ! Szeretnéd megtanulni, vagy tökéletesítenéd tudásodat a pizzakészítésben ? Hogyan kell nápolyi pizzát sütni valódi nápolyi kemencében ?\r\nEz most elérhető ! Hosszú távra tervezünk . Olyan munkavállalók jelentkezését várjuk, akik valóban dolgozni szeretnének és legalább 1 éves munkában gondolkoznak.', '2023-10-22 18:55:38', 1),
                                                                                  (2, 'Újdonság', 'Újdonság a kínálatunkban', 'Könnyed Pizzára vágysz? Kóstold meg a fatüzeléses Pizza Italianot! San Marzano paradicsomszósz , Fior di latte sajt ,  \r\nbazsalikom , parmezán  és a krémes bivaly  mozzarella teszi igazán különlegessé. \r\nDe vigyázz ! Mert könnyen a kedvenceddé válhat! ', '2023-10-22 18:58:20', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles`
--

CREATE TABLE `rendeles` (
                       `pizzanev` varchar(100) NOT NULL,
                       `darab` int(11) NOT NULL,
                       `felvetel` varchar(100) NOT NULL,
                       `kiszallitas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendeles` (utolsó 12 rendelés)
--

INSERT INTO `rendeles` (`pizzanev`, `darab`, `felvetel`, `kiszallitas`) VALUES
                                                                                  ('Popey',2, '2005.11.12 11:21:00', '2005.11.12 12:11:00'),
                                                                                  ('Kagylós',1, '2005.11.12 11:41:00', '2005.11.12 12:26:00'),
                                                                                  ('Barbecue chicken',1, '2005.11.12 12:38:00', '2005.11.12 13:02:00'),
                                                                                  ('Röfi',1, '2005.11.12 13:18:00', '2005.11.12 13:58:00'),
                                                                                  ('Tündi kedvence',2, '2005.11.12 13:44:00', '2005.11.12 16:53:00'),
                                                                                  ('Hercegnő',2, '2005.11.12 14:10:00', '2005.11.12 14:57:00'),
                                                                                  ('Mixi',1, '2005.11.12 14:20:00', '2005.11.12 16:25:00'),
                                                                                  ('Ráki',3, '2005.11.12 14:51:00', '2005.11.12 17:06:00'),
                                                                                  ('Szőke kapitány',1, '2005.11.12 15:13:00', '2005.11.12 17:12:00'),
                                                                                  ('Kagylós',1, '2005.11.12 15:42:00', '2005.11.12 16:48:00'),
                                                                                  ('Sonkás',1, '2005.11.12 16:31:00', '2005.11.12 16:53:00'),
                                                                                  ('Excellent',1, '2005.11.12 17:01:00', '2005.11.12 19:41:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menu`
--

CREATE TABLE `menu` (
                        `url` varchar(30) NOT NULL,
                        `nev` varchar(30) NOT NULL,
                        `szulo` varchar(30) NOT NULL,
                        `jogosultsag` varchar(3) NOT NULL,
                        `sorrend` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `menu`
--

INSERT INTO `menu` (`url`, `nev`, `szulo`, `jogosultsag`, `sorrend`) VALUES
                                                                         ('admin', 'Admin', '', '001', 80),
                                                                         ('belepes', 'Belépés', '', '100', 60),
                                                                         ('pizzaink', 'Pizzáink', '', '111', 20),
                                                                         ('hirek', 'Hírek', '', '111', 20),
                                                                         ('kilepes', 'Kilépés', '', '011', 70),
                                                                         ('nyitolap', 'Nyitólap', '', '111', 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzak`
--

CREATE TABLE `pizzak` (
                          `nev` varchar(255) NOT NULL,
                          `kategorianev` varchar(255) NOT NULL,
                          `vegetarianus` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `pizzak`
--

INSERT INTO `pizzak` (`nev`, `kategorianev`, `vegetarianus`) VALUES
                                                                 ('Áfonyás', 'király', 0),
                                                                 ('Babos', 'lovag', 0),
                                                                 ('Barbecue chicken', 'lovag', 0),
                                                                 ('Betyáros', 'király', 0),
                                                                 ('Caribi', 'apród', 0),
                                                                 ('Country', 'király', 0),
                                                                 ('Csabesz', 'király', 0),
                                                                 ('Csupa sajt', 'lovag', 1),
                                                                 ('Erdő kapitánya', 'apród', 0),
                                                                 ('Erős János', 'lovag', 0),
                                                                 ('Excellent', 'király', 0),
                                                                 ('Főnök kedvence', 'lovag', 0),
                                                                 ('Francia', 'főnemes', 0),
                                                                 ('Frankfurti', 'király', 0),
                                                                 ('Füstös', 'lovag', 0),
                                                                 ('Gino', 'király', 0),
                                                                 ('Gombás', 'apród', 1),
                                                                 ('Góré', 'lovag', 0),
                                                                 ('Görög', 'király', 0),
                                                                 ('Gyros pizza', 'király', 0),
                                                                 ('HamAndEggs', 'lovag', 0),
                                                                 ('Hamm', 'lovag', 0),
                                                                 ('Hawaii', 'főnemes', 0),
                                                                 ('Hellas', 'király', 0),
                                                                 ('Hercegnő', 'király', 0),
                                                                 ('Ilike', 'lovag', 0),
                                                                 ('Ínyenc', 'lovag', 0),
                                                                 ('Jázmin álma', 'lovag', 0),
                                                                 ('Jobbágy', 'király', 0),
                                                                 ('Juhtúrós', 'lovag', 0),
                                                                 ('Kagylós', 'király', 0),
                                                                 ('Kétszínű', 'lovag', 0),
                                                                 ('Kiadós', 'király', 0),
                                                                 ('Király pizza', 'király', 0),
                                                                 ('Kívánság', 'lovag', 1),
                                                                 ('Kolbászos', 'apród', 0),
                                                                 ('Lagúna', 'király', 1),
                                                                 ('Lecsó', 'király', 0),
                                                                 ('Maffiózó', 'lovag', 0),
                                                                 ('Magvas', 'király', 1),
                                                                 ('Magyaros', 'lovag', 0),
                                                                 ('Máj Fair Lady', 'király', 0),
                                                                 ('Mamma fia', 'király', 0),
                                                                 ('Mexikói', 'főnemes', 0),
                                                                 ('Mixi', 'főnemes', 1),
                                                                 ('Nikó', 'király', 0),
                                                                 ('Nordic', 'király', 0),
                                                                 ('Nyuszó-Muszó', 'király', 0),
                                                                 ('Pacalos', 'lovag', 0),
                                                                 ('Pástétomos', 'király', 0),
                                                                 ('Pásztor', 'lovag', 0),
                                                                 ('Pipis', 'lovag', 0),
                                                                 ('Popey', 'király', 0),
                                                                 ('Quattro', 'király', 0),
                                                                 ('Ráki', 'király', 0),
                                                                 ('Rettenetes magyar', 'lovag', 0),
                                                                 ('Röfi', 'király', 0),
                                                                 ('Sajtos', 'apród', 1),
                                                                 ('So-ku', 'apród', 0),
                                                                 ('Son-go-ku', 'főnemes', 1),
                                                                 ('Sonkás', 'apród', 0),
                                                                 ('Spanyol', 'király', 0),
                                                                 ('Spencer', 'főnemes', 0),
                                                                 ('Szalámis', 'apród', 0),
                                                                 ('Szardíniás', 'lovag', 0),
                                                                 ('Szerzetes', 'király', 0),
                                                                 ('Szőke kapitány', 'király', 0),
                                                                 ('Tenger gyümölcsei', 'király', 0),
                                                                 ('Tonhalas', 'lovag', 0),
                                                                 ('Törperős', 'lovag', 0),
                                                                 ('Tündi kedvence', 'király', 0),
                                                                 ('Tüzes halál', 'király', 0),
                                                                 ('Vega', 'lovag', 1),
                                                                 ('Zöldike', 'főnemes', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzakategoriak`
--

CREATE TABLE `pizzakategoriak` (
                                   `nev` varchar(255) NOT NULL,
                                   `ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `pizzakategoriak`
--

INSERT INTO `pizzakategoriak` (`nev`, `ar`) VALUES
                                                ('apród', 850),
                                                ('főnemes', 950),
                                                ('király', 1250),
                                                ('lovag', 1150);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `velemeny`
--

CREATE TABLE `velemeny` (
                            `id` int(11) NOT NULL,
                            `torzs` mediumtext NOT NULL,
                            `ido` timestamp NOT NULL DEFAULT current_timestamp(),
                            `hir_id` int(11) NOT NULL,
                            `felhasznalo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `velemeny`
--

INSERT INTO `velemeny` (`id`, `torzs`, `ido`, `hir_id`, `felhasznalo_id`) VALUES
                                                                              (1, 'Alig várom hogy megkóstoljam!', '2023-10-26 18:44:19', 2, 2),
                                                                              (3, '...', '2023-11-08 17:03:27', 2, 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
    ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `hir`
--
ALTER TABLE `hir`
    ADD PRIMARY KEY (`id`),
  ADD KEY `ido` (`ido`);

--
-- A tábla indexei `menu`
--
ALTER TABLE `menu`
    ADD PRIMARY KEY (`url`);

--
-- A tábla indexei `pizzak`
--
ALTER TABLE `pizzak`
    ADD PRIMARY KEY (`nev`);

--
-- A tábla indexei `pizzakategoriak`
--
ALTER TABLE `pizzakategoriak`
    ADD PRIMARY KEY (`nev`);

--
-- A tábla indexei `velemeny`
--
ALTER TABLE `velemeny`
    ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `hir`
--
ALTER TABLE `hir`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `velemeny`
--
ALTER TABLE `velemeny`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

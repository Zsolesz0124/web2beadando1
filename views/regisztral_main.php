<?php

$csaladi_nev = $_POST["csaladi_nev"];
$utonev = $_POST["utonev"];
$jelszo = $_POST["jelszo"];
$rank = 'felhasznalo';
$jog = '_1_';

$connection = Database::getConnection();

$sql = "INSERT INTO felhasznalok (id, csaladi_nev, utonev, bejelentkezes, jelszo, jogosultsag) VALUES (11 ,'Olah', 'Zsolt', 'felhasznalo', 'fsdf2df5fe54fe5fdf4s8e', '_1_')";

if ($connection->query($sql) === TRUE) {
    echo "Sikeres regisztráció!";
} else {
    echo "Hiba: " . $sql . "<br>" . $connection->error;
}
echo "VALAMI";
// Adatbázis kapcsolat lezárása
$connection->close();
?>
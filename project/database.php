<?php

$_db_host = "db_server";
$_db_username = "mcbuildhelper";
$_db_password = "mcbuildhelper#3001!";
$_db_datenbank = "mcbuildhelper";

$conn = mysqli_connect($_db_host, $_db_username, $_db_password, $_db_datenbank);

if ($conn->connect_error) {
    echo "keine Verbindung";
    die("Connection failed: " . $conn->connect_error);
} else {
    //echo "Verbindung steht aktuell";
}

//$conn->close();

?>
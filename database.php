<?php

$_db_host = "db_server";
$_db_username = "web";
$_db_password = "database-password";
$_db_datenbank = "web";

$conn = mysqli_connect($_db_host, $_db_username, $_db_password, $_db_datenbank);

if ($conn->connect_error) {
    echo "keine Verbindung";
    die("Connection failed: " . $conn->connect_error);
} else {
    //echo "Verbindung steht aktuell";
}

//$conn->close();

?>
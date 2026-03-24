<?php

session_start();

require_once '../database.php';

if(!empty($_POST['submit'])) {
    $_username = $_POST['username'];
    $_password = $_POST['password'];

    $stmt = $conn->prepare(
        "SELECT * FROM user WHERE username = ? LIMIT 1"
    );
    $stmt->bind_param("s", $_username);
    $stmt->execute();

    $res = $stmt->get_result();

    if($res->num_rows === 1) {
        $user = $res->fetch_assoc();

        if(password_verify($_password, $user['password'])) {
            $_SESSION['login'] = 1;
            $_SESSION['user'] = $user;
        } else {
            include '../pages/login.html';
            echo "<div id=\"errorMessage\">Wrong password.<br></div>";
        }
    } else {
        include '../pages/login.html';
        echo "<div id=\"errorMessage\">Username not found.<br></div>";
    }
}

$conn->close();

if(is_array($_SESSION) && isset($_SESSION['login']) && $_SESSION['login'] == 1) {
    header("Location: ../index.php");
}

?>
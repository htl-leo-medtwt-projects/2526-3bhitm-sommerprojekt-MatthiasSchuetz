<?php
    session_start();

    require_once '../database.php';

    if(!empty($_POST['submit'])) {
        $_username = $conn->real_escape_string($_POST['username']);
        $_password = $conn->real_escape_string($_POST['password']);
        if(strcmp($_password, $conn->real_escape_string($_POST['password2'])) != 0) {
            include './register.html';
            echo "<div id=\"errorMessage\">Passwords do not match.<br></div>";
            exit();
        }

        $_passwordHash = password_hash($_password, PASSWORD_BCRYPT);

        $insertStatement = "INSERT INTO user (username, password)
                        VALUES ('$_username', '$_passwordHash');";

        $requestUsername = "SELECT username FROM user WHERE username = '$_username'";
        $res = $conn->query($requestUsername);

        if($res->num_rows > 0) {
            include './register.html';
            echo "<div id=\"errorMessage\">User $_username already exists.<br></div>";
            exit();
        }

        if($_res = $conn->query($insertStatement)) {
            include "./login.html";
            echo "<div id=\"errorMessage\">User $_username has been added to the database.<br>Try to log in.</div>";
        } else {
            include './register.html';
            echo "<div id=\"errorMessage\">NO insertion. User could not be added. Maby user $_username already exists.</div>";
        }
    } else {
        include './register.html';
    }

    $conn->close();
?>
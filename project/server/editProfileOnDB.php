<?php
    session_start();

    require_once "../database.php";

    if (!isset($_POST["submit"])) {
        exit;
    }

    $_SESSION['error'] = [];
    $error = [];

    if (isset($_POST["username"]) && !empty($_POST["username"])) {
        $username = $_POST["username"];
        $insertStatement = "UPDATE user SET username = '$username' WHERE id = '".$_SESSION['user']['id']."'";

        if ($rs = $conn->query($insertStatement)) {
            $_SESSION['user']['username'] = $username;
        } else {
            array_push($error, "No insertion into database.");
            $_SESSION['error'] = $error;
        }
    }

    if (isset($_FILES["profilePicture"]) && $_FILES["profilePicture"]["error"] == 0) {
        $target_dir = "./media/profilePictures/";
        $target_file = $target_dir . basename($_FILES["profilePicture"]["name"]);
        $uploadOk = 1;

        $imageFileType = pathinfo($target_file, PATHINFO_EXTENSION);

        // Zufälligen Dateinamen generieren
        $rndFileName = uniqid();
        $target_file = $target_dir . $rndFileName . '.' . $imageFileType;

        // Prüfen, ob es wirklich ein Bild ist
        if (isset($_POST["submit"])) {
            $check = getimagesize($_FILES["profilePicture"]["tmp_name"]);

            if ($check != false) {
                $uploadOk = 1;
            } else {
                echo "File is not an image.";
                $uploadOk = 0;
            }
        }

        // Prüfen, ob Datei bereits existiert
        if (file_exists($target_file)) {
            echo "Sorry, file already exists.";
            $uploadOk = 0;
        }

        // Dateigröße prüfen
        if ($_FILES["profilePicture"]["size"] > 500000) {
            echo "Sorry, your file is too large.";
            $uploadOk = 0;
        }

        // Nur bestimmte Dateiformate erlauben
        if (
            $imageFileType != "jpg" &&
            $imageFileType != "jpeg" &&
            $imageFileType != "png" &&
            $imageFileType != "gif"
        ) {
            echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
            $uploadOk = 0;
        }

        // Datei hochladen
        if ($uploadOk == 0) {
            echo "Sorry, your file was not uploaded.";
        } else {
            move_uploaded_file($_FILES["profilePicture"]["tmp_name"], $target_file);

            // In Datenbank speichern
            $insertStatement = "UPDATE user SET profilePicture = './server/media/profilePictures/$rndFileName.$imageFileType' WHERE id = '".$_SESSION['user']['id']."'";

            if ($rs = $conn->query($insertStatement)) {
                $_SESSION['user']['profilePicture'] = "./server/media/profilePictures/$rndFileName.$imageFileType";
            } else {
                array_push($error, "No insertion into database.");
                $_SESSION['error'] = $error;
            }
        }
    }
    

    if (isset($_POST["email"]) && !empty($_POST["email"])) {
        $email = $_POST["email"];
        $insertStatement = "UPDATE user SET email = '$email' WHERE id = '".$_SESSION['user']['id']."'";

        if ($rs = $conn->query($insertStatement)) {
            $_SESSION['user']['email'] = $email;
        } else {
            array_push($error, "No insertion into database.");
            $_SESSION['error'] = $error;
        }
    }

    if (isset($_POST["password"]) && !empty($_POST["password"])) {
        if (isset($_POST["previousPassword"]) && !empty($_POST["previousPassword"])) {
            $previousPassword = $_POST["previousPassword"];
            if (!password_verify($previousPassword, $_SESSION['user']['password'])) {
                array_push($error, "Previous password is incorrect.");
                $_SESSION['error'] = $error;
                Header("Location: ../editProfile.php");
                exit;
            } else {
                $password = $_POST["password"];
                $_passwordHash = password_hash($password, PASSWORD_BCRYPT);
                $insertStatement = "UPDATE user SET password = '$_passwordHash' WHERE id = '".$_SESSION['user']['id']."'";
                if ($rs = $conn->query($insertStatement)) {
                    $_SESSION['user']['password'] = $_passwordHash;
                } else {
                    array_push($error, "No insertion into database.");
                    $_SESSION['error'] = $error;
                }
            }
        } else {
            array_push($error, "Previous password is required to change password.");
            $_SESSION['error'] = $error;
            Header("Location: ../editProfile.php");
            exit;
        }
    }


    

    $conn->close();

    header("Location: ../editProfile.php");
?>
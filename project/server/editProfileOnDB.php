<?php
    session_start();

    require_once "../database.php";

    if (!isset($_POST["submit"])) {
        exit;
    }

    if (isset($_FILES["profilePicture"])) {
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
                echo "File is an image - " . $check["mime"] . ".";
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
            if (move_uploaded_file($_FILES["profilePicture"]["tmp_name"], $target_file)) {
                echo "The file " . basename($_FILES["profilePicture"]["name"]) . " has been uploaded.";
            }
        }
    }
?>
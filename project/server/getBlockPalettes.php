<?php
    session_start();
    require_once '../database.php';

    // DEFAULT ANSWER
    $answer = array(
        "code" => 404,
        "data" => []
    );

    // REQUEST ALL Blocks: /server/getBlockPalettes.php
    if (!isset($_GET["id"]) && !isset($_GET["name"])) {
        $stmt = $conn->prepare("SELECT * FROM blockpalettes");
        $stmt->execute();
        $result = $stmt->get_result();

        $allPalettes = [];
        while ($row = $result->fetch_assoc()) {
            $allPalettes[] = $row;
        }

        $answer["code"] = 200;
        $answer["data"] = $allPalettes;
    }

    // REQUEST for SINGLE Block Data: /server/getBlockPalettes.php?id={id}
    else if (isset($_GET["id"])) {
        $stmt = $conn->prepare("SELECT * FROM blockpalettes WHERE id = ?");
        $stmt->bind_param("i", $_GET["id"]);
        $stmt->execute();
        $result = $stmt->get_result();
        $palette = $result->fetch_assoc();

        if ($palette) {
            $answer["code"] = 200;
            $answer["data"] = $palette;
        } else {
            $answer["code"] = 404;
            $answer["data"] = "Blockpalette nicht gefunden";
        }
    }

    // SEND JSON
    $conn->close();
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($answer);
?>
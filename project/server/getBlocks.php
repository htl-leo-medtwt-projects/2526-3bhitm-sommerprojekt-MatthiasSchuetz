<?php
    session_start();
    require_once '../database.php';

    // DEFAULT ANSWER
    $answer = array(
        "code" => 404,
        "data" => []
    );

    // REQUEST ALL Blocks: /server/getBlocks.php
    if (!isset($_GET["id"]) && !isset($_GET["name"])) {
        $stmt = $conn->prepare("SELECT * FROM blocks");
        $stmt->execute();
        $result = $stmt->get_result();

        $allBlocks = [];
        while ($row = $result->fetch_assoc()) {
            $allBlocks[] = $row;
        }

        $answer["code"] = 200;
        $answer["data"] = $allBlocks;
    }

    // REQUEST for SINGLE Block Data: /server/getBlocks.php?id={id}
    else if (isset($_GET["id"])) {
        $stmt = $conn->prepare("SELECT * FROM blocks WHERE id = ?");
        $stmt->bind_param("i", $_GET["id"]);
        $stmt->execute();
        $result = $stmt->get_result();
        $block = $result->fetch_assoc();

        if ($block) {
            $answer["code"] = 200;
            $answer["data"] = $block;
        } else {
            $answer["code"] = 404;
            $answer["data"] = "Block nicht gefunden";
        }
    }

    // SEND JSON
    $conn->close();
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($answer);
?>
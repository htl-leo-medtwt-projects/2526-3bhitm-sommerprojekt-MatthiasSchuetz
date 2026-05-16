<?php
    session_start();
    require_once '../database.php';

    // DEFAULT ANSWER
    $answer = array(
        "code" => 404,
        "data" => []
    );

    // REQUEST ALL Build Hacks: /server/getBuildHacks.php
    if (!isset($_GET["id"]) && !isset($_GET["name"])) {
        $stmt = $conn->prepare("SELECT * FROM buildhacks");
        $stmt->execute();
        $result = $stmt->get_result();

        $allBuildHacks = [];
        while ($row = $result->fetch_assoc()) {
            $allBuildHacks[] = $row;
        }

        $answer["code"] = 200;
        $answer["data"] = $allBuildHacks;
    }

    // REQUEST for SINGLE Build Hack: /server/getBuildHacks.php?id={id}
    else if (isset($_GET["id"])) {
        $stmt = $conn->prepare("SELECT * FROM buildhacks WHERE id = ?");
        $stmt->bind_param("i", $_GET["id"]);
        $stmt->execute();
        $result = $stmt->get_result();
        $buildHack = $result->fetch_assoc();

        if ($buildHack) {
            $answer["code"] = 200;
            $answer["data"] = $buildHack;
        } else {
            $answer["code"] = 404;
            $answer["data"] = "Build Hack nicht gefunden";
        }
    }

    // SEND JSON
    $conn->close();
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($answer);
?>
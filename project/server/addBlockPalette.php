<?php
    session_start();
    require_once '../database.php';

    // DEFAULT ANSWER
    $answer = array(
        "code" => 404,
        "data" => []
    );

    if (isset($_POST["block1"], $_POST["block2"], $_POST["block3"], $_POST["block4"], $_POST["block5"], $_POST["block6"], $_POST["userID"], $_POST["name"])) {
        $answer["code"] = 200;
        $answer["data"] = $_POST;

        $stmt = $conn->prepare("INSERT INTO blockpalettes (block1, block2, block3, block4, block5, block6, creator, name) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("iiiiiiis", $_POST["block1"], $_POST["block2"], $_POST["block3"], $_POST["block4"], $_POST["block5"], $_POST["block6"], $_POST["userID"], $_POST["name"]);
        $stmt->execute();

        $answer["data"] = $_POST;
    } else {
        $answer["code"] = 400;
        $answer["data"] = "Missing parameters";
    }

    // SEND JSON
    $conn->close();
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($answer);
?>
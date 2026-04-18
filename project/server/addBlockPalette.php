<?php
    session_start();
    require_once '../database.php';

    // DEFAULT ANSWER
    $answer = array(
        "code" => 404,
        "data" => []
    );

    if (isset($_POST["block1"])) {
        $answer["code"] = 200;
        $answer["data"] = $_POST;
    }

    // SEND JSON
    $conn->close();
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($answer);
?>
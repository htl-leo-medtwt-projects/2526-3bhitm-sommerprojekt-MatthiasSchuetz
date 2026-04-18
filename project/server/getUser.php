<?php
    session_start();
    require_once '../database.php';

    // DEFAULT ANSWER
    $answer = array(
        "code" => 404,
        "data" => []
    );

    // REQUEST ALL Users: /server/getUser.php
    if (!isset($_GET["id"])) {
        $answer["code"] = 200;
        $answer["data"] = "No UserID provided";
    }

    // REQUEST for SINGLE User Data: /server/getUser.php?id={id}
    else if (isset($_GET["id"])) {
        $stmt = $conn->prepare("SELECT username FROM user WHERE id = ?");
        $stmt->bind_param("i", $_GET["id"]);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();

        if ($user) {
            $answer["code"] = 200;
            $answer["data"] = $user;
        } else {
            $answer["code"] = 404;
            $answer["data"] = "User nicht gefunden";
        }
    }

    // SEND JSON
    $conn->close();
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($answer);
?>
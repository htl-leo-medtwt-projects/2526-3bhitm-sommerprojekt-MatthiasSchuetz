<?php
    session_start();
    require_once '../database.php';

    // DEFAULT ANSWER
    $answer = array(
        "code" => 404,
        "data" => []
    );

    // REQUEST ALL Forum Posts: /server/getForums.php
    if (!isset($_GET["id"])) {
        $stmt = $conn->prepare("SELECT f.*, u.username, u.profilePicture FROM forum f LEFT JOIN user u ON f.userID = u.id ORDER BY f.chatID ASC ");
        $stmt->execute();
        $result = $stmt->get_result();

        $allPosts = [];
        while ($row = $result->fetch_assoc()) {
            $allPosts[] = $row;
        }

        $answer["code"] = 200;
        $answer["data"] = $allPosts;
    }

    // REQUEST for SINGLE Forum Post: /server/getForums.php?id={id}
    else if (isset($_GET["id"])) {
        $stmt = $conn->prepare("SELECT f.*, u.username, u.profilePicture FROM forum f LEFT JOIN user u ON f.userID = u.id WHERE f.chatID = ?");
        $stmt->bind_param("i", $_GET["id"]);
        $stmt->execute();
        $result = $stmt->get_result();
        $post = $result->fetch_assoc();

        if ($post) {
            $answer["code"] = 200;
            $answer["data"] = $post;
        } else {
            $answer["code"] = 404;
            $answer["data"] = "Forum Post nicht gefunden";
        }
    }

    // SEND JSON
    $conn->close();
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($answer);
?>

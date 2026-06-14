<?php
    session_start();
    require_once '../database.php';

    // DEFAULT ANSWER
    $answer = array(
        "code" => 404,
        "data" => []
    );

    // Check if user is logged in
    if (!isset($_SESSION['login']) || $_SESSION['login'] != 1) {
        $answer["code"] = 401;
        $answer["data"] = "Nicht eingeloggt";
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode($answer);
        exit;
    }

    // ADD Forum Post: POST /server/addForumPost.php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $data = json_decode(file_get_contents('php://input'), true);

        $message = isset($data['message']) ? trim($data['message']) : '';
        $userID  = $_SESSION['user']['id'];
        $img     = isset($data['img']) && !empty($data['img']) ? $data['img'] : null;

        if (empty($message)) {
            $answer["code"] = 400;
            $answer["data"] = "Nachricht darf nicht leer sein";
        } else if (strlen($message) > 1000) {
            $answer["code"] = 400;
            $answer["data"] = "Nachricht zu lang (max. 1000 Zeichen)";
        } else {
            $stmt = $conn->prepare("INSERT INTO forum (Message, userID, img) VALUES (?, ?, ?)");
            $stmt->bind_param("sis", $message, $userID, $img);
            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                $answer["code"] = 200;
                $answer["data"] = "Post erfolgreich erstellt";
            } else {
                $answer["code"] = 500;
                $answer["data"] = "Fehler beim Erstellen des Posts";
            }
        }
    }

    // Handle image upload: POST /server/addForumPost.php?upload=1
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['upload'])) {
        if (isset($_FILES['img']) && $_FILES['img']['error'] === 0) {
            $uploadDir = '../server/media/forum/';
            if (!is_dir($uploadDir)) mkdir($uploadDir, 0777, true);

            $ext      = pathinfo($_FILES['img']['name'], PATHINFO_EXTENSION);
            $filename = uniqid() . '.' . $ext;
            $target   = $uploadDir . $filename;

            if (move_uploaded_file($_FILES['img']['tmp_name'], $target)) {
                $answer["code"] = 200;
                $answer["data"] = "./server/media/forum/" . $filename;
            } else {
                $answer["code"] = 500;
                $answer["data"] = "Bild-Upload fehlgeschlagen";
            }
        }
    }

    $conn->close();
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($answer);
?>

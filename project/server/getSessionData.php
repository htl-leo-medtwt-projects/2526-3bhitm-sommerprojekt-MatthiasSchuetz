<?php
    session_start();

    // DEFAULT ANSWER
    $answer = array(
        "code"=>404,
        "data"=>[]
    );
    

    // REQUEST ALL Session Data: /server/getSessionData.php
    if(!isset($_GET["sIndex"]) ) {
        $answer["code"] = 200;
        $answer["data"] = $_SESSION;
    }

    // REQUEST for SINGLE Session Data: /server/getSessionData.php?sIndex={sIndex}
    else if(isset($_GET["sIndex"])) {
        if(isset($_SESSION[$_GET["sIndex"]])) {
            $answer["code"] = 200;
            $answer["data"] = $_SESSION[$_GET["sIndex"]];
        } else {
            $answer["code"] = 404;
        }
    }
    

    // SEND JSON
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($answer);
?>
<?php
    require "functions.php";

    // Import JSON data
    importJson();


    // DEFAULT ANSWER
    $answer = array(
        "code"=>404,
        "data"=>[]
    );
    

    // REQUEST for ALL teams: /api/teams.php
    if(!isset($_GET["name"]) ) {
        insertAllTeams();
    }


    // REQUEST for SINGLE teams: /api/teams.php?name={name}
    else if( isset($_GET["name"]) && is_string($_GET["name"]) && $_GET["name"] != "" && $_GET["name"] != null) {
        $name = $_GET["name"];
        insertAllPlayersOfTeam($name);
    }
    

    // SEND JSON
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($answer);
?>
<?php

/**
 * Importiert JSON-Daten
 */
function importJson() {
    global $teams;
    global $players;
    
    $data = file_get_contents("../data/nba-teams.json");
    $teams = json_decode($data);
    $data2 = file_get_contents("../data/nba-players.json");
    $players = json_decode($data2);
}


/**
 * Fügt alle Teams in das Antwort-Array ein
 */
function insertAllTeams() {
    global $answer, $teams;
    
    for ($i = 0; $i < count($teams); $i++) { 
        $answer["code"] = 200;
        array_push($answer["data"], $teams[$i]);
    }
}


/**
 * Fügt die Spieler eines Teams in das Antwort-Array ein
 */
function insertAllPlayersOfTeam($name) {
    global $answer, $players;
    
    $answer["code"] = 200;
    for($i = 0; $i < count($players); $i++) {
        if($players[$i]->team == $name) {
            array_push($answer["data"], $players[$i]);
        }
    } 
}

?>

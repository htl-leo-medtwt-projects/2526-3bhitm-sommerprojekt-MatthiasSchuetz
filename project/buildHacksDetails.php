<?php
    session_start();

    if (!isset($_GET["id"])) {
        header("Location: ./buildHacks.php");
        exit();
    }

    require_once './database.php';

    $stmt = $conn->prepare("SELECT buildhacks.*, user.username AS creator FROM buildhacks JOIN user ON buildhacks.creator = user.id WHERE buildhacks.id = ?");
    $stmt->bind_param("i", $_GET["id"]);
    $stmt->execute();
    $result = $stmt->get_result();
    $buildhack = $result->fetch_assoc();

    $stmt = $conn->prepare("SELECT * FROM buildhacks_steps WHERE buildhackId = ? ORDER BY spotInHack ASC");
    $stmt->bind_param("i", $_GET["id"]);
    $stmt->execute();
    $result = $stmt->get_result();
    $steps = $result->fetch_all(MYSQLI_ASSOC);

    $conn->close();

    function showBuildHackDetails() {
        global $buildhack, $steps;
        $tempstring = '';
        $tempstring .= '<h2>' . $buildhack["name"] . ' | Created by ' . $buildhack["creator"] . '</h2>';
        $tempstring .= '<img src="' . $buildhack["displayImgPath"] . '" alt="' . $buildhack["name"] . '">';
        $tempstring .= '<p>' . $buildhack["description"] . '</p>';
        $tempstring .= '<div class="buildhacksteps">';
        foreach ($steps as $step) {
            $tempstring .= '<div class="buildhackstep">';
            $tempstring .= '<h4>Step ' . $step['spotInHack'] . '</h4>';
            $tempstring .= '<img src="' . $step['path'] . '" alt="Step Image">';
            $tempstring .= '<p>' . $step['description'] . '</p>';
            if (!empty($step['imgPath'])) {
                $tempstring .= '<img src="' . $step['imgPath'] . '" alt="Step Image">';
            }
            $tempstring .= '</div>';
        }
        $tempstring .= '</div>';
        echo $tempstring;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MCBuildHelper</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js" defer></script>
</head>
<body>
    <div id="header">
        <img style="cursor: pointer;" onclick="goToMainpage()" id="logo" src="./media/img/logo.png" alt="Logo">
    </div>
    <div id="nav">
        <div><a href="./blockPalettes.php">Block Palettes</a></div>
        <div><a href="./buildHacks.php">Build Hacks</a></div>
        <div><a href="./forums.php">Forums</a></div>
        <?php
            if (isset($_SESSION['login']) && $_SESSION['login'] == 1) {
                echo '<div><a style="color: black;" href="./pages/login.php">Logout</a></div>';
                if (isset($_SESSION['user']['profilePicture'])) {
                    $profilePicture = $_SESSION['user']['profilePicture'];
                } else {
                    $profilePicture = "./media/img/defaultUser.png";
                }
                echo '<div id="user">
                        <img onclick="accountData()" src="'. $profilePicture . '" alt="User Icon" style="width: 40px; height: 40px; border-radius: 100%;">
                    </div>';
            } else {
                echo '<div><a href="./pages/login.html">Login</a></div>';
                echo '<div id="user">
                        <img src="./media/img/defaultUser.png" alt="User Icon" style="width: 40px; height: 40px; border-radius: 100%;">
                    </div>';
            }
        ?>
        
    </div>

    <div id="content">
        <div id="welcome">
            <p>Welcome to the Build Hacks page!</p>
        </div>
        <div id="buildhacksdetails">
            <?php showBuildHackDetails(); ?>
        </div>
    </div>

    <div id="footer">
        <p>Copyright © 2024 MCBuildHelper. All rights reserved.</p>
    </div>
</body>
</html>
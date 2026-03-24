<?php
    session_start();

    if (isset($_SESSION['login'])) {
        echo "You are already logged in.";
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
        <img id="logo" src="./media/img/logo.png" alt="Logo">
    </div>
    <div id="nav">
        <a href="./pages/blockPalettes.html">Block Palettes</a>
        <a href="./pages/buildHacks.html">Build Hacks</a>
        <a href="./pages/forums.html">Forums</a>
        <a href="./pages/login.html">Login</a>
    </div>

    <div id="content">
        <div id="welcome">
            
        </div>
        <div id="boxNav">
            <a href="./pages/blockPalettes.html"><div id="navBlockPalettes">Block Palettes</div></a>
            <a href="./pages/buildHacks.html"><div id="navBuildHacks">Build Hacks</div></a>
            <a href="./pages/forums.html"><div id="navForums">Forums</div></a>
        </div>
    </div>

    <div id="footer">
        <p>Copyright © 2024 MCBuildHelper. All rights reserved.</p>
    </div>
</body>
</html>
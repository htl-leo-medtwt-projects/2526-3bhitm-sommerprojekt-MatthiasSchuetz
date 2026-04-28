<?php
    session_start();
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
                echo '<div><a style="color: black;" href="./server/login.php">Logout</a></div>';
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
            <p>Edit Your Profile</p>
        </div>
        <div>
            <form action="./server/editProfileOnDB.php" method="POST" enctype="multipart/form-data">
                <label for="profilePicture">Profile Picture:</label><br>
                <input type="file" id="profilePicture" name="profilePicture"><br><br>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email"><br><br>
                <label for="password">Password:</label><br>
                <input type="password" id="password" name="password"><br><br>
                <input type="submit" value="Save Changes" name="submit">
            </form>
        </div>
    </div>

    <div id="footer">
        <p>Copyright © 2024 MCBuildHelper. All rights reserved.</p>
    </div>
</body>
</html>
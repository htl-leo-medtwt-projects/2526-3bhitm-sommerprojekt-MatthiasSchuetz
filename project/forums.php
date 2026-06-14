<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MCBuildHelper – Forums</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js" defer></script>
    <script src="forumsScript.js" defer></script>
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
            <p>Wellcome to the Forums! Talk to other Minecraft builders.</p>
        </div>

        <!-- Add Post Button (nur wenn eingeloggt) -->
        <?php if (isset($_SESSION['login']) && $_SESSION['login'] == 1): ?>
        <div id="addPostButton" onclick="openClosePostForm()">New Post</div>
        <?php endif; ?>

        <!-- Formular: Neuen Post erstellen -->
        <div id="addPostForm" style="display:none;">
            <h2>Create New Post</h2>
            <span id="closeAddPost" onclick="openClosePostForm()">✕</span>
            <div id="addPostFormContent">
                <label>Message</label>
                <textarea id="postMessage" placeholder="What would you like to share?" maxlength="1000"></textarea>
                <label>Image (optional)</label>
                <div class="drop-zone" id="forumDropZone">
                    <span>Drag and drop an image here or click</span>
                    <input type="file" id="forumImgInput" accept="image/*" style="display:none;">
                </div>
                <img id="forumImgPreview" src="" alt="Preview" style="display:none; max-width:100%; border-radius:5px; border: solid 2px black;">
                <div id="charCount" style="color:#aaa; font-family:text; font-size:12px; text-align:right;">0 / 1000</div>
                <button onclick="submitPost()">Publish Post</button>
                <div id="postError" style="color:red; font-family:text; display:none;"></div>
            </div>
        </div>

        <!-- Forum Posts -->
        <div id="forumPosts"></div>
    </div>

    <div id="footer">
        <p>Copyright © 2024 MCBuildHelper. All rights reserved.</p>
    </div>
</body>
</html>
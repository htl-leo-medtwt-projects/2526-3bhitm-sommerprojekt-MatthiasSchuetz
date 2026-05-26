<?php
session_start();
file_put_contents("debug.txt", print_r($_FILES, true) . "\n" . print_r($_POST, true));
require_once "../database.php";

if (!isset($_POST["submit"])) {
    exit;
}

$_SESSION['error'] = [];
$error = [];

// ── Validierung ──────────────────────────────────────────────
if (!isset($_POST["name"]) || empty($_POST["name"])) {
    array_push($error, "Name is required.");
}
if (!isset($_POST["description"]) || empty($_POST["description"])) {
    array_push($error, "Description is required.");
}

if (!empty($error)) {
    $_SESSION['error'] = $error;
    header("Location: ../addBuildhack.php");
    exit;
}

$name        = $conn->real_escape_string($_POST["name"]);
$description = $conn->real_escape_string($_POST["description"]);
$displayImgPath = "";

// ── Display Image hochladen ───────────────────────────────────
if (isset($_FILES["buildHackDisplayImgPath"]) && $_FILES["buildHackDisplayImgPath"]["error"] == 0) {
    $target_dir = "./media/buildhacks/";
    $imageFileType = pathinfo($_FILES["buildHackDisplayImgPath"]["name"], PATHINFO_EXTENSION);
    $rndFileName = uniqid();
    $target_file = $target_dir . $rndFileName . '.' . $imageFileType;

    $check = getimagesize($_FILES["buildHackDisplayImgPath"]["tmp_name"]);
    if ($check === false) {
        array_push($error, "Display image is not a valid image.");
        $_SESSION['error'] = $error;
        header("Location: ../addBuildhack.php");
        exit;
    }

    if (!in_array(strtolower($imageFileType), ["jpg", "jpeg", "png", "gif", "webp"])) {
        array_push($error, "Display image: only JPG, JPEG, PNG, GIF & WEBP allowed.");
        $_SESSION['error'] = $error;
        header("Location: ../addBuildhack.php");
        exit;
    }

    if ($_FILES["buildHackDisplayImgPath"]["size"] > 5000000) {
        array_push($error, "Display image is too large (max 5MB).");
        $_SESSION['error'] = $error;
        header("Location: ../addBuildhack.php");
        exit;
    }
    
    if (move_uploaded_file($_FILES["buildHackDisplayImgPath"]["tmp_name"], $target_file)) {
        $displayImgPath = "./server/media/buildhacks/" . $rndFileName . '.' . $imageFileType;
    } else {
        array_push($error, "Display image upload failed.");
        $_SESSION['error'] = $error;
        header("Location: ../addBuildhack.php");
        exit;
    }
}

// ── Buildhack in DB einfügen ──────────────────────────────────
$insertHack = "INSERT INTO buildhacks (creator, name, description, displayImgPath) 
               VALUES ('" . $_SESSION['user']['id'] . "', '$name', '$description', '$displayImgPath')";
if (!$conn->query($insertHack)) {
    array_push($error, "Could not save buildhack to database.");
    $_SESSION['error'] = $error;
    header("Location: ../addBuildhack.php");
    exit;
}

$buildhackId = $conn->insert_id;

// ── Steps verarbeiten ─────────────────────────────────────────
$stepIndex = 0;

while (isset($_FILES["stepImage_" . $stepIndex])) {
    $stepFile       = $_FILES["stepImage_" . $stepIndex];
    $stepDesc       = $conn->real_escape_string($_POST["stepDescription_" . $stepIndex] ?? "");
    $spotInHack     = $stepIndex + 1;
    $stepImgPath    = "";

    if ($stepFile["error"] == 0) {
        $stepFileType = pathinfo($stepFile["name"], PATHINFO_EXTENSION);
        $stepFileName = uniqid();
        $stepTarget   = "./media/buildhacks/steps/" . $stepFileName . '.' . $stepFileType;

        $checkStep = getimagesize($stepFile["tmp_name"]);
        if ($checkStep === false) {
            $stepIndex++;
            continue; // ungültiges Bild überspringen
        }

        if (!in_array(strtolower($stepFileType), ["jpg", "jpeg", "png", "gif", "webp"])) {
            $stepIndex++;
            continue;
        }

        if (move_uploaded_file($stepFile["tmp_name"], $stepTarget)) {
            $stepImgPath = "./server/media/buildhacks/steps/$stepFileName.$stepFileType";
        }
    }

    $insertStep = "INSERT INTO buildhacks_steps (buildhackId, path, description, spotInHack) 
                   VALUES ('$buildhackId', '$stepImgPath', '$stepDesc', '$spotInHack')";

    if (!$conn->query($insertStep)) {
        array_push($error, "Could not save step $spotInHack to database.");
    }

    $stepIndex++;
}

$conn->close();

if (!empty($error)) {
    $_SESSION['error'] = $error;
}

header("Location: ../buildhacks.php");
?>
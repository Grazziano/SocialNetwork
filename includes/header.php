<?php
require 'config/config.php';
include("includes/classes/User.php");
include("includes/classes/Post.php");
include("includes/classes/Message.php");

if (isset($_SESSION['username'])) {
    $userLoggedIn = $_SESSION['username'];
    $user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username = '$userLoggedIn'");
    $user = mysqli_fetch_array($user_details_query);
} else {
    header("Location: register.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to SwirlFeed!</title>

    <!-- Javascript -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/bootbox.min.js"></script>
    <script src="assets/js/swirlFeed.js"></script>
    <script src="assets/js/jquery.Jcrop.js"></script>
    <script src="assets/js/jcrop_bits.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/jquery.Jcrop.css">

</head>

<body>
    <div class="top_bar">
        <div class="logo">
            <a href="index.php">SwirlFeed</a>
        </div>
        <nav>
            <a href="<?php echo $userLoggedIn ?>"><?php echo $user['first_name'] ?></i></a>
            <a href="index.php"><i class="fas fa-home fa-lg"></i></a>
            <a href="javascript:void(0);" onclick="getDropdownData(<?php echo $userLoggedIn; ?>, 'message')"><i class="fas fa-envelope fa-lg"></i></a>
            <a href=""><i class="fas fa-bell fa-lg"></i></a>
            <a href="requests.php"><i class="fas fa-users fa-lg"></i></a>
            <a href=""><i class="fas fa-cog fa-lg"></i></a>
            <a href="includes/handlers/logout.php"><i class="fas fa-sign-out-alt fa-lg"></i></a>
        </nav>

        <div class="dropdown_data_window">
            <input type="hidden" id="dropdown_data_type" value="">
        </div>
    </div>

    <div class="wrapper">
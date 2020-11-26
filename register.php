<?php
$con = mysqli_connect("localhost", "root", "", "social_network"); // Connection variable

if (mysqli_connect_errno()) {
    echo "Failed to connect:" . mysqli_connect_errno();
}

# Declaring variables to prevent errors
$fname = ""; # First name
$lname = ""; # Last name
$em = ""; # email
$em2 = ""; # mail2
$password = ""; # password
$password2 = ""; # password2
$date = ""; # Sign up date
$error_array = ""; # Holds error messages

if (isset($_POST['register_button'])) {
    # Registration form values

    # First name
    $fname = strip_tags($_POST['reg_fname']); # Remove html tags
    $fname = str_replace(' ', '', $fname); # Remove spaces
    $fname = ucfirst(strtolower($fname)); # Uppercase first letter

    # Last name
    $lname = strip_tags($_POST['reg_lname']); # Remove html tags
    $lname = str_replace(' ', '', $lname); # Remove spaces
    $lname = ucfirst(strtolower($lname)); # Uppercase first letter

    # email
    $em = strip_tags($_POST['reg_email']); # Remove html tags
    $em = str_replace(' ', '', $em); # Remove spaces
    $em = ucfirst(strtolower($em)); # Uppercase first letter

    # email 2
    $em2 = strip_tags($_POST['reg_email2']); # Remove html tags
    $em2 = str_replace(' ', '', $em2); # Remove spaces
    $em2 = ucfirst(strtolower($em2)); # Uppercase first letter

    # Password
    $password = strip_tags($_POST['reg_password']); # Remove html tags

    # Password 2
    $password2 = strip_tags($_POST['reg_password2']); # Remove html tags

    $date = date("Y-m-d"); # Current date
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to SwirlFeed!</title>
</head>

<body>
    <form action="register.php" method="post">
        <input type="text" name="reg_fname" placeholder="First Name" required>
        <br>
        <input type="text" name="reg_lname" placeholder="Last Name" required>
        <br>
        <input type="email" name="reg_email" placeholder="E-mail" required>
        <br>
        <input type="email" name="reg_email2" placeholder="Confirm E-mail" required>
        <br>
        <input type="password" name="reg_password" placeholder="Password" required>
        <br>
        <input type="password" name="reg_password2" placeholder="Confirm Password" required>
        <br>
        <input type="submit" name="register_button" value="Register">
    </form>
</body>

</html>
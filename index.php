<?php
$con = mysqli_connect("localhost", "root", "", "social_network");

if (mysqli_connect_errno()) {
    echo "Failed to connect:" . mysqli_connect_errno();
}
$query = mysqli_query($con, "INSERT INTO test VALUES('', 'Reece')");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to SwirlFeed!</title>
</head>

<body>

</body>

</html>
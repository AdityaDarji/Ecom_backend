<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");

$sname = "localhost"; // MySQL server address
$uname = "root"; // MySQL username
$password = ""; // MySQL password
$db_name = "ecom_new_updated"; // Ensure this matches the database you imported
$port = 3306; // Default MySQL port $port = 3307 provided;

// Establishing connection
$conn = mysqli_connect($sname, $uname, $password, $db_name, $port);

if (!$conn) {
    echo "Connection failed: " . mysqli_connect_error();
    exit();
}

?>

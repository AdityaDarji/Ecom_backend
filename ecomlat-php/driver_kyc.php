<?php
// Include the database connection file
include 'dbUpload.php';

// Retrieve the data from the POST request
$email = $_POST['email'];
$city = $_POST['city'];
$area = $_POST['area'];
$state = $_POST['state'];
$pincode = $_POST['pincode'];
$price_per_km = $_POST['price_per_km'];
$pan_card = $_POST['pan_card']; 
$aadhaar = $_POST['aadhaar'];

// Create the SQL query to insert data into the driver_kyc table
$sql = "INSERT INTO driver_kyc (email, city, area, state, pincode, price_per_km, pan_card, aadhaar) 
        VALUES ('$email', '$city', '$area', '$state', '$pincode', '$price_per_km', '$pan_card', '$aadhaar')";

// Execute the query
if (mysqli_query($conn, $sql)) {
    echo "true";
} else {
    echo "Error: " . mysqli_error($conn);
}

// Close the database connection
mysqli_close($conn);
?>

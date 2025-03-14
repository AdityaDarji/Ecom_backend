<?php
// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Include the database connection file
include 'dbUpload.php';

// Set Content-Type header to return UTF-8
header('Content-Type: application/json; charset=utf-8');

// Retrieve data from POST request
$email = $_POST['email'];
$password = $_POST['password'];
$mobile = $_POST['mobile'];
$service_type = $_POST['service_type']; // New input for service type

// Set default values for latitude and longitude
$lat = 25.754;
$lng = 12.123;
$isRestrict = 0; 

// Prepare the SQL query to insert new driver
$sql = "INSERT INTO alldrivers (email, password, phone, lat, lng, isRestrict, service_type) VALUES ('$email', '$password', '$mobile', $lat, $lng, '$isRestrict', '$service_type')";

// Execute the query
if (mysqli_query($conn, $sql)) {
    echo json_encode(['status' => 'success', 'message' => 'Driver registered successfully.']);
} else {
    // Output the error for debugging
    echo json_encode(['status' => 'error', 'message' => 'Failed to register driver: ' . mysqli_error($conn)]);
}

// Close the connection
mysqli_close($conn);
?>

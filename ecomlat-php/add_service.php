<?php
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json'); // Ensure the content type is JSON

include "dbUpload.php";

// Get data from POST request
$service = $_POST['name'];
$seller_id = (int)$_POST['seller_id'];

// SQL query to insert the new product into the products table
$sql = "INSERT INTO services (service, seller_id) VALUES ('$service', '$seller_id')";

if ($conn->query($sql) === TRUE) {
    echo json_encode(['status' => "success", 'message' => 'New product added successfully']);
} else {
    echo json_encode(['status' => "failed", 'message' => 'Error: ' . $conn->error]); // Removed <br> and pure JSON response
}

$conn->close();
?>

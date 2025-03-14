<?php
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json'); // Ensure the content type is JSON

include "dbUpload.php";

// Get data from POST request
$name = $_POST['name'];

// SQL query to insert the new product into the products table
$sql = "INSERT INTO category (category) VALUES ('$name')";

if ($conn->query($sql) === TRUE) {
    echo json_encode(['status' => "success", 'message' => 'New product added successfully']);
} else {
    echo json_encode(['status' => "failed", 'message' => 'Error: ' . $conn->error]); // Removed <br> and pure JSON response
}

$conn->close();
?>

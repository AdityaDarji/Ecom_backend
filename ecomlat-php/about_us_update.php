<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
include "dbUpload.php";

// Retrieve JSON input
$input = file_get_contents('php://input');
$data = json_decode($input, true);

// Extract title and description from the received data
$title = $data['title'];
$description = $data['description'];

// Check if there's already an entry in the about_us table
$sql = "SELECT * FROM about_us WHERE id = 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Entry exists, perform an update
    $sql = "UPDATE about_us SET title = '$title', description = '$description' WHERE id = 1";
} else {
    // No entry exists, perform an insert
    $sql = "INSERT INTO about_us (id, title, description) VALUES (1, '$title', '$description')";
}

if ($conn->query($sql) === TRUE) {
    echo json_encode(["status" => "success", "message" => "About Us saved successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to save About Us"]);
}

$conn->close();
?>

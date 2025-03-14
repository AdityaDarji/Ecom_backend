<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
include "dbUpload.php";

// Fetch the entry from the about_us table
$sql = "SELECT * FROM about_us WHERE id = 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Entry found, fetch and return it as JSON
    $row = $result->fetch_assoc();
    echo json_encode($row);
} else {
    // No entry found, return an empty JSON object
    echo json_encode(["title" => "", "description" => ""]);
}

$conn->close();
?>

<?php
header('Content-Type: application/json');

// Include the database connection file
include_once 'dbUpload.php';

// Get the current date and time
$currentDateTime = date('Y-m-d H:i:s');

// Calculate the date and time for 24 hours ago
$lastDayDateTime = date('Y-m-d H:i:s', strtotime('-1 day', strtotime($currentDateTime)));

// Prepare the SQL query to fetch rows created in the last 24 hours
$sql = "SELECT * FROM driver_kyc WHERE `created_at` >= '$lastDayDateTime'";

$result = $conn->query($sql);

$rows = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $rows[] = $row;
    }
}

// Return the rows as JSON
echo json_encode($rows);

$conn->close();
?>

<?php
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');

include "dbUpload.php";

// Retrieve and sanitize input
$userID = isset($_POST["userID"]) ? htmlspecialchars($_POST["userID"]) : '';

// Validate input
if (empty($userID)) {
    echo json_encode(["status" => "error", "message" => "User ID is required"]);
    $conn->close();
    exit();
}

// Prepare and execute the SQL statement
$stmt = $conn->prepare("SELECT * FROM `messages` WHERE `fromEmail` = ? OR `toEmail` = ?");
$stmt->bind_param("ss", $userID, $userID);

if ($stmt->execute()) {
    $result = $stmt->get_result();
    $messages = [];
    
    while ($row = $result->fetch_assoc()) {
        $messages[] = $row;
    }
    
    echo json_encode(["status" => "success", "data" => $messages]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to retrieve messages"]);
}

$stmt->close();
$conn->close();
?>

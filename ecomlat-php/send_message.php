<?php
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');

include "dbUpload.php";

// Retrieve and sanitize input
$from = isset($_POST["from"]) ? htmlspecialchars($_POST["from"]) : '';
$to = isset($_POST["to"]) ? htmlspecialchars($_POST["to"]) : '';
$msg = isset($_POST["msg"]) ? htmlspecialchars($_POST["msg"]) : '';

// Validate inputs
if (empty($from) || empty($to) || empty($msg)) {
    echo json_encode(["status" => "error", "message" => "Invalid input"]);
    $conn->close();
    exit();
}

// Prepare the SQL statement
$stmt = $conn->prepare("INSERT INTO `messages` (`fromEmail`, `toEmail`, `msg`) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $from, $to, $msg);

if ($stmt->execute()) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to insert message"]);
}

$stmt->close();
$conn->close();
?>

<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type");

include "dbUpload.php";

// Fetch all problems from the database
$sql = "SELECT id, user_id, problem, status FROM user_problem";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $problems = [];
    while($row = $result->fetch_assoc()) {
        $problems[] = $row;
    }
    echo json_encode(["status" => "success", "data" => $problems]);
} else {
    echo json_encode(["status" => "success", "data" => []]);
}

$conn->close();
?>
<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type");

include "dbUpload.php";

// Check if 'user_id' is provided in the GET request
if (isset($_GET['user_id'])) {
    $user_id = $_GET['user_id'];

    // Fetch problems for the specific user from the database
    $sql = "SELECT id, user_id, problem, status FROM user_problem WHERE user_id = $user_id";
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
} else {
    echo json_encode(["status" => "error", "message" => "User ID not provided"]);
}

$conn->close();
?>

<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "dbUpload.php";

// Retrieve user_id and problem description from POST
$user_id = $_POST['user_id'];
$problem = $_POST['problem'];

if (!empty($user_id) && !empty($problem)) {
    // Insert the problem into the database
    $sql_insert = "INSERT INTO user_problem (user_id, problem, status) VALUES ('$user_id', '$problem', 'pending')";

    if ($conn->query($sql_insert) === TRUE) {
        echo json_encode(["status" => "success", "message" => "Problem submitted successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to submit the problem."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Please provide a valid user_id and problem description."]);
}

$conn->close();
?>

<?php
// Enable CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "dbUpload.php"; // Assuming this sets up the $conn variable

// Check if POST data is set and sanitize inputs
if (isset($_POST['problem']) && isset($_POST['status'])) {
    // Sanitize inputs to prevent SQL injection
    $problem = $conn->real_escape_string($_POST['problem']);
    $status = $conn->real_escape_string($_POST['status']);

    // Validate status input against the enum values in the database
    if (in_array($status, ['pending', 'resolved'])) {
        // Update the problem's status based on problem name
        $sql_update = "UPDATE user_problem SET status='$status' WHERE problem='$problem'";

        if ($conn->query($sql_update) === TRUE) {
            echo json_encode(["status" => "success", "message" => "Problem status updated successfully."]);
        } else {
            echo json_encode(["status" => "error", "message" => "Failed to update problem status."]);
        }
    } else {
        // Handle invalid status value
        echo json_encode(["status" => "error", "message" => "Invalid status value."]);
    }
} else {
    // Handle missing or invalid data
    echo json_encode(["status" => "error", "message" => "Invalid problem name or status."]);
}

// Close the database connection
$conn->close();
?>

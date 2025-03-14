<?php
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');

include "dbUpload.php"; // Make sure this file is correctly configured for your database connection

// Get the userID from the query parameters
$userID = isset($_GET['sellerID']) ? intval($_GET['sellerID']) : 0;

$response = array();

if ($userID > 0) {
    // Prepare the SQL query to prevent SQL injection
    $stmt = $conn->prepare("SELECT * FROM allsellers WHERE id = ?");
    $stmt->bind_param("i", $userID); // "i" specifies the type as integer
    
    if ($stmt->execute()) {
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                array_push($response, $row);
            }
        } else {
            $response = array("message" => "No seller found for the given userID.");
        }
    } else {
        $response = array("error" => "Error executing query: " . $stmt->error);
    }

    $stmt->close();
} else {
    $response = array("error" => "Invalid or missing userID.");
}

$conn->close();

// Return the JSON response
echo json_encode($response);

?>

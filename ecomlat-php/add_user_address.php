<?php
header("Access-control-Allow-Origin");
header("Content-Type: application/json; charset=UTF-8");

include "dbUpload.php";

$email = $_POST['email'] ?? '';
$postalCode = $_POST['postalCode'] ?? '';
$street = $_POST['street'] ?? '';
$flatNo = $_POST['flatNo'] ?? '';
$response = [];

if (!empty($email) && !empty($postalCode) && !empty($flatNo) && !empty($street)) {
    // Fetch user ID using email
    $stmt = $conn->prepare("SELECT id FROM allusers WHERE email = ?");
    $stmt->bind_param("s", $email);

    if ($stmt->execute()) {
        $result = $stmt->get_result();
        if ($row = $result->fetch_assoc()) {
            $userId = $row['id'];

            // Insert address into address table
            $insertStmt = $conn->prepare("INSERT INTO saved_address (user_id, email,  flat_number, street, postal_code) VALUES (?, ?, ?, ?, ?)");
            $insertStmt->bind_param("issss", $userId, $email, $flatNo, $street, $postalCode);

            if ($insertStmt->execute()) {
                $response = ["success" => true, "message" => "Address added successfully."];
            } else {
                $response = ["success" => false, "message" => "Failed to add address."];
            }

            $insertStmt->close();
        } else {
            $response = ["success" => false, "message" => "User not found."];
        }
    } else {
        $response = ["success" => false, "message" => "Failed to execute query."];
    }

    $stmt->close();
} else {
    $response = ["success" => false, "message" => "Email, postal code, and flat number are required."];
}

$conn->close();
echo json_encode($response);
?>

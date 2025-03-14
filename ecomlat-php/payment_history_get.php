<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type");

include "dbUpload.php";  // Include database connection

// Check if 'user_id' is provided in the GET request
if (isset($_GET['user_id'])) {
    $user_id = $_GET['user_id'];

    // Fetch payment history for the specific user
    $sql = "SELECT product_name, seller, shop_name, order_date FROM payment_history WHERE user_id = $user_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $history = [];
        while ($row = $result->fetch_assoc()) {
            $history[] = $row;
        }
        echo json_encode(["status" => "success", "data" => $history]);
    } else {
        echo json_encode(["status" => "success", "data" => []]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "User ID not provided"]);
}

$conn->close();
?>

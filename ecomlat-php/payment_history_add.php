<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "dbUpload.php";  // Include your database connection file

// Check if required POST data is provided
if (isset($_POST['user_id']) && isset($_POST['product_name']) && isset($_POST['seller']) && isset($_POST['shop_name']) && isset($_POST['order_date'])) {
    
    $user_id = $_POST['user_id'];
    $product_name = $_POST['product_name'];
    $seller = $_POST['seller'];
    $shop_name = $_POST['shop_name'];
    $order_date = $_POST['order_date'];

    // Insert data into payment_history table
    $sql = "INSERT INTO payment_history (user_id, product_name, seller, shop_name, order_date) 
            VALUES ('$user_id', '$product_name', '$seller', '$shop_name', '$order_date')";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["success" => true, "message" => "Payment history added successfully"]);
    } else {
        echo json_encode(["success" => false, "message" => "Error: " . $conn->error]);
    }

} else {
    echo json_encode(["success" => false, "message" => "Required data not provided"]);
}

$conn->close();
?>

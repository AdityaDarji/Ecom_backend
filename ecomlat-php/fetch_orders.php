<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Include the database connection
include('dbUpload.php');

// Get email from POST request
$email = $_POST['email'];

// Prepare SQL query to fetch orders for the given email
$sql = "SELECT * FROM orders WHERE user = '$email'";

// Execute SQL query
$result = mysqli_query($conn, $sql);

// Check if query was successful
if ($result) {
    $orders = array();

    // Fetch all orders into an array
    while ($row = mysqli_fetch_assoc($result)) {
        $orders[] = $row;
    }

    // Send JSON response with orders
    echo json_encode($orders);
} else {
    // Send JSON response with error message
    echo json_encode(["message" => "Error: " . mysqli_error($conn)]);
}

// Close connection
mysqli_close($conn);
?>

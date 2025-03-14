<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");

// Include the database connection
include('dbUpload.php');

// Data to be inserted
$product_name = $_POST['product_name'];
$user = $_POST['user'];
$seller = $_POST['seller'];
$shop_name = $_POST['shop_name'];
$user_phone = $_POST['user_phone'];
$seller_phone = $_POST['seller_phone'];
$shop_lat = $_POST['shop_lat'];
$shop_lng = $_POST['shop_lng'];
$shop_address = $_POST['shop_address'];
$user_lat = $_POST['user_lat'];
$user_lng = $_POST['user_lng'];
$user_address = $_POST['user_address'];
$total_amount = $_POST['total_amount'];
$driver_id = $_POST['driver_id'];
$driver_status = $_POST['driver_status'];
$order_date = $_POST['order_date'];
$delivery_date = $_POST['delivery_date'];
$product_image = $_POST['product_image'];
$cash_on_delivery = $_POST['cash_on_delivery'];

// Prepare SQL query
$sql = "INSERT INTO orders (product_name, user, seller, shop_name, user_phone, seller_phone, shop_lat, shop_lng, shop_address, user_lat, user_lng, user_address, total_amount, driver_id, driver_status, order_date, delivery_date, product_image, cash_on_delivery) 
        VALUES ('$product_name', '$user', '$seller', '$shop_name', '$user_phone', '$seller_phone', '$shop_lat', '$shop_lng', '$shop_address', '$user_lat', '$user_lng', '$user_address', '$total_amount', '$driver_id', '$driver_status', '$order_date', '$delivery_date', '$product_image', '$cash_on_delivery')";

// Execute SQL query
if (mysqli_query($conn, $sql)) {
    echo json_encode(["success" => true, "message" => ""]);
} else {
    echo json_encode(["success" => false, "message" => "Error: " . mysqli_error($conn)]);
}

// Close connection
mysqli_close($conn);
?>

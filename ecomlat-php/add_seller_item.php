<?php
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json'); // Ensure the content type is JSON

include "dbUpload.php";

// Get data from POST request
$name = $_POST['product_name'];
$description = $_POST['description'];
$price = $_POST['total_price'];
$category_id = $_POST['category']; // Assuming category_id corresponds to category
$seller_id = $_POST['seller_id']; // Assuming you will pass the seller ID as well
$gst = $_POST['gst_rate'];
$imgurl = $_POST['image_links']; // Assuming the first image link is used as the main URL
$brand = $_POST['brand'];
$color_options = $_POST['color_options'];
$weight = $_POST['weight'];
$delivery_paid_by = $_POST['delivery_paid_by'];
$available_stock = $_POST['available_stock'];
$size = $_POST['size'];
$make = $_POST['make'];
$origin = $_POST['origin'];

// SQL query to insert the new product into the products table
$sql = "INSERT INTO products (imgurl, name, description, price, category_id, seller_id, gst, brand, color_options, weight, delivery_paid_by, available_stock, size, make, origin) 
        VALUES ('$imgurl', '$name', '$description', '$price', 1, '$seller_id', '$gst', '$brand', '$color_options', '$weight', '$delivery_paid_by', '$available_stock', '$size', '$make', '$origin')";

if ($conn->query($sql) === TRUE) {
    echo json_encode(['success' => true, 'message' => 'New product added successfully']);
} else {
    echo json_encode(['success' => false, 'message' => 'Error: ' . $conn->error]); // Removed <br> and pure JSON response
}

$conn->close();
?>

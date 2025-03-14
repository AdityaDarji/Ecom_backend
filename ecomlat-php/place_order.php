<?php
header("Access-Control-Allow-Origin: *");
require_once "dbUpload.php";

// Enable error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (isset($_POST['user_email'], $_POST['name'], $_POST['price'], $_POST['seller_id'], $_POST['userAddress'], $_POST['product_image'], $_POST['cash_on_delivery'])) {
    $seller_id = (int)$_POST['seller_id'];
    
    // Fetch seller information
    $query_seller = "SELECT * FROM allsellers WHERE id = '$seller_id'";
    $exe_seller = mysqli_query($conn, $query_seller);
    
    if ($exe_seller) {
        $result_seller = mysqli_fetch_assoc($exe_seller);
        if ($result_seller) {
            $seller = $result_seller['email'];
            $shop_name = $result_seller['shop_name'];
            $seller_phone = $result_seller['phone'];
            $shop_lat = doubleval($result_seller['lat']);
            $shop_lng = doubleval($result_seller['lng']);
            $shop_address = $result_seller['address'];

            $product_name = $_POST['name'];
            $user = $_POST['user_email'];
            $user_lat = doubleval(25.7447);
            $user_lng = doubleval(85.0138);
            $user_address = $_POST["userAddress"];
            $total_amount = floatval($_POST['price']);
            $product_image = $_POST['product_image'];
            $driver_id = intval(1); // You may want to fetch this dynamically
            $order_date = date("Y-m-d");
            $cash_on_delivery = $_POST['cash_on_delivery'];

            // Insert order into the database
            $query = "INSERT INTO orders 
                (product_name, user, seller, shop_name, user_phone, seller_phone, shop_lat, shop_lng, shop_address, user_lat, user_lng, user_address, total_amount, driver_id, driver_status, order_date, product_image, cash_on_delivery, seller_id)
                VALUES 
                ('$product_name', '$user', '$seller', '$shop_name', 'None' , '$seller_phone', '$shop_lat', '$shop_lng', '$shop_address', '$user_lat', '$user_lng', '$user_address', '$total_amount', '$driver_id', '1', '$order_date', '$product_image', '$cash_on_delivery', '$seller_id')";

            try {
                $exe = mysqli_query($conn, $query);
                if ($exe) {
                    $result["success"] = true;
                    $result["message"] = "Order placed successfully";
                    echo json_encode($result);
                } else {
                    $result["success"] = false;
                    $result["message"] = "Failed to place order: " . mysqli_error($conn);
                    echo json_encode($result);
                }
            } catch (Exception $e) {
                $result["success"] = false;
                $result["message"] = "Caught exception: " . $e->getMessage();
                echo json_encode($result);
            }
        } else {
            $result["success"] = false;
            $result["message"] = "Seller not found.";
            echo json_encode($result);
        }
    } else {
        $result["success"] = false;
        $result["message"] = "Failed to fetch seller information: " . mysqli_error($conn);
        echo json_encode($result);
    }
} else {
    $result["success"] = false;
    $result["message"] = "Required parameters not found.";
    echo json_encode($result);
}

mysqli_close($conn);
?>

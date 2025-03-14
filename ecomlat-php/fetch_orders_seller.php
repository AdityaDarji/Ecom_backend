<?php
header("Access-Control-Allow-Origin: *");
require_once "dbUpload.php";

// Check if 'email' parameter is set in POST request
if(isset($_POST['email'])){
    $email = $_POST['email'];

    // Create SQL query to fetch orders
    $fetch_query = "SELECT * FROM orders WHERE seller = '$email'";

    // Execute query
    $exe = mysqli_query($conn, $fetch_query);

    if($exe){
        $orders = array();

        // Fetch all results
        while($result = mysqli_fetch_assoc($exe)){
            $orders[] = $result;
        }

        // Return successful response with orders
        echo json_encode(
            array(
                "success" => true,
                "orderItemsRecords" => $orders
            )
        );
    } else {
        // Return error response if query fails
        echo json_encode(
            array(
                "success" => false,
                "message" => "Failed to execute query"
            )
        );
    }
} else {
    // Return error response if email parameter is not found
    echo json_encode(
        array(
            "success" => false,
            "message" => "Email not found"
        )
    );
}

// Close the database connection
mysqli_close($conn);
?>

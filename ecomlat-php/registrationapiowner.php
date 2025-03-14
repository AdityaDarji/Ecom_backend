<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include "dbUpload.php";

// Retrieve POST data
$email = $_POST['email'];
$password = $_POST['password'];
$lat = (double) $_POST['lat'];
$lng = (double) $_POST['lng'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$shop_name = $_POST['shop_name'];
$gst = $_POST['gst'];
$is_third_party = $_POST['is_third_party'];
$service_type = $_POST['service_type'];
$service_locations = $_POST['service_locations'];

$service_locations = empty($service_locations) ? 'NULL' : "'".json_encode($service_locations)."'";

$zero = 0; // For 'isRestrict' field

// Convert the service_locations JSON string from POST to an array (optional based on DB storage)
// If you're storing it as a JSON string in the database, leave it as is.
$service_locations_json = json_encode($service_locations);


// Check if the seller already exists
$findexist = "SELECT * from allsellers where email='$email'";
$resultsearch = mysqli_query($conn, $findexist);

if (mysqli_num_rows($resultsearch) > 0) {
    $result["success"] = "3";
    $result["message"] = "User already exists";
    echo json_encode($result);
    mysqli_close($conn);
} else {
    // Prepare the SQL statement
    $sql = "INSERT INTO allsellers (shop_name, email, password, lat, lng, address, phone, gst, isRestrict, is_third_party, service_type, service_locations) 
            VALUES ('$shop_name', '$email', '$password', '$lat', '$lng', '$address', '$phone', '$gst', '$zero', '$is_third_party', '$service_type', '$service_locations_json')";

    // Execute the query
    $query = mysqli_query($conn, $sql);

    if ($query) {
        $result["success"] = "1";
        $result["message"] = "Registration successful";
    } else {
        $result["success"] = "0";
        $result["message"] = "Error in registration: " . mysqli_error($conn);
    }

    echo json_encode($result);
    mysqli_close($conn);
}
?>

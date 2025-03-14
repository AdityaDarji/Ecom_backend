<?php
header("Access-Control-Allow-Origin: *");

include "dbUpload.php";

// Retrieve and sanitize input
$name = mysqli_real_escape_string($conn, $_POST['name']);
$email = mysqli_real_escape_string($conn, $_POST['email']);
$password = mysqli_real_escape_string($conn, $_POST['password']);
$phone = mysqli_real_escape_string($conn, $_POST['phone']);
$code = strtoupper(mysqli_real_escape_string($conn, $_POST['code']));

// Check if user already exists
$findexist = "SELECT * FROM allusers WHERE email = '$email'";
$resultsearch = mysqli_query($conn, $findexist);

if (mysqli_num_rows($resultsearch) > 0) {
    $result["success"] = "3";
    $result["message"] = "User already exists";
    echo json_encode($result);
    mysqli_close($conn);
} else {
    // Prepare and execute the insertion
    $arr = array();
    $arr1 = base64_encode(serialize($arr));
    
    $sql = "INSERT INTO allusers (name, email, password, phone, cart_item, isRestrict) VALUES ('$name', '$email', '$password', '$phone', '$arr1', '0')";
    $add = 50;
    $sql2 = "UPDATE allusers SET ref_wallet = (ref_wallet + $add) WHERE code = '$code'";
    
    // Execute both queries
    $resultsearch2 = mysqli_query($conn, $sql2);
    if (mysqli_query($conn, $sql)) {
        $result["success"] = "1";
        $result["message"] = "Registration successful";
        echo json_encode($result);
    } else {
        $result["success"] = "0";
        $result["message"] = "Error in registration: " . mysqli_error($conn);
        echo json_encode($result);
    }
    
    mysqli_close($conn);
}
?>

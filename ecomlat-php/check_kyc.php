<?php
// Include the database connection file
include 'dbUpload.php';

// Get POST data
$email = $_POST['email'] ;

$sql = "SELECT * FROM driver_kyc WHERE email = '$email'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    $data = mysqli_fetch_assoc($result);
    echo json_encode($data);
} else {
    echo json_encode(["error" => "No data found"]);
}

// Close the database connection
mysqli_close($conn);
?>

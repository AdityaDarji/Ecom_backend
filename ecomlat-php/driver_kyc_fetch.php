<?php
// Include the database connection file
include 'dbUpload.php';

// Fetch all rows where verified is 0
$sql = "SELECT * FROM driver_kyc WHERE verified = 0";
$result = mysqli_query($conn, $sql);

$data = array();

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
    echo json_encode($data);
} else {
    echo json_encode(array("error" => mysqli_error($conn)));
}
// Close the database connection
mysqli_close($conn);
?>

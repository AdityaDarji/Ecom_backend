<?php
header("Access-Control-Allow-Origin: *");

$email = $_POST['email'];


include "dbUpload.php";


$sql = "SELECT * FROM buy_now_table WHERE user='$email';";
$result = $conn->query($sql);

$response = array();
if ($result) {
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            array_push($response, $row);
        }
    }
    $conn->close();
    header('Content-Type: application/json');
    echo json_encode($response);
}





?>

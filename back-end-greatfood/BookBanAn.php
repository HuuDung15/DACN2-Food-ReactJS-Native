<?php

header('Content-type: text/plain; charset=utf-8');

$json = file_get_contents("php://input");

$obj = json_decode($json,TRUE);
$idbanan = $obj["IDBANAN"];
$iduser = $obj["IDUSER"];
date_default_timezone_set("Asia/Ho_Chi_Minh");
$datedat = date("Y-m-d H:i:s");

require("dbCon.php");
require("jwt.php");

$qr= "UPDATE banan SET status= 1,iduser='$iduser',datedat='$datedat' WHERE id='$idbanan' ";

$conn->query("SET CHARACTER SET utf8");
if (mysqli_query($conn, $qr)) {
    echo JsonHelper::getJson("result","successfully");
    
} else {
    echo JsonHelper::getJson("result", "error");
}
mysqli_close($conn);

?>
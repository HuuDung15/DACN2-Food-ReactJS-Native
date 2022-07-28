<?php 

header('Content-type: text/plain; charset=utf-8');
require("dbCon.php");
require("jwt.php");
$json = file_get_contents("php://input");

$obj = json_decode($json,TRUE);
$idhoadon =$obj["IDHOADON"];

$qr= "DELETE FROM hoadon WHERE idhoadon='$idhoadon' ";

$conn->query("SET CHARACTER SET utf8");
if (mysqli_query($conn, $qr)) {
    echo JsonHelper::getJson("result","successfully");
    
} else {
    echo JsonHelper::getJson("result", "error");
}
mysqli_close($conn);
?>
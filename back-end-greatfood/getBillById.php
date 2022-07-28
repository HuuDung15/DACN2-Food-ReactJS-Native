<?php 
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-type: text/plain; charset=utf-8');
require("dbCon.php");
$json = file_get_contents("php://input");

$obj = json_decode($json,TRUE);
$idhoadon =$obj["IDHOADON"];

$qr= "SELECT * FROM hoadon WHERE idhoadon='$idhoadon' ";

$conn->query("SET CHARACTER SET utf8");
$result = mysqli_query($conn, $qr) or die("Error in Selecting " . mysqli_error($conn));
$emparray = array();

$row = mysqli_fetch_assoc($result);
$emparray =$row;

echo json_encode($emparray,JSON_UNESCAPED_UNICODE);

?>
<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-type: text/plain; charset=utf-8');
require("dbCon.php");
require("jwt.php");

$json = file_get_contents("php://input");
$obj = json_decode($json,TRUE);
$iduser = $obj["IDUSER"];

$qr= "SELECT * FROM hoadon WHERE iduser='$iduser' ";

$conn->query("SET CHARACTER SET utf8");
$result = mysqli_query($conn, $qr) or die("Error in Selecting " . mysqli_error($conn));
$emparray = array();

while($row = mysqli_fetch_assoc($result)){
   
    $emparray[] =$row;
   
}
echo json_encode($emparray,JSON_UNESCAPED_UNICODE);
?>
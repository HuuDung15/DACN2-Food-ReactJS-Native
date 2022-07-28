<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-type: text/plain; charset=utf-8');
require("dbCon.php");
require("jwt.php");

$json = file_get_contents("php://input");
$obj = json_decode($json,TRUE);
$mangmonan = $obj["MANGMONAN"];
$mangString =json_encode($mangmonan,JSON_UNESCAPED_UNICODE);
$statuss = $obj["STATUS"];
$iduser = $obj["IDUSER"];
$tongtien =$obj["TONGTIEN"];

date_default_timezone_set("Asia/Ho_Chi_Minh");
$datedat = date("Y-m-d H:i:s");
// $datethanhtoan = date("Y-m-d H:i:s");

$qr= "INSERT INTO hoadon (mangmonan,tongtien,status,datedat,iduser) VALUES ('$mangString','$tongtien','$statuss','$datedat',$iduser) ";
$conn->query("SET CHARACTER SET utf8");
if (mysqli_query($conn, $qr)) {
    echo JsonHelper::getJson("result","successfully");
    
} else {
    echo JsonHelper::getJson("result", "error");
}
mysqli_close($conn);


?>
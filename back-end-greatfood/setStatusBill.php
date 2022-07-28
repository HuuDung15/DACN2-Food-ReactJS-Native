<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-type: text/plain; charset=utf-8');
require("dbCon.php");
require("jwt.php");
$json = file_get_contents("php://input");
$obj = json_decode($json,TRUE);
$idhoadon = $obj["IDHOADON"];

date_default_timezone_set("Asia/Ho_Chi_Minh");
$datethanhtoan = date("Y-m-d H:i:s");

$qr= "UPDATE hoadon SET `status`=1,`datethanhtoan`='$datethanhtoan' WHERE `idhoadon`='$idhoadon' ";

$conn->query("SET CHARACTER SET utf8");
if (mysqli_query($conn, $qr)) {
    echo JsonHelper::getJson("result","successfully");
} else {
    echo JsonHelper::getJson("result", "error");
}
mysqli_close($conn);
?>
<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-type: text/plain; charset=utf-8');
require("dbCon.php");
require("jwt.php");

$json = file_get_contents("php://input");
$obj = json_decode($json,TRUE);
$username = $obj["USERNAME"];
$password =md5($obj["PASSWORD"]);
$email =$obj["EMAIL"];
$hoten = $obj["HOTEN"];
$phone = $obj["PHONE"];
$address = $obj["ADDRESS"];

$checkusername = "SELECT * FROM users WHERE Username='$username'";
$checkemail ="SELECT * FROM users WHERE Email='$email'";
$qr= "INSERT INTO users (Username,Password,HoTen,Email,phone,Address) VALUES ('$username','$password','$hoten','$email','$phone','$address') ";
$conn->query("SET CHARACTER SET utf8");
$scanus = mysqli_query($conn,$checkusername);   
$scanem = mysqli_query($conn,$checkemail);

if(mysqli_num_rows($scanus)==1){
    echo JsonHelper::getJson("result","errUserName");
}else if(mysqli_num_rows($scanem)==1){
    echo JsonHelper::getJson("result","errEmail");
}
else if (mysqli_query($conn, $qr)) {
    echo JsonHelper::getJson("result","successfully");
} else {
    echo JsonHelper::getJson("result", "error");
}

mysqli_close($conn);
?>
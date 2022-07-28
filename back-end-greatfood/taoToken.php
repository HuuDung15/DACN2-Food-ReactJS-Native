<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

$json = file_get_contents("php://input");

$obj = json_decode($json,TRUE);

$un = $obj["USERNAME"];
$pw = md5($obj["PASSWORD"]);// Thực tế: Nhớ dùng escapte tránh Injection

require("jwt.php");
require("dbCon.php");

$qr= "SELECT * FROM users WHERE Username='$un' 
                AND Password='$pw'
                ";
$conn->query("SET CHARACTER SET utf8");
$users = mysqli_query($conn,$qr);
if(mysqli_num_rows($users)==1){
    //login mat khau dung
    $u = mysqli_fetch_array($users);
    $token = array();

    $token["id"] = $u["id"];
    $token["Username"] = $u["Username"];
    $token["Email"] = $u["Email"];
    $token["HoTen"] = $u["HoTen"];
    $token["permission"] = $u["permission"];
    
    $jsonwebtoken = JWT::encode($token,"DUNG_CHO_AI_BIET");
    
    echo JsonHelper::getJson("token", $jsonwebtoken);
}else{

    //login sai

    echo JsonHelper::getJson("token", "ERROR");
}

?>

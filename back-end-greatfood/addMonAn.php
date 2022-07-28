
<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-type: text/plain; charset=utf-8');
require("dbCon.php");
require("jwt.php");

function random_string($length) {
    $key = '';
    $keys = array_merge(range(0, 9), range('a', 'z'));

    for ($i = 0; $i < $length; $i++) {
        $key .= $keys[array_rand($keys)];
    }
    return $key;
}

$json = file_get_contents("php://input");
$obj = json_decode($json,TRUE);
$tenmonan = $obj["TENMONAN"];
$gia = $obj["GIA"];
$hinhanh = $obj["HINHANH"];
$danhmuc = $obj["DANHMUC"];
$mota = $obj["MOTA"];
date_default_timezone_set("Asia/Ho_Chi_Minh");
$dateadd = date("Y-m-d H:i:s");
$id = random_string(10);

if($obj==NULL){
    echo JsonHelper::getJson("result", "error");
}else{
   
$qr= "INSERT INTO monan (id,ten,hinhanh,gia,mota,iddanhmuc,AddDate) VALUES ('$id','$tenmonan','$hinhanh','$gia','$mota','$danhmuc','$dateadd') ";
$qr2 = "INSERT INTO thongke (id,soluong) VALUES ('$id','0')";
$conn->query("SET CHARACTER SET utf8");
if (mysqli_query($conn, $qr)) {
    echo JsonHelper::getJson("result", "successfully");
    mysqli_query($conn, $qr2) or die("Error in Selecting " . mysqli_error($conn)); 
    
} else {
    echo JsonHelper::getJson("result", "error");
}
}

mysqli_close($conn);
?>
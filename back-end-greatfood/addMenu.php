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
$tendanhmuc = $obj["TENDANHMUC"];
$hinhanh = $obj["HINHANH"];
$iddanhmuc = random_string(10);

if($obj==NULL){
    echo JsonHelper::getJson("result", "error");
}else{
$qr= "INSERT INTO danhmuc (iddanhmuc,tendanhmuc,hinhanh) VALUES ('$iddanhmuc','$tendanhmuc','$hinhanh') ";
$conn->query("SET CHARACTER SET utf8");
if (mysqli_query($conn, $qr)) {
    echo JsonHelper::getJson("result", "successfully");

} else {
    echo JsonHelper::getJson("result", mysqli_error($conn));
}
}

mysqli_close($conn);
?>
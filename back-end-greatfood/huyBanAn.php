<?php

header('Content-type: text/plain; charset=utf-8');

$json = file_get_contents("php://input");

$obj = json_decode($json,TRUE);
$idbanan = $obj["IDBANAN"];


require("dbCon.php");
require("jwt.php");

$qr= "UPDATE banan SET status= 0,iduser=null,datedat=null WHERE id='$idbanan' ";

$conn->query("SET CHARACTER SET utf8");
if (mysqli_query($conn, $qr)) {
    echo JsonHelper::getJson("result","successfully");
    
} else {
    echo JsonHelper::getJson("result", "error");
}
mysqli_close($conn);

?>
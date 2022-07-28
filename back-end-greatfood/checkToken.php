<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-type: text/plain; charset=utf-8');

$json = file_get_contents("php://input");

$obj = json_decode($json,TRUE);

$token = $obj["token"];

// $token = $_GET["token"];

require("jwt.php");


$json = JWT::decode($token, "DUNG_CHO_AI_BIET",true);

echo json_encode($json);


?>
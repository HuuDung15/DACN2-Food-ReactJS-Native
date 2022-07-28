<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-type: text/plain; charset=utf-8');
require("dbCon.php");
require("jwt.php");

$json = file_get_contents("php://input");
$obj = json_decode($json,TRUE);

$qr= "SELECT * FROM thongke ";

$conn->query("SET CHARACTER SET utf8");
$result = mysqli_query($conn, $qr) or die("Error in Selecting " . mysqli_error($conn));
$emparray = array();

while($row = mysqli_fetch_assoc($result)){
    $emparray[] =$row;
}
//Sắp xếp theo số lượng
$amount = array();
foreach($emparray as $key => $rows){
    $amount[$key] = $rows['soluong'];
}
array_multisort($amount, SORT_DESC, $emparray);

//Đã có mảng mới array
$soItem1trang = 2;
$page = $_GET['trang'];
// $page = 1;
$from = $page * $soItem1trang;
$mangMoi = array();

if($from>count($emparray)){
    for($i = $from-2 ; $i<count($emparray);$i++){  
        array_push($mangMoi,$emparray[$i]);
    }   
}else{
    for($i = $from-2; $i<$from;$i++){  
        array_push($mangMoi,$emparray[$i]);
    }
}
$arrFood = array();
for($z = 0;$z<count($mangMoi);$z++){
    $arrTemp = $mangMoi[$z];
    $getId = $arrTemp['id'];

    $qrFood= "SELECT * FROM monan WHERE id='$getId' ";
    $conn->query("SET CHARACTER SET utf8");
    $resultFood = mysqli_query($conn, $qrFood) or die("Error in Selecting " . mysqli_error($conn));
    $food = mysqli_fetch_assoc($resultFood);
    array_push($arrFood,$food);
  
    // $StirngJsonFood += $food,",";
    // echo json_encode($food,JSON_UNESCAPED_UNICODE);
}

echo json_encode($arrFood,JSON_UNESCAPED_UNICODE);

?>
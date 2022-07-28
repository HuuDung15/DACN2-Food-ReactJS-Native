<?php 
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-type: text/plain; charset=utf-8');
require("dbCon.php");

$qr= "SELECT * FROM monan ";

$conn->query("SET CHARACTER SET utf8");
$result = mysqli_query($conn, $qr) or die("Error in Selecting " . mysqli_error($conn));
$emparray = array();

while($row = mysqli_fetch_assoc($result)){
   
    $emparray[] =$row;
   
}
$soItem1trang = 6;
$page = $_GET["trang"];
$from = $page * $soItem1trang;
$mangMoi = array();
if($from>count($emparray)){
    for($i = $from-6 ; $i<count($emparray);$i++){  
        array_push($mangMoi,$emparray[$i]);
    }   
}else{
    for($i = $from-6; $i<$from;$i++){  
        array_push($mangMoi,$emparray[$i]);
    }
}
echo json_encode($mangMoi,JSON_UNESCAPED_UNICODE);

?>
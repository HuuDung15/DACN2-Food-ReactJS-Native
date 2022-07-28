<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-type: text/plain; charset=utf-8');
require("dbCon.php");
require("jwt.php");
$json = file_get_contents("php://input");
$obj = json_decode($json,TRUE);
$idhoadon = $obj["IDHOADON"];

//Lấy hóa đơn
$qr =  "SELECT * FROM hoadon WHERE idhoadon='$idhoadon' ";
$conn->query("SET CHARACTER SET utf8");
$result = mysqli_query($conn, $qr) or die("Error in Selecting " . mysqli_error($conn));
$row = mysqli_fetch_assoc($result);

//Lấy ra mảng món ăn để update
$Stringmangmonan = $row['mangmonan'];
$mangmonan = json_decode($Stringmangmonan);

for($i=0;$i<count($mangmonan);$i++){
    //Chuyển object về array
    $item = (array) $mangmonan[$i];
    //get id and so luong
    $id = $item['id'];
    $soluong = $item['soluong'];
    //Lấy số lượng hiện tại đang có trong bảng thống kê
    $qrThongke =  "SELECT * FROM thongke WHERE id='$id' ";
    $conn->query("SET CHARACTER SET utf8");
    $resultTK = mysqli_query($conn, $qrThongke) or die("Error in Selecting " . mysqli_error($conn));
    $rowTK = mysqli_fetch_assoc($resultTK);

    //Chuyển số lượng hiện tại về integer
    $StringcurentSoluong = $rowTK['soluong'];
    $curentSoluong = intval($StringcurentSoluong);

    //Tính tổng lại để cộng vào
    $setSluong =  $soluong +  $curentSoluong;

    //Thực hiện update
    $qrSetThongke = "UPDATE thongke SET `soluong`=$setSluong WHERE `id`=$id";
    mysqli_query($conn, $qrSetThongke);   
}

?>
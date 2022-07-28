<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
// header("Access-Control-Allow-Methods: *");
header('Content-type: text/plain; charset=utf-8');

$chars = "abcdefghijkmnopqrstuvwxyz023456789"; 
srand((double)microtime()*1000000); 
$i = 0; 
$pass = '' ; 

while ($i <= 7) { 
    $num = rand() % 33; 
    $tmp = substr($chars, $num, 1); 
    $pass = $pass . $tmp; 
    $i++; 
} 

$target_dir = "uploads/";
$target_file = $target_dir . basename($pass."_".$_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
  $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
  if($check !== false) {
    echo "{\"result\":\"File is an image - " . $check["mime"] . ".\"}";
    $uploadOk = 1;
  } else {
    echo "{\"result\":\"File is not an image.\"}";
    $uploadOk = 0;
  }
}
// Check if file already exists
if (file_exists($target_file)) {
    echo "{\"result\":\"Sorry, file already exists.\"}";
    $uploadOk = 0;
  }
  
  // Check file size
  if ($_FILES["fileToUpload"]["size"] > 5000000) {
    echo "{\"result\":\"Sorry, your file is too large.\"}";
    $uploadOk = 0;
  }
  
  // Allow certain file formats
  if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
  && $imageFileType != "gif" ) {
    echo "{\"result\":\"Sorry, only JPG, JPEG, PNG & GIF files are allowed.\"}";
    $uploadOk = 0;
  }
  
  // Check if $uploadOk is set to 0 by an error
  if ($uploadOk == 0) {
    echo "{\"result\":\"Sorry, your file was not uploaded.\"}";
  // if everything is ok, try to upload file
  } else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
      echo "{\"result\":\"". htmlspecialchars( basename($pass."_".$_FILES["fileToUpload"]["name"])). "\"}";
    } else {
      echo "{\"result\":\"Sorry, there was an error uploading your file.\"}";
    }
  }
?>

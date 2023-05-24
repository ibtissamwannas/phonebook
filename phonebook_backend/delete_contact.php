<?php
include "connect.php";

$id=$_POST['id'];

$stmt = $con->prepare("DELETE FROM `contact_information` where `id` = ?");
$stmt->execute(array($id));

$count = $stmt->rowCount();

if($count>0){
    echo json_encode((array("status" => "success","message" => "Deleted successfully")));
}else{
    echo json_encode(array("status"=>"fail"));
}
?>
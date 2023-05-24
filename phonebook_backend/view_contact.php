<?php
include "connect.php";


$stmt = $con->prepare("SELECT `id`,`first_name`, `last_name`, `phone_number`, `email` FROM `contact_information`");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

$count = $stmt->rowCount();

if($count>0){
    echo json_encode((array("status" => "success","data"=>$data)));
}else{
    echo json_encode(array("status" => "success", "data" => []));
}
?> 
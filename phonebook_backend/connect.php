<?php
$dsn = "mysql:host=localhost;dbname=phonebook";
$user = "root";
$pass = "";
$optoion = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8" //arabic
);
try{
    $con = new PDO($dsn,$user,$pass,$optoion);
    $con->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Access-Control-Allow-Origin");
    header("Access-Control-Allow-Methods: POST, OPTIONS , GET");

    include "functions.php";

} catch(PDOException $e){
echo $e->getMessage();
}

?>
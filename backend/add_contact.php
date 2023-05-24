<?php
include "connect.php";

$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$phoneNumber = $_POST['phoneNumber'];
$email = $_POST['email'];

$errors = array();

$emailValid = validateEmail($email);
$phoneNumberValid = validatePhoneNumber($phoneNumber);

if (!$emailValid && !$phoneNumberValid) {
    $errors[] = "Invalid email";
    $errors[] = "Invalid phone number";
} elseif (!$emailValid) {
    $errors[] = "Invalid email";
} elseif (!$phoneNumberValid) {
    $errors[] = "Invalid phone number";
}

if (!empty($errors)) {
    $errorMessage = implode(" and ", $errors);
    echo json_encode(array("status" => "fail", "message" => $errorMessage));
} else {
    $stmt = $con->prepare("SELECT * FROM `contact_information` WHERE `phone_number` = ? OR `email` = ?");
    $stmt->execute(array($phoneNumber, $email));
    $existingData = $stmt->rowCount();

    if ($existingData>0) {
        echo json_encode(array("status" => "fail", "message" => "Phone number or email already exists"));
    } else {
    $stmt = $con->prepare("INSERT INTO `contact_information` (`first_name`, `last_name`, `phone_number`, `email`) VALUES (?, ?, ?, ?)");
    $stmt->execute(array($firstName, $lastName, $phoneNumber, $email));

    $count = $stmt->rowCount();

    if ($count > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "fail"));
    }
}
}
?>
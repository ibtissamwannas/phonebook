<?php
include "connect.php";

$id = $_POST['id'];
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
    echo json_encode(array("status" => "fail", "messages" => $errorMessage));
} else {
    $stmt = $con->prepare("UPDATE `contact_information` SET `first_name`=?, `last_name`=?, `phone_number`=?, `email`=? WHERE `id`=?");
    $stmt->execute(array($firstName, $lastName, $phoneNumber, $email, $id));

    $count = $stmt->rowCount();

    if ($count > 0) {
        echo json_encode(array("status" => "success", "message" => "Updated successfully"));
    } else {
        echo json_encode(array("status" => "fail"));
    }
}
?>

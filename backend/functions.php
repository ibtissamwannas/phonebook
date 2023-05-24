<?php
function validateEmail($email) {
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return true;
    } else {
        return false;
    }
}

function validatePhoneNumber($phoneNumber) {
    if (is_numeric($phoneNumber) && strpos($phoneNumber, '.') === false) {
        return true;
    } else {
        return false;
    }
}

?>
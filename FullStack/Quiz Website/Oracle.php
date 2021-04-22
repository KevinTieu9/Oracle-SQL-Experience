<?php
$username="system";
$password=fopen("Password.txt", "r");
$connect_string="localhost/xe";
$conn=oci_connect($username, fread($password,filesize("Password.txt")), $connect_string);
?>


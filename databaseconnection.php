<?php
$servername = "localhost";
$username = "Jean";
$password = "PierreJ@2020";
$dbname = "niyonshuti_jean_pierre_222003223_fms";

// Create connection
$connection = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}
?>

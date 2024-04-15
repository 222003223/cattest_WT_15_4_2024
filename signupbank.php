<?php
require_once "databaseconnection.php";
//222003223 NIYONSHUTI Jean Pierre 
if($_SERVER["REQUEST_METHOD"]=="POST"){
  $bank_name = $_POST['bank_name'];
  $location = $_POST['location'];
  $website = $_POST['website'];
  $contact = $_POST['contact'];
  $bank_account = $_POST['bank_account'];
  $club_id = $_POST['club_id'];
  $sql ="INSERT INTO bank (bank_name,location,website,contact,bank_account,club_id) VALUES ('$bank_name','$location','$website','$contact','$bank_account','$club_id')";
  if($connection->query($sql)==TRUE){
    echo "Registration successiful!";
      header("Location:loginbank.html");
      exit();
  }else{
    echo "Error: ".$sql."<br>" .$connection->error;
  }
}$connection->close();
 ?>

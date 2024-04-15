<?php
session_start();

// Connect to database (replace dbname, username, password with actual credentials)
require_once "databaseconnection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['create'])) {
    $name = $_POST['name'];
    $city = $_POST['city'];
    $league = $_POST['league'];
    $stadium_name = $_POST['stadium_name'];
    $league_id = $_POST['league_id'];

     $sql ="INSERT INTO club (name,city,league,stadium_name,league_id) VALUES ('$name','$city','$league','$stadium_name','$league_id')";
    $stmt = $connection->prepare($sql);
   if ($stmt->execute()) {
        echo "Record added successfully.";
    } else {
        echo "Error adding record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update'])) {
    $id = $_POST['club_id'];
    $newname = $_POST['newname'];
    $newcity = $_POST['newcity'];
    $newleague = $_POST['newleague'];
    $newleague_id = $_POST['newleague_id'];
    $newstadium_name = $_POST['newstadium_name'];
    $sql = "UPDATE club SET name='$newname', city='$newcity', league='$newleague', stadium_name='$newstadium_name', league_id='$newleague_id' WHERE club_id='$id'";
    $stmt = $connection->prepare($sql);
    //$stmt->bind_param("ssssssi", $newname, $newcity, $newleague, $newstadium_name, $newleague_id,$id);

    if ($stmt->execute()) {
        echo "Record updated successfully.";
    } else {
        echo "Error updating record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete'])) {
    $id = $_POST['club_id'];

    $sql = "DELETE FROM club WHERE club_id=$id";
    $stmt = $connection->prepare($sql);
    //$stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "Record deleted successfully.";
    } else {
        echo "Error deleting record: " . $stmt->error;
    }
}
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['read'])) {
    // Assuming the session contains club_id
    $id = $_POST['club_id'];

    // Select bank's information from the database
    $sql = "SELECT * FROM club WHERE club_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Fetch and display bank information
        $row = $result->fetch_assoc();
        echo "Club_id: " . $row["club_id"] . "<br>";
          echo "Name: " . $row["name"] . "<br>";
        echo "City: " . $row["city"] . "<br>";
        echo "league: " . $row["league"] . "<br>";
        echo "stadium_name: " . $row["stadium_name"] . "<br>";
        echo "league_id: " . $row["league_id"] . "<br>";
    } else {
        echo "No user found with the provided ID.";
    }
}



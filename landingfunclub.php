<?php
session_start();

// Connect to database (replace dbname, username, password with actual credentials)
require_once "databaseconnection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['create'])) {
    $name = $_POST['name'];
    $description = $_POST['description'];
    $contact = $_POST['contact'];
    $website = $_POST['website'];
    $club_id = $_POST['club_id'];

    $sql = "INSERT INTO fun_club (name, description, contact, website, club_id) VALUES (?, ?, ?, ?, ?)";
    $stmt = $connection->prepare($sql);
    if (!$stmt) {
        die('Error in prepare statement: ' . $connection->error);
    }
    $stmt->bind_param("ssssi", $name, $description, $contact, $website, $club_id);

    if ($stmt->execute()) {
        echo "Record added successfully.";
    } else {
        echo "Error adding record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update'])) {
    $id = $_POST['funclub_id'];
    $newname = $_POST['newname'];
    $newdescription = $_POST['newdescription'];
    $newcontact = $_POST['newContact']; // corrected variable name
    $newwebsite = $_POST['newwebsite'];
    $newclub_id = $_POST['newclub_id'];

    $sql = "UPDATE fun_club SET name=?, description=?, contact=?, website=?, club_id=? WHERE funclub_id=?";
    $stmt = $connection->prepare($sql);
    if (!$stmt) {
        die('Error in prepare statement: ' . $connection->error);
    }
    $stmt->bind_param("ssssii", $newname, $newdescription, $newcontact, $newwebsite, $newclub_id, $id);

    if ($stmt->execute()) {
        echo "Record updated successfully.";
    } else {
        echo "Error updating record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete'])) {
    $id = $_POST['funclub_id'];

    $sql = "DELETE FROM fun_club WHERE funclub_id=?";
    $stmt = $connection->prepare($sql);
    if (!$stmt) {
        die('Error in prepare statement: ' . $connection->error);
    }
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "Record deleted successfully.";
    } else {
        echo "Error deleting record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['read'])) {
    $id = $_POST['funclub_id'];

    $sql = "SELECT * FROM fun_club WHERE funclub_id=?";
    $stmt = $connection->prepare($sql);
    if (!$stmt) {
        die('Error in prepare statement: ' . $connection->error);
    }
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo "funclub_id: " . $row["funclub_id"] . "<br>";
        echo "Name: " . $row["name"] . "<br>";
        echo "Description: " . $row["description"] . "<br>";
        echo "Contact: " . $row["contact"] . "<br>";
        echo "Website: " . $row["website"] . "<br>";
        echo "Club ID: " . $row["club_id"] . "<br>";
    } else {
        echo "No user found with the provided ID.";
    }
}
?>

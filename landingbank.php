<?php
session_start();

// Connect to database (replace dbname, username, password with actual credentials)
require_once "databaseconnection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['create'])) {
    $bank_name = $_POST['bank_name'];
    $location = $_POST['location'];
    $website = $_POST['website'];
    $contact = $_POST['contact'];
    $bank_account = $_POST['bank_account'];
    $club_id = $_POST['club_id'];

    $sql = "INSERT INTO bank (bank_name, location, website, contact,bank_account, club_id) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("ssssss", $bank_name, $location, $website, $bank_account, $contact, $club_id);

    if ($stmt->execute()) {
        echo "Record added successfully.";
    } else {
        echo "Error adding record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update'])) {
    $id = $_POST['bank_id'];
    $newbank_name = $_POST['newbank_name'];
    $newlocation = $_POST['newlocation'];
    $newwebsite = $_POST['newwebsite'];
    $newContact = $_POST['newcontact'];
    $newbank_account = $_POST['newbank_account'];
    $newclub_id = $_POST['newclub_id'];

    $sql = "UPDATE bank SET bank_name=?, location=?, website=?, bank_account=?, contact=?, club_id=? WHERE bank_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("ssssssi", $newbank_name, $newlocation, $newwebsite, $newbank_account, $newContact, $newclub_id, $id);

    if ($stmt->execute()) {
        echo "Record updated successfully.";
    } else {
        echo "Error updating record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete'])) {
    $id = $_POST['bank_id'];

    $sql = "DELETE FROM bank WHERE bank_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "Record deleted successfully.";
    } else {
        echo "Error deleting record: " . $stmt->error;
    }
}
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['read'])) {
    // Assuming the session contains bank_id
    $id = $_POST['bank_id'];

    // Select bank's information from the database
    $sql = "SELECT * FROM bank WHERE bank_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Fetch and display bank information
        $row = $result->fetch_assoc();
        echo "bank_id: " . $row["bank_id"] . "<br>";
        echo "First Name: " . $row["location"] . "<br>";
        echo "Last Name: " . $row["bank_name"] . "<br>";
        echo "website: " . $row["website"] . "<br>";
        echo "Contact: " . $row["contact"] . "<br>";
        echo "Bank_account: " . $row["bank_account"] . "<br>";
        echo "Manager ID: " . $row["club_id"] . "<br>";
    } else {
        echo "No user found with the provided ID.";
    }
}



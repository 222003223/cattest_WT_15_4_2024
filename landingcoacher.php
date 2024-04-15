<?php
session_start();

// Connect to database (replace dbname, username, password with actual credentials)
require_once "databaseconnection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['create'])) {
    $last_name = $_POST['last_name'];
    $first_name = $_POST['first_name'];
    $nationality = $_POST['nationality'];
    $email = $_POST['email'];
    $contact = $_POST['contact'];
    $club_id = $_POST['club_id'];

    $sql = "INSERT INTO coacher (last_name, first_name, email, nationality, contact, club_id) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("ssssss", $last_name, $first_name, $email, $nationality, $contact, $club_id);

    if ($stmt->execute()) {
        echo "Record added successfully.";
    } else {
        echo "Error adding record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update'])) {
    $id = $_POST['coacher_id'];
    $newlast_name = $_POST['newlast_name'];
    $newfirst_name = $_POST['newfirst_name'];
    $newnationality = $_POST['newnationality'];
     $newemail = $_POST['newemail'];
    $newContact = $_POST['newContact'];
    $newclub_id = $_POST['newclub_id'];

    $sql = "UPDATE coacher SET last_name=?, first_name=?, email=?, nationality=?, contact=?, club_id=? WHERE coacher_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("ssssssi", $newlast_name, $newfirst_name, $newemail, $newnationality, $newContact, $newclub_id, $id);

    if ($stmt->execute()) {
        echo "Record updated successfully.";
    } else {
        echo "Error updating record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete'])) {
    $id = $_POST['coacher_id'];

    $sql = "DELETE FROM coacher WHERE coacher_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "Record deleted successfully.";
    } else {
        echo "Error deleting record: " . $stmt->error;
    }
}
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['read'])) {
    // Assuming the session contains coacher_id
    $id = $_POST['coacher_id'];

    // Select coacher's information from the database
    $sql = "SELECT * FROM coacher WHERE coacher_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Fetch and display coacher information
        $row = $result->fetch_assoc();
        echo "coacher_id: " . $row["coacher_id"] . "<br>";
        echo "First Name: " . $row["first_name"] . "<br>";
        echo "Last Name: " . $row["last_name"] . "<br>";
        echo "Nationality: " . $row["nationality"] . "<br>";
        echo "Email: " . $row["email"] . "<br>";
        echo "Contact: " . $row["contact"] . "<br>";
        echo "Coacher ID: " . $row["club_id"] . "<br>";
    } else {
        echo "No user found with the provided ID.";
    }
}



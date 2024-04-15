<?php
session_start();

// Connect to database (replace dbname, username, password with actual credentials)
require_once "databaseconnection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['create'])) {
    $last_name = $_POST['last_name'];
    $first_name = $_POST['first_name'];
    $email = $_POST['email'];
    $contact = $_POST['contact'];
    $club_id = $_POST['club_id'];

    $sql = "INSERT INTO manager (last_name, first_name, email, contact, club_id) VALUES (?, ?, ?, ?, ?)";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("ssssi", $last_name, $first_name, $email, $contact, $club_id);

    if ($stmt->execute()) {
        echo "Record added successfully.";
    } else {
        echo "Error adding record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update'])) {
    $id = $_POST['manager_id'];
    $newlast_name = $_POST['newlast_name'];
    $newfirst_name = $_POST['newfirst_name'];
    $newemail = $_POST['newemail'];
    $newContact = $_POST['newContact'];
    $newclub_id = $_POST['newclub_id'];

    $sql = "UPDATE manager SET last_name=?, first_name=?, email=?, contact=?, club_id=? WHERE manager_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("ssssii", $newlast_name, $newfirst_name, $newemail, $newContact, $newclub_id, $id);

    if ($stmt->execute()) {
        echo "Record updated successfully.";
    } else {
        echo "Error updating record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete'])) {
    $id = $_POST['manager_id'];

    $sql = "DELETE FROM manager WHERE manager_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "Record deleted successfully.";
    } else {
        echo "Error deleting record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['read'])) {
    // Assuming the session contains manager_id
    $id = $_POST['manager_id'];

    // Select manager's information from the database
    $sql = "SELECT * FROM manager WHERE manager_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Fetch and display manager information
        $row = $result->fetch_assoc();
        echo "manager_id: " . $row["manager_id"] . "<br>";
        echo "First Name: " . $row["first_name"] . "<br>";
        echo "Last Name: " . $row["last_name"] . "<br>";
        echo "Email: " . $row["email"] . "<br>";
        echo "Contact: " . $row["contact"] . "<br>";
        echo "manager ID: " . $row["club_id"] . "<br>";
    } else {
        echo "No user found with the provided ID.";
    }
}
?>

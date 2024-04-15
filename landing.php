<?php
session_start();

// Connect to database (replace dbname, username, password with actual credentials)
require_once "databaseconnection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['create'])) {
    $last_name = $_POST['last_name'];
    $first_name = $_POST['first_name'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $contact = $_POST['contact'];
    $Manager_id = $_POST['Manager_id'];

    $sql = "INSERT INTO user_admin (last_name, first_name, email, password, contact, Manager_id) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("ssssss", $last_name, $first_name, $email, $password, $contact, $Manager_id);

    if ($stmt->execute()) {
        echo "Record added successfully.";
    } else {
        echo "Error adding record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update'])) {
    $id = $_POST['user_id'];
    $newlast_name = $_POST['newlast_name'];
    $newfirst_name = $_POST['newfirst_name'];
    $newemail = $_POST['newemail'];
    $newpassword = password_hash($_POST['newpassword'], PASSWORD_DEFAULT);
    $newContact = $_POST['newContact'];
    $newManager_id = $_POST['newManager_id'];

    $sql = "UPDATE user_admin SET last_name=?, first_name=?, email=?, password=?, contact=?, Manager_id=? WHERE user_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("ssssssi", $newlast_name, $newfirst_name, $newemail, $newpassword, $newContact, $newManager_id, $id);

    if ($stmt->execute()) {
        echo "Record updated successfully.";
    } else {
        echo "Error updating record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete'])) {
    $id = $_POST['user_id'];

    $sql = "DELETE FROM user_admin WHERE user_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "Record deleted successfully.";
    } else {
        echo "Error deleting record: " . $stmt->error;
    }
}
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['read'])) {
    // Assuming the session contains user_id
    $id = $_POST['user_id'];

    // Select user_admin's information from the database
    $sql = "SELECT * FROM user_admin WHERE user_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Fetch and display user_admin information
        $row = $result->fetch_assoc();
        echo "User_id: " . $row["User_id"] . "<br>";
        echo "First Name: " . $row["first_name"] . "<br>";
        echo "Last Name: " . $row["last_name"] . "<br>";
        echo "Email: " . $row["email"] . "<br>";
        echo "Contact: " . $row["contact"] . "<br>";
        echo "Manager ID: " . $row["Manager_id"] . "<br>";
    } else {
        echo "No user found with the provided ID.";
    }
}



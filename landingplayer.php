<?php
session_start();

// Connect to database (replace dbname, username, password with actual credentials)
require_once "databaseconnection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['create'])) {
    $last_name = $_POST['last_name'];
    $first_name = $_POST['first_name'];
    $email = $_POST['email'];
    $contact = $_POST['contact'];
    $position = $_POST['position'];
    $country = $_POST['country'];
    $club_id = $_POST['club_id'];
    $date_of_birth = $_POST['date_of_birth'];

    $sql = "INSERT INTO player (last_name, first_name, email, contact, position, country, club_id, date_of_birth) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("ssssssss", $last_name, $first_name, $email, $contact, $position, $country, $club_id, $date_of_birth);

    if ($stmt->execute()) {
        echo "Record added successfully.";
    } else {
        echo "Error adding record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update'])) {
    $id = $_POST['playeer_id'];
    $newlast_name = $_POST['newlast_name'];
    $newfirst_name = $_POST['newfirst_name'];
    $newemail = $_POST['newemail'];
    $newContact = $_POST['newContact'];
    $newposition = $_POST['newposition'];
    $newcountry = $_POST['newcountry'];
    $newclub_id = $_POST['newclub_id'];
    $newdate_of_birth = $_POST['newdate_of_birth'];

    $sql = "UPDATE player SET last_name=?, first_name=?, email=?, contact=?, position=?, country=?, club_id=?, date_of_birth=? WHERE playeer_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("ssssssssi", $newlast_name, $newfirst_name, $newemail, $newContact, $newposition, $newcountry, $newclub_id, $newdate_of_birth, $id);

    if ($stmt->execute()) {
        echo "Record updated successfully.";
    } else {
        echo "Error updating record: " . $stmt->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete'])) {
    $id = $_POST['playeer_id'];

    $sql = "DELETE FROM player WHERE playeer_id=?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "Record deleted successfully.";
    } else {
        echo "Error deleting record: " . $stmt->error;
    }
}
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['read'])) {
    // Assuming the session contains player_id
    $id = $_POST['playeer_id'];

    // Select player's information from the database
    $sql = "SELECT * FROM player WHERE playeer_id=?";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        die("Error preparing statement: " . $connection->error);
    }

    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if (!$result) {
        die("Error executing statement: " . $stmt->error);
    }

    if ($result->num_rows > 0) {
        // Fetch and display player information
        $row = $result->fetch_assoc();
        echo "Player_id: " . $row["playeer_id"] . "<br>";
        echo "First Name: " . $row["first_name"] . "<br>";
        echo "Last Name: " . $row["last_name"] . "<br>";
        echo "Email: " . $row["email"] . "<br>";
        echo "Contact: " . $row["contact"] . "<br>";
        echo "Position: " . $row["position"] . "<br>";
        echo "Country: " . $row["country"] . "<br>";
        echo "Club ID: " . $row["club_id"] . "<br>";
        echo "Date_of_Birth: " . $row["date_of_birth"] . "<br>";
    } else {
        echo "No user found with the provided ID.";
    }
}

?>

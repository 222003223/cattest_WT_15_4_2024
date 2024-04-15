<?php
session_start();

// Connect to database (replace dbname, username, contact with actual credentials)
require_once "databaseconnection.php";
//222003223 NIYONSHUTI Jean Pierre 

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email= $_POST['email'];
    $contact = $_POST['contact'];

    // Use prepared statements to prevent SQL injection
    $sql = "SELECT * FROM user_admin WHERE email=?";
    $stmt = $connection->prepare($sql);
    if (!$stmt) {
        die("Prepare failed: " . $connection->error); // added error handling
    }
    $stmt->bind_param("s", $email);
    $stmt->execute();
    if ($stmt->error) {
        die("Execute failed: " . $stmt->error); // added error handling
    }
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        if (contact_verify($contact, $row['contact'])) {
            $_SESSION['email'] = $row['email']; // Set the email session variable
            header("Location:Dashboard.html");
            exit();
        } else {
            echo "Invalid contact and email.";
        }
    } else {
        echo "Email not found.";
    }
}

$connection->close();

function contact_verify($contact, $storedcontact) {
    // Implement your contact verification logic here
    // For simplicity, this function currently compares plain text contacts
    return $contact === $storedcontact;
}
?>

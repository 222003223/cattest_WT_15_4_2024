<?php
// Include the database connection file
require_once "databaseconnection.php";

// Perform SELECT query to retrieve data
$sql = "SELECT * FROM user_admin";
$result = $connection->query($sql);

// Check if any rows are returned
if ($result->num_rows > 0) {
    // Output data in a table format
    echo "<h2>User Information</h2>";
    echo "<table border='1'>";
    echo "<tr><th>User ID</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Contact</th><th>Manager ID</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["User_id"] . "</td>";
        echo "<td>" . $row["first_name"] . "</td>";
        echo "<td>" . $row["last_name"] . "</td>";
        echo "<td>" . $row["email"] . "</td>";
        echo "<td>" . $row["contact"] . "</td>";
        echo "<td>" . $row["Manager_id"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "No records found";
}

// Close the database connection
$connection->close();
?>

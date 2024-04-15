
<?php
require_once "databaseconnection.php";

$sql = "SELECT * FROM bank ";

$result = $connection->query($sql);

if ($result->num_rows > 0) {
    echo "<title>The Information of Bank</title>";
    echo "<h1>The Information of Bank </h1>";
    echo "<table border='1'>
            <tr>
                <th>bank_id</th>
                <th>bank_name</th>
                <th>location</th>
                <th>website</th>
                <th>contact</th>
                <th>bank_account</th>
                <th>club_id</th>
            </tr>";

    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["bank_id"] . "</td>";
        echo "<td>" . $row["bank_name"] . "</td>";
        echo "<td>" . $row["location"] . "</td>";
        echo "<td>" . $row["website"] . "</td>";
        echo "<td>" . $row["contact"] . "</td>";
        echo "<td>" . $row["bank_account"] . "</td>";
        echo "<td>" . $row["club_id"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$connection->close();
?>

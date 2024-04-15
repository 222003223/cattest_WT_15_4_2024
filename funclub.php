
<?php
require_once "databaseconnection.php";

$sql = "SELECT * FROM fun_club ";

$result = $connection->query($sql);

if ($result->num_rows > 0) {
    echo "<title>The Information of funclub</title>";
    echo "<h1>The Information of funclub </h1>";
    echo "<table border='1'>
            <tr>
                <th>Funclub_id</th>
                <th>Name</th>
                <th>Description</th>
                <th>contact</th>
                <th>website</th>
                <th>club_id</th>
            </tr>";

    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["funclub_id"] . "</td>";
        echo "<td>" . $row["name"] . "</td>";
        echo "<td>" . $row["description"] . "</td>";
         echo "<td>" . $row["contact"] . "</td>";
        echo "<td>" . $row["website"] . "</td>";
        echo "<td>" . $row["club_id"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$connection->close();
?>

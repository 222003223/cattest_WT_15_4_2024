
<?php
require_once "databaseconnection.php";

$sql = "SELECT * FROM club ";

$result = $connection->query($sql);

if ($result->num_rows > 0) {
    echo "<title>The Information of club</title>";
    echo "<h1>The Information of club </h1>";
    echo "<table border='1'>
            <tr>
                <th>club_id</th>
                <th>name</th>
                <th>city</th>
                <th>league</th>
                <th>stadium_name</th>
                <th>club_id</th>
            </tr>";

    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["club_id"] . "</td>";
        echo "<td>" . $row["name"] . "</td>";
        echo "<td>" . $row["city"] . "</td>";
        echo "<td>" . $row["league"] . "</td>";
        echo "<td>" . $row["stadium_name"] . "</td>";
        echo "<td>" . $row["league_id"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$connection->close();
?>

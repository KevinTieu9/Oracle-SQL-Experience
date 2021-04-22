<?php

include "Oracle.php";
//include "hsuconnect.php";
//include "dbconnect.php";
$keywordFromForm = $_GET["Keyword"];

//new one
echo "<h2>Keyword Search</h2>";
$sql = "SELECT Name, Answer1, Answer2, Answer3 FROM quiz_table WHERE Name LIKE '%" . $keywordFromForm . "%'";
$result = $mysqli->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Name: " . $row["Name"]. " Answer1: " . $row["Answer1"]. " Answer2: " . $row["Answer2"]. " Answer3: " . $row["Answer3"]."<br>";
  }
} else {
  echo "0 results";
}

?>
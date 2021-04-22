<?php

include "Oracle.php";
//include "hsuconnect.php";

if ($mysqli->connect_errno){
	echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

echo $mysqli->host_info . "<br>";


$sql = "SELECT Name, Answer1, Answer2, Answer3 FROM quiz_table";
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
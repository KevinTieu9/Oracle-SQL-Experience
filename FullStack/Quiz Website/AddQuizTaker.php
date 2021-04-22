<?php

include "Oracle.php";
include "index.php";
//include "dbconnect.php";
$NewQuizName = $_POST["Name"];
$NewQuizAnswer1 = $_POST["two"];
$NewQuizAnswer2 = $_POST["six"];
$NewQuizAnswer3 = $_POST["HSU"];

//new one

echo "<h2>Quiz Taker Name is: $NewQuizName Answer1: $NewQuizAnswer1 Answer2: $NewQuizAnswer2 Answer3: $NewQuizAnswer3</h2>";?>
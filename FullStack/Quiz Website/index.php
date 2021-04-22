<html>

<head>
<style>
<?php include "Format.css";?>
</style>

<?php include "Oracle.php";
//include "hsuconnect.php";
//include "SearchAll.php";
?>

<script type="text/javascript" src="Points.js"></script>

</head>
<div id="main">
<div id="header">
<h1>Quiz Time!?</h1></div>

<body>

<form id="QuizForm" method="post" action="AddQuizTaker.php">

	<p>Please Type In Your Name:</p>
	<input id type="text" name="Name" pattern="[a-zA-Z]{15}+[a-zA-Z0-9 ]{15}" placeholder="Input Full Name" style=width:280px></label>
    <!--First True/False Question-->
	<p>True or False? 2+2 = 4:</p>
		<input id type="radio" name="two" value="1"/>True</label>
		<input type="radio" name="two" value="0"/>False</label>
	<!--Second True/False Question-->
	<p>True or False? 6x6 = 30:</p>
		<input type="radio" name="six" value="0">True</label>
		<input type="radio" name="six" value="1"/>False</label>
	<!--Text-based Question-->
	<p>What city is HSU located in?</p>
		<input id = "HSUCity" type ="text" name ="HSU" placeholder="Input City" style=width:280px></label>
	<!--Grab the data on click-->
	<p><button type="submit" value="Submit" onclick="return GradingFunction()">Submit</button></p>
</form>

<p><b>Your grade is:</b> <span id="grade">__</span>/3</p>
<p><b>How Well Did You Do?:</b> <span id="grade2">__</span><p>

<hr>

<form action="KeyWord.php">
  <label for="fname">Enter a Keyword:</label><br>
  <input type="text" name="Keyword" placeholder="Input keyword to Search" style=width:280px><br>
  
  <p><button type="submit" value="Submit2">Submit Query</button></p>
</form>



<?php
 
//include "KeyWord.php";

?>

</body>

</html>
		
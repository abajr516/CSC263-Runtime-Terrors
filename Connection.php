<!DOCTYPE html>
<html>
<head>
	<title>PHP Connect MySQL Database</title>
</head>
<body>
	<h1>PHP Connect MySQL Database</h1>
	<p><?php
		$servername = "localhost";
		$username = "root"; // MySQL username
		$password = "3333"; // MySQL password
		$dbname = "schooldb"; //database name
		
		// MySQL Connection
		$conn = new mysqli($servername, $username, $password, $dbname);

		// Check Connection
		if ($conn -> connect_error) {
			die ("<p style = 'color: red'>") . "Connection failed:".$conn->connect_error."</p>");
		}
		echo "MySQL Database connected sucessfully.<br>";
	?></p>
</body>
</html>

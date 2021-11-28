<!DOCTYPE html>
<html>

  <head>
    <title>PHP Connect MySQL Database</title>
    <style type="text/css"> 
      th, h1{
        text-align: center;
      }
      table, th, tr, td{
        border: 3px solid ;
      }
      th, tr, td {
        background-color: #ffb500;
      }
      table {
        margin-left: auto;
        margin-right: auto;
        background-color: #e09f00;
      }
      body {
        background-color: #f1efed;
      }
      h4 {
        text-align: center;
      }
    </style>
  </head>

  <body>
    <img src="https://class.adelphi.edu/images/images/adelphi-logo.png" alt="adelphi university logo">
    <h4> Student ID: </h4>
    <h1>
      Transcript
    </h1>
    <p><?php
      $servername = "localhost";
      $username = "root";
      $password = "1234";
      $dbname = "schooldb";
      
      $conn = new mysqli($servername, $username, $password, $dbname);
      if ($conn->connect_error){
        die("<p style='color:red'>" . "Connection failed: " . $conn->connect_error . "</p>");
      }
      $sql = "SELECT grades.term, grades.courseid, courses.coursename, courses.credits, grades.grade
		FROM courses, grades, students
		WHERE courses.courseid = grades.courseid 
		AND grades.studentid = students.studentid 
		AND students.studentid = 1001;";
      $result = $conn->query($sql);
      
      if ($result->num_rows > 0){
      echo "<table><tr><th>Term</th><th>Course ID</th><th>Course Name</th><th>Credits</th><th>Grade</th></tr>";
        while ($row = $result->fetch_assoc()) {
          echo "<tr><td>".$row["term"]."</td><td>".$row["courseid"]."</td><td>".$row["coursename"]."</td><td>".$row["credits"]."</td><td>".$row["grade"]."</td></tr>";
        }
      } 
      else {
        echo "0 results";
      }
      echo "</table>"; 
      $conn->close();
      ?>
    </p>

  </body>

</html>
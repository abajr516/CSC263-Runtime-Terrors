<?php
if (isset($_POST['submitted'])) {
    
    include('Connection.php');

    $term = $_POST['term'];
    $sid = $_POST['studentid'];
    $cid = $_POST['courseid'];
    $grade = $_POST['grade'];
    $sqlinsert = "INSERT INTO grades (courseID, studentID, term, grade) VALUES
                  ('$cid', '$sid', '$term', '$grade')";
    
    if (!mysqli_query($conn, $sqlinsert)) {
        die('error inserting new record');
    } //end of my nested if statement
    $newrecord = "1 record added to the database";
} //end of the main if statement
?>

<!POCTYPE html>
<html>
    <head>
        <title>Grade Post</title>
    </head>
    <body>
        <table>
            <tr>
                <th>

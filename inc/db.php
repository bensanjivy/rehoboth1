<?php
// session_start();
$servername = "ben";
$username = "root";
$password = "";
$dbname = "rehoboth";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// $sql = "SELECT bookname FROM r_booknames";
// $result = $conn->query($sql);

// if ($result->num_rows > 0) {
//     $result = $result->fetch_assoc();
//   // output data of each row
// //   while($row = $result->fetch_assoc()) {
//     echo "id: " . $result["bookname"]. "<br>";
// //   }
// } else {
//   echo "0 results";
// }
// $conn->close();
 ?>

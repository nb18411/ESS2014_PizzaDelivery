<?php
	include_once "config.php";
	// Create connection
	$con=mysqli_connect(HOST, USER, PASSWORD, DATABASE);

	// Check connection
	if (mysqli_connect_errno()) {
	  echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}
	else {
	  echo "Connected to MySQL!";
	}
?>
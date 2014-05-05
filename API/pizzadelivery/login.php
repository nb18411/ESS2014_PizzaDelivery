<?php
	include_once "config.php";
	
	$con=mysqli_connect(HOST, USER, PASSWORD, DATABASE);
	
	// Check connection
	if (mysqli_connect_errno()) {
	  echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}
	else {
		$response = array();
		if (!isset($_POST['username']) | !isset($_POST['pass'])) {
			$response["success"] = "0";
			$response["message"] = "Failed";
		}
		else {
			$sql = "SELECT userid, type FROM `user` WHERE username = '".$_POST['username']."' and password = '".$_POST['pass']."' LIMIT 0, 30 ";
			$result = mysqli_query($con, $sql);
			if (mysqli_num_rows($result) == 0) {
				//Not valid user name or password
				$response["success"] = "0";
				$response["message"] = "Invalid username or password";
			}
			else {
				//Login Success
				$row = mysqli_fetch_array($result);
				$response["success"] = "1";
				$response["userid"] = (int) $row['userid'];
				$response["type"] = (int) $row['type'];
				$response["message"] = "Login Success";
			}
		}
	}
	echo json_encode($response, JSON_PRETTY_PRINT);
	mysqli_close($con);
?>
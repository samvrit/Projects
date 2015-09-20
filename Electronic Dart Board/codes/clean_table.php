<?php
	$dbhandle=mysql_connect("localhost","root","");
	mysql_select_db("dartboard");
	
	mysql_query("truncate table score");
	header("Location: index.php");
?>
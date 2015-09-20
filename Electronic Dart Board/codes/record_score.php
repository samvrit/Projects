<?php
	$id=$_REQUEST['id'];
	$score=$_REQUEST['score'];
	
	$dbhandle=mysql_connect("localhost","root","");
	mysql_select_db("dartboard");
	
	mysql_query("INSERT INTO  `dartboard`.`score` (`id` ,`score`) VALUES ('$id','$score');");
	

?>
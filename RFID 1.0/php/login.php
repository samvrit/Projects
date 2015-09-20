<?php
session_start();
$_SESSION['login']=0;
if(isset($_GET['CardID']))
$CardID=(string)$_GET['CardID'];
if(isset($_GET['img']))
$img=(string)$_GET['img'];
include "functions.php";
$link=connect();

$query="SELECT * FROM `users` WHERE `TCardID`='$CardID'";
$result=mysqli_query($link,$query);
	
if(mysqli_num_rows($result)==0)
header("Location: register1.php?CardID=$CardID&img=$img");

$query1="SELECT * FROM `users` WHERE `TCardID`='$CardID'";
$result1=mysqli_query($link,$query1);	
$res=mysqli_fetch_array($result1);
$db=(string)$res['TCardID'];
	
if($db==$CardID)
{
		
	$_SESSION['login']=1;
	$_SESSION['username']=$res['TUsername'];
	header("Location: home.php");
		
}




?>
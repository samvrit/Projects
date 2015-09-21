<?php
session_start();

include "functions.php";
$link = connect();

$_SESSION['login']=0;
$_SESSION['uexist']=0;

if(isset($_GET['CardID']))
$CardID=(string)$_GET['CardID'];

if(isset($_GET['img']))
$img=(string)$_GET['img'];


if(isset($_POST['submit']))
{
	$Username=$_POST['uname'];
	$Email=mysqli_real_escape_string($link,$_POST['email']);
	$img = mysqli_real_escape_string($link,$_POST['imgid']);
	echo $CardID=(string)$_POST['cardid'];
	$Register=$_POST['submit'];
	
	if(mysqli_num_rows(mysqli_query($link,"SELECT * FROM `users` WHERE `TUsername`='$Username'")))
	$_SESSION['uexist']=1;
	else
	{
	$query="INSERT INTO `users` (`ID`, `TUsername`, `TCardID`, `TEmail`, `TImg`) VALUES (NULL, '$Username', '$CardID', '$Email','$img');";
	$result=mysqli_query($link,$query);
	
	$_SESSION['login']=1;
	$_SESSION['username']=$Username;
	header("Location: home.php");
	}
	
}


?>
<head>
	<title>Register NOW!</title>
<meta name="" content="">
<h1 style="text-align:center;color: #000000">REGISTER HERE</h1>
</head>
<body>
	<body background="img1.png" bgcolor="#ffffff" bgproperties="fixed">
</body>
<form action="" method="POST">
<table>
<tr><td>Username:</td><td><input type="text" name="uname" /></td><td><?php if(isset($_SESSION['uexist'])) if($_SESSION['uexist']==1) echo "Username exists"; else echo "&nbsp;"; ?></td></tr>
<tr><td>Email: </td><td><input type="text" name="email" /></td><td>&nbsp;</td></tr>
<tr><td><input type="submit" name="submit" value="Register" /></td><td><input type="hidden" name="cardid" value="<?php echo $CardID; ?>" /><input type="hidden" name="imgid" value="<?php echo $img; ?>" /></td><td>&nbsp;</td></tr>


</table>
</form>
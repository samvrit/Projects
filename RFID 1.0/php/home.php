<?php

session_start();
include "functions.php";
$link = connect();


if($_SESSION['login']!=1)
header("Location: index.html");

if(isset($_POST['deact']))
{
	$cid = $_POST['deactivatecard'];
	$id1=$_POST['deactivate'];
	$dimg = $_POST['deleteimg'];
	deleteimg($dimg);
	mysqli_query($link,"DELETE FROM users WHERE `ID`='$id1'");
	mysqli_query($link,"DELETE FROM checkin WHERE `TCardID` = '$cid'");
	header("Location: logout.php");
}

$Username=$_SESSION['username'];
$query="SELECT * FROM `users` WHERE `TUsername`='$Username'";
$result=mysqli_query($link, $query);
$res=mysqli_fetch_array($result);

echo "<img src='http://localhost/dj/images/".$res['TImg'].".jpg' align='middle' height=240 width=320 /><br />";
echo "Thank you <b>".$res['TUsername']."</b> :D :D<br />";
echo "Email: <b>".$res['TEmail']."</b><br />";
echo "Card ID: <b>".$res['TCardID']."</b><br /><br />";
$id=$res['ID'];
$img = $res['TImg'];

?>
<head>
	<title>THANK YOU!</title>
<meta name="" content="">
<link rel="stylesheet" href="table.css" type="text/css"/>
</head>

<body background="img1.png" bgcolor="#ffffff" bgproperties="fixed">

<?php

	$cardid = $res['TCardID'];
	
	echo "You have been to:<br />";
	echo "<div class='CSS_Table_Example' style='width:50%;height:100%;'><table>";
	echo "<th>Location</th><th>Time</th>";
	
	$result2 = mysqli_query($link,"SELECT * FROM checkin WHERE `TCardID`='$cardid'");
	
	while($res2 = mysqli_fetch_array($result2))
		echo "<tr><td>".$res2['TLoc']."</td><td>".date("d-m-Y h:i:s A",$res2['TTime']+12600)."</td></tr>";
	
	echo "</table></div><p />";
?>

<p />
<a href="logout.php">Logout</a><br />

<form action="" method="POST">
	<input type="hidden" name="deactivate" value="<?php echo $id; ?>"/><input type="hidden" name="deactivatecard" value="<?php echo $cardid; ?>"/>
	<input type="hidden" name="deleteimg" value="<?php echo $img; ?>"/>
	<input type="submit" name="deact" value="Deactivate Account"/>
</form>


</body>


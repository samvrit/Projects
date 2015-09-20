<?php
include "functions.php";
$link = connect();

if(isset($_POST['updateplace']))
{
	if(isset($_POST['addplace'])) $_POST['addplace']=NULL;
	
	$pid1 = $_POST['uplaceid'];
	$place1 = mysqli_escape_string($link,$_POST['uplacename']);
	mysqli_query($link,"UPDATE `places` SET  `TPlace` =  '$place1' WHERE  `TPlaceID` =  '$pid1'");
}

if(isset($_POST['addplace']))
{
	if(isset($_POST['updateplace'])) $_POST['updateplace']=NULL;
	
	$pid = $_POST['aplaceid'];
	$place = $_POST['aplacename'];
	if(mysqli_num_rows(mysqli_query($link,"SELECT * FROM places WHERE `TPlaceID` = '$pid' OR `TPlace` = '$place'"))>0) echo "Place ID or Place Name already exists.<br />";
	else
	mysqli_query($link,"INSERT INTO places (`ID`,`TPlaceID`,`TPlace`) VALUES(NULL,'$pid','$place')");
}

if(isset($_GET['dplaceid']))
{
	if(isset($_GET['eplaceid'])) $_GET['eplaceid']=NULL;
	
	$id = $_GET['dplaceid'];
	$result2 = mysqli_query($link,"SELECT * FROM places WHERE `TPlaceID`='$id'");
	$res2 = mysqli_fetch_array($result2);
	$tid = $res2['ID'];
	
	mysqli_query($link,"DELETE FROM places WHERE `ID` = '$tid'");
	
}

if(isset($_GET['eplaceid']))
{
	if(isset($_GET['dplaceid'])) $_GET['dplaceid']=NULL;
	
	$id = $_GET['eplaceid'];
	$result2 = mysqli_query($link,"SELECT * FROM places WHERE `TPlaceID`='$id'");
	$res2 = mysqli_fetch_array($result2);
	$placename = $res2['TPlace'];
	
	echo "<b>Update</b><form action='places.php' method='post'><table>";
	echo "<th>Place ID</th><th>Place Name</th><th>&nbsp;</th>";
	echo "<tr><td>$id<input type='hidden' name='uplaceid' value='$id' /></td><td><input type='text' name='uplacename' value='$placename' /></td><td><input type='submit' name='updateplace' value='Update' /></td></tr>";
	echo "</table></form>";
}
?>

<b>Places</b>
<form action="places.php" method="POST">
<table>
<th>Device ID</th><th>Place Name</th><th>Edit | Delete</th>

<?php


$result1 = mysqli_query($link, "SELECT * FROM places");
if(mysqli_num_rows($result1)>0)
{
	while($res1 = mysqli_fetch_array($result1))
	{
		$placeid = $res1['TPlaceID'];
		$place = $res1['TPlace'];
		
		echo "<tr><td>$placeid</td><td>$place</td><td><a href='?eplaceid=$placeid'>Edit</a> | <a href='?dplaceid=$placeid'>Delete</a></td></tr>";
	}
}
$max = mysqli_fetch_array(mysqli_query($link,"SELECT MAX(TPlaceID) AS `MAX` FROM places"));
$max = $max['MAX'];
if($max==NULL) $max=1;
else $max++;
echo "<tr><td><input type='text' name='aplaceid' value = '$max' /></td><td><input type='text' name='aplacename' /></td><td><input type='submit' name='addplace' value='Add' /></tr>";



?>

</table>
</form>
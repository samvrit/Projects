<link rel="stylesheet" href="table.css" type="text/css"/>
<?php

include "functions.php";
$link = connect();

$result1 = mysqli_query($link,"SELECT * FROM users");
while($res1 = mysqli_fetch_array($result1))
{
	$user = $res1['TUsername'];
	$cardid = $res1['TCardID'];
	
	echo "<b>".$user."</b>: ".$cardid."<br />";
	
	echo "<div class='CSS_Table_Example' style='width:50%;height:100%;'><table>";
	echo "<th>Location</th><th>Time</th>";
	
	$result2 = mysqli_query($link,"SELECT * FROM checkin WHERE `TCardID`='$cardid'");
	
	while($res2 = mysqli_fetch_array($result2))
		echo "<tr><td>".$res2['TLoc']."</td><td>".date("d-m-Y h:i:s A",$res2['TTime']+12600)."</td></tr>";
	
	echo "</table><div class='CSS_Table_Example'><p />";
}


?>
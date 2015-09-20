<?php

include "functions.php";
$link= connect();

$cardid = $_GET['CardID'];
$loc = $_GET['Loc'];
$time=time();



$place = mysqli_fetch_array(mysqli_query($link,"SELECT * FROM places WHERE `TPlaceID` = '$loc'"));
$place = $place['TPlace'];


if(mysqli_num_rows(mysqli_query($link,"SELECT * FROM users WHERE `TCardID` = '$cardid'"))>0)
{
	mysqli_query($link,"INSERT INTO checkin (`ID`,`TCardID`,`TLoc`,`TTime`) VALUES(NULL,'$cardid','$place','$time');");
	echo "1";
	
}

else echo "2";

?>
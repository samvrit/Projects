<?php
$dbhandle=mysql_connect("localhost","root","");
mysql_select_db("dartboard");
$result=mysql_query("select * from score");
$total=0;
?>

<?php
echo "<table>
<tr>
<td><b>Attempts</b></td><td><b>Score</b></td></tr>";
if(mysql_num_rows($result)>0)
{
while($row=mysql_fetch_array($result))
	{
		echo "<tr><td>".$row['id']."</td><td>". $row['score']."</td></tr>";
		$id=$row['id'];
		$score=$row['score'];
		$total+=$score;
	}
echo "<tr><td><b>Total:</b></td><td>$total</td></tr>";
}
echo "</table>";

if(mysql_num_rows($result)>0)
{
while($row=mysql_fetch_array($result))
	{
		$id=$row['id'];
		$score=$row['score'];
	}
	switch($score)
	{
		case 10: echo "<img src='pics/Singles/Singles1.jpg' width=390 height=312>"; break;
		case 20: echo "<img src='pics/Singles/Singles2.jpg' width=390 height=312>"; break;
		case 30: echo "<img src='pics/Singles/Singles3.jpg' width=390 height=312>"; break;
		case 40: echo "<img src='pics/Singles/Singles4.jpg' width=390 height=312>"; break;
		default: break;
	}
		
	
}

?>


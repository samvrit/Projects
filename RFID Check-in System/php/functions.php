<?php
function connect()
{
	return mysqli_connect("localhost","root","","users");
}

function deleteimg($img)
{
	$imgd = $img;
	$conn = ftp_connect("localhost");
	ftp_login($conn,"root","sandy");

	ftp_chdir($conn,"dj/images");
	echo ftp_delete($conn,"$imgd.jpg");

	ftp_close($conn);
}

?>
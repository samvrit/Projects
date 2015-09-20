<html>
<head>
<script>
function update()
{
	var xmlhttp;
	if (window.XMLHttpRequest)
		xmlhttp=new XMLHttpRequest();
	else
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		
	xmlhttp.open("GET","call.php",true);
	xmlhttp.send();
	
	xmlhttp.onreadystatechange=function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
				update();
			}
	}
	
}
</script>
</head>
<body onload="update()">
<div id="myDiv" ></div>
<a href="clean_table.php">Reset</a>
</body>
</html>
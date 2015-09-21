import serial
import requests
import time
import webbrowser


ser=serial.Serial('COM14',9600)

while True:
    y=ser.readline()
    z=y.decode("utf-8")
    print(z)
    url="http://localhost/dj/login.php?CardID="+z
    print url
    webbrowser.get(using=None)
    webbrowser.open(url,new=2)
    time.sleep(1)


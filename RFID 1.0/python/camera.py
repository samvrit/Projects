import serial
import requests
import time
import webbrowser
import ftplib
import os
from VideoCapture import Device
cam = Device()


cam.saveSnapshot('temp.jpg')
time.sleep(1)
os.remove('temp.jpg')

session = ftplib.FTP("127.0.0.1")
session.login("root","sandy")
session.cwd('dj/images')




try:
        file = open('number.txt',"r")
except:
	file = open('number.txt',"w")
	file.write('0')
	file.close()



ser=serial.Serial('COM14',9600)

def getnum():
        x = open('number.txt',"r")
        read = x.read(20)
        read1 = int(float(read))
        x.close()
        read1=read1+1
        y = open('number.txt',"w")
        read1=str(read1)
        y.write(read1)
        y.close()
        read1=read1
        x = str(read1)
        return x

def savesnapshot():
        time.sleep(2)
        a = x+".jpg"
        cam.saveSnapshot(a)
        file = open(a,'rb')                  
        session.storbinary('STOR '+a, file)     
        file.close()
        os.remove(a)


while True:
        y=ser.readline()
        z=y.decode("utf-8")
        print(z)
        x=getnum()
        x=str(x)
        url="http://localhost/dj/login.php?CardID="+z+"&img="+x
        print url
        webbrowser.get(using=None)
        webbrowser.open(url,new=2)
        savesnapshot()
        time.sleep(1)

session.quit()

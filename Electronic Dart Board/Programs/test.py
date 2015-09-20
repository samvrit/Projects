import requests
import time
for i in range(1,6):
	score1=raw_input("Score: ")
	x={'id':i,'score':score1}
	r=requests.get("http://localhost/dartboard/record_score.php",params=x)
	time.sleep(1)
print "Game Over"
raw_input("Press any key to exit")

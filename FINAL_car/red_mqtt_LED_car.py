import RPi.GPIO as IO
import time

import paho.mqtt.client as mqtt
# import random
import json  
import datetime 
# import time
import os



ISOTIMEFORMAT = '%m/%d %H:%M:%S'

client = mqtt.Client()


# client.username_pw_set("try","1234")


client.connect("220.132.124.155", 1883, 60)
# -------------------------

IO.setwarnings(False)
IO.setmode(IO.BCM)


IO.setup(19,IO.IN) 

change = True

os.system("echo 22 > /sys/class/gpio/export")
os.system("echo out > /sys/class/gpio/gpio22/direction")
os.system("echo 1 > /sys/class/gpio/gpio22/value")

# 先設為綠色
os.system("echo 5 > /sys/class/gpio/export")
os.system("echo out > /sys/class/gpio/gpio5/direction")
os.system("echo 1 > /sys/class/gpio/gpio5/value")
os.system("echo 12 > /sys/class/gpio/export")
os.system("echo out > /sys/class/gpio/gpio12/direction")


while 1:
    value = IO.input(19)
    if(value == True and value != change):
        os.system("echo 0 > /sys/class/gpio/gpio12/value")
        # 將前面的顏色先關掉

        print(" CAR EMPTY !")
        # 停車位是沒車狀態
        status = 0
        t = datetime.datetime.now().strftime(ISOTIMEFORMAT)
        # payload = {'CAR' : status , 'Time' : t}
        payload = {'CAR' :status}
        print (json.dumps(payload))
        print(payload.get('CAR'))
        
        
        # os.system("echo A")
        # os.system("echo 5 > /sys/class/gpio/export")
        os.system("echo 1 > /sys/class/gpio/gpio5/value")
        # 亮綠燈
        
        
        client.publish("red_A01", payload.get('CAR'))
        change = True
    
    elif(value==False and value != change):
        os.system("echo 0 > /sys/class/gpio/gpio5/value")
        
        
        print("CAR PARKING!")
        status = 1
        t = datetime.datetime.now().strftime(ISOTIMEFORMAT)
        # payload = {'CAR' : status , 'Time' : t}
        payload = {'CAR' :status}
        print (json.dumps(payload))
        print (payload.get('CAR'))

        # os.system("echo 1") 會印出 1
        
        os.system("echo 1 > /sys/class/gpio/gpio12/value")

        
        
        client.publish("red_A01", payload.get('CAR'))
        change = False
        
    time.sleep(1)
        
import RPi.GPIO as IO
import time

import paho.mqtt.client as mqtt
# import random
import json  
import datetime 
# import time



ISOTIMEFORMAT = '%m/%d %H:%M:%S'

client = mqtt.Client()


# client.username_pw_set("try","1234")


client.connect("220.132.124.155", 1883, 60)
# -------------------------

IO.setwarnings(False)
IO.setmode(IO.BCM)


IO.setup(19,IO.IN) 

change = True

while 1:
    value = IO.input(19)
    if(value == True and value != change):
        print("NO CAR !")
        status = 0
        t = datetime.datetime.now().strftime(ISOTIMEFORMAT)
        # payload = {'CAR' : status , 'Time' : t}
        payload = {'CAR' :status}
        print (json.dumps(payload))
        print(payload.get('CAR'))
        
        client.publish("redl", payload.get('CAR'))
        change = True
    
    elif(value==False and value != change): 
        print("CAR COMING!")
        status = 1
        t = datetime.datetime.now().strftime(ISOTIMEFORMAT)
        # payload = {'CAR' : status , 'Time' : t}
        payload = {'CAR' :status}
        print (json.dumps(payload))
        print (payload.get('CAR'))
        
        client.publish("redl", payload.get('CAR'))
        change = False
        
    time.sleep(1)
        
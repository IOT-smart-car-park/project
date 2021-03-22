#!/usr/bin/python
import requests
import base64
import json
import time
import os
import datetime

def __init__(self):
  webcam_command = "fswebcam -r 640x480 -S 20 --no-banner --quiet /root/PyALPR/alpr.jpg"
  self.webcam_command_args = shlex.split(webcam_command)
  #alpr subprocess args
  alpr_command = "alpr -c us -t hr -n 300 -j /root/PyALPR/alpr.jpg"
  self.alpr_command_args = shlex.split(alpr_command)

def ocr(IMAGE_PATH):
  SECRET_KEY = 'sk_3633a26c52f4f3688ef95335'
  with open(IMAGE_PATH, 'rb') as image_file:
    img_base64 = base64.b64encode(image_file.read())
  
  url = 'https://api.openalpr.com/v3/recognize_bytes?recognize_vehicle=1&country=us&secret_key=%s' % (SECRET_KEY)

  r = requests.post(url,data = img_base64)
  try:
    return(r.json()['results'][0]['plate'])

  except:
    print('No number plate found !!')
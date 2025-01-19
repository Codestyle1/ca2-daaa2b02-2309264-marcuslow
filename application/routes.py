from application import app
from flask import render_template, request, flash
from flask_cors import CORS, cross_origin
from tensorflow.keras.preprocessing import image
from PIL import Image, ImageOps
import numpy as np
import tensorflow.keras.models
import re
import base64
from io import BytesIO
# from tensorflow.keras.datasets.mnist import load_data
import json
import numpy as np
import requests
import pathlib, os
def parseImage(imgData):
    # parse canvas bytes and save as output.png
    imgstr = re.search(b'base64,(.*)', imgData).group(1)
    with open('output.png','wb') as output:
        output.write(base64.decodebytes(imgstr))
        im = Image.open('output.png').convert('RGB')
        im_invert = ImageOps.invert(im)
        im_invert.save('output.png')

def make_prediction(instances):
    data = json.dumps({"signature_name": "serving_default", "instances":
    instances.tolist()})
    headers = {"content-type": "application/json"}
    json_response = requests.post(url, data=data, headers=headers)
    predictions = json.loads(json_response.text)['predictions']
    return predictions

#Server URL – change xyz to Practical 7 deployed URL [TAKE NOTE]
url = 'https://gan-model-app-ca2.onrender.com/v1/models/saved_GAN_models'

#Handles http://127.0.0.1:5000/
@app.route('/')
@app.route('/index')
@app.route('/home')
def home():
    return render_template('index.html')
#Handles http://127.0.0.1:5000/predict
@app.route("/predict", methods=['GET','POST'])
@cross_origin(origin='localhost',headers=['Content- Type','Authorization'])
def predict():
    # get data from drawing canvas and save as image
    parseImage(request.get_data())
    # Decoding and pre-processing base64 image
    img = image.img_to_array(image.load_img("output.png", color_mode="grayscale",
    target_size=(28, 28))) / 255.
    # reshape data to have a single channel
    img = img.reshape(1,28,28,1)
    predictions = make_prediction(img)
    ret = ""
    for i, pred in enumerate(predictions):
        ret = "{}".format(np.argmax(pred))
        response = ret
        return response
import io

from flask import render_template, request, flash, redirect
from flask import render_template
from catnotcat import app
from catnotcat.ml import Classifier

@app.route('/')
@app.route('/index')
def index():
    return render_template('upload.html')

@app.route("/upload", methods=["GET", "POST"])
def upload_image():
    if request.method == "POST":
        if request.files:
            image = request.files["image"].read()
            classifier = Classifier()
            result = classifier.classify(image, app.config.get('MODEL_PATH'))
        return render_template('result.html', result=result)
    return render_template('upload.html')

@app.route("/about")
def about():
    return render_template('about.html')
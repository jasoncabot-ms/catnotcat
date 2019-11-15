from keras.models import load_model
from PIL import Image
import numpy as np
from io import BytesIO

class Classifier():

    def classify(self, upload, model_path):
        model = load_model(model_path)

        upload = BytesIO(upload)

        img = Image.open(upload)
        img = img.convert('L')
        img = img.resize((256, 256), Image.ANTIALIAS)
        img = np.array(img).reshape(-1, 256, 256, 1)
        result = model.predict_classes(img)
        return ['Cat', 'Not cat'][result[0]]

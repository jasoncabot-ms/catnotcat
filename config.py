import os

class Config(object):
        SECRET_KEY = os.environ.get('SECRET_KEY') or 'JASIFGH&*£QYR&*UAFYN&QWIRY&QWUINRY&QURYB'
        MAX_CONTENT_LENGTH = 16 * 1024 * 1024 # 16MB
        MODEL_PATH = os.environ.get('MODEL_PATH')

#!/bin/sh

python -m venv venv

. venv/bin/activate

venv/bin/pip install -r requirements.txt

exec python train.py

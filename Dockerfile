FROM python:3.6

RUN adduser --disabled-password catnotcat

WORKDIR /home/catnotcat

COPY requirements.txt requirements.txt

RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn

COPY catnotcat catnotcat
COPY catnotcat.py config.py run.sh model.h5 ./
RUN chmod +x run.sh

ENV FLASK_APP catnotcat.py
ENV MODEL_PATH /home/catnotcat/model.h5

RUN chown -R catnotcat:catnotcat ./
USER catnotcat

EXPOSE 5000
ENTRYPOINT ["./run.sh"]

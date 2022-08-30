FROM python:3.7

RUN useradd -m streamlituser && apt-get update 
# & apt-get install vim net-tools

# Trying to start the cron service. This line does not work.
# RUN service cron start

#RUN chown ytbigdata:ytbigdata -R /home/ytbigdata/app
COPY . /home/streamlituser/app

WORKDIR /home/streamlituser/app

RUN chown streamlituser:streamlituser -R /home/streamlituser/app

RUN pip install --upgrade pip setuptools && pip install -r requirements_py37.txt

EXPOSE 8501
USER root


ENTRYPOINT ["streamlit", "run"]

CMD ["Coastal_Erosion.py"]


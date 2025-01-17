FROM apache/airflow:2.10.4

USER root
RUN apt-get update -q -y && \
    apt-get install -y vim make build-essential libpq-dev && \
    apt-get clean -q -y && \
    apt-get autoclean -q -y && \
    apt-get autoremove -q -y

COPY requirements.txt .

USER airflow
RUN pip install --upgrade pip setuptools wheel && \
    pip install -r requirements.txt

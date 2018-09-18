FROM python:2.7-slim

ENV AIRFLOW_HOME=/usr/local/airflow

ADD Titan /Titan
ADD entrypoint.sh /entrypoint.sh
WORKDIR /Titan/titan.workflow/
RUN echo "deb http://security.debian.org/debian-security wheezy/updates main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y gcc libmysqlclient-dev mysql-client && \
    pip install mysqlclient && \
    pip install cryptography && \
    pip install kubernetes && \
    python setup.py install

EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
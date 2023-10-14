FROM spark-py:v3.5.0
USER root
RUN mkdir "/app"
COPY spark_simple.py /app
USER ${spark_uid}
FROM python:3.9

RUN apt install openssl=3.0.10 -y
RUN openssl version

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

COPY edr_stager_dbt_project /edr_stager_dbt_project
COPY entrypoint.py /entrypoint.py

ENTRYPOINT [ "python", "/entrypoint.py" ]

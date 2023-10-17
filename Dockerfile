FROM python:3.9

COPY requirements.txt /requirements.txt
RUN pip install -U oscrypto
RUN pip install --no-cache-dir -r /requirements.txt

RUN openssl version
RUN pip show oscrypto


COPY edr_stager_dbt_project /edr_stager_dbt_project
COPY entrypoint.py /entrypoint.py

ENTRYPOINT [ "python", "/entrypoint.py" ]

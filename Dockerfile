FROM python:3.9

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt
RUN pip install -U oscrypto

COPY edr_stager_dbt_project /edr_stager_dbt_project
COPY entrypoint.py /entrypoint.py

ENTRYPOINT [ "python", "/entrypoint.py" ]

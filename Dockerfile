FROM python:3.9

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

RUN wget https://www.openssl.org/source/old/3.0/openssl-3.0.9.tar.gz -O - | tar -xz
WORKDIR /openssl-3.0.9
RUN ./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl && make && make install

RUN openssl version

COPY edr_stager_dbt_project /edr_stager_dbt_project
COPY entrypoint.py /entrypoint.py

ENTRYPOINT [ "python", "/entrypoint.py" ]

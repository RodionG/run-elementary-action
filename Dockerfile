FROM python:3.9

RUN apt-get update && apt-get install -y git
RUN python -m pip uninstall oscrypto -y
RUN python -m pip install oscrypto@git+https://github.com/wbond/oscrypto.git@d5f3437ed24257895ae1edd9e503cfb352e635a8

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

COPY edr_stager_dbt_project /edr_stager_dbt_project
COPY entrypoint.py /entrypoint.py

ENTRYPOINT [ "python", "/entrypoint.py" ]

FROM python:3

EXPOSE 5232

RUN apt-get update && apt-get install -y apache2-utils
RUN python3 -m pip install --upgrade radicale
RUN python3 -m pip install --upgrade bcrypt
RUN mkdir /data
ADD entrypoint.sh .

CMD /entrypoint.sh

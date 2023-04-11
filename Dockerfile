
FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
# RUN apt-get list | grep python3.9
RUN apt-get install -y python3.9
RUN apt-get update
RUN apt-get install -y python3-pip
RUN apt-get update
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2
RUN update-alternatives --config python3
# RUN python3 -v

RUN apt-get update
RUN apt-get install -y gnupg wget
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN apt-get update
# ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y mongodb-org

RUN mkdir -p /data/db


WORKDIR /app

RUN pip3 install pymongo==3.11

COPY . .

CMD ["mongod", "--bind_ip_all"]

CMD ["python3","app.py"]


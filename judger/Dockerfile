FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y zip unzip build-essential fp-compiler python python3 python3-requests openjdk-8-jdk openjdk-11-jdk


COPY judge_client /opt/uoj/
COPY uoj_judger /opt/uoj/
COPY docker-entrypoint.sh /
WORKDIR /opt/uoj/

ENTRYPOINT /docker-entrypoint.sh
CMD judge_client
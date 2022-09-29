FROM uojbase
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i -e "s|archive.ubuntu.com|mirrors.hit.edu.cn|g" -e "s|security.ubuntu.com|mirrors.hit.edu.cn|g" /etc/apt/sources.list
RUN apt-get update && apt-get install -y zip unzip build-essential fp-compiler python python3 python3-requests openjdk-8-jdk openjdk-11-jdk

# COPY uoj_judger /opt/uoj/judger/uoj_judger
# RUN cd /opt/uoj/judger/uoj_judger && make -j$(($(nproc) + 1))

COPY judge_client /opt/uoj/judger/
COPY docker-entrypoint.sh /

RUN useradd judger && chown -R judger:judger /opt/uoj/judger
USER judger
WORKDIR /opt/uoj/judger/
VOLUME ["/opt/uoj/judger/conf"]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/uoj/judger/judge_client"]

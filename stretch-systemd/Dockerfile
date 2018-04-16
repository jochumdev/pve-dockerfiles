FROM scratch

ENV DEBIAN_FRONTEND noninteractive
ENV container docker

LABEL maintainer="rene@jochums.at"

ADD rootfs.tar.xz /

# add contrib, non-free and backports repositories
ADD sources.list /etc/apt/sources.list
# pin stable repositories
ADD preferences /etc/apt/preferences

# set random root password
RUN P="$(dd if=/dev/random bs=1 count=8 2>/dev/null | base64)" ; echo $P && echo "root:$P" | chpasswd

RUN apt-get -qq update && apt-get dist-upgrade -y && apt-get install -t stretch-backports -y libsystemd-dev systemd

CMD ["/lib/systemd/systemd"]
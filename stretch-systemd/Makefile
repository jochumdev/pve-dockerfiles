all:
	docker build -t pcdummy/stretch-systemd .

update-rootfs:
	wget -O rootfs.tar.xz https://github.com/debuerreotype/docker-debian-artifacts/blob/dist-amd64/stretch/rootfs.tar.xz?raw=true

rebuild:
	docker build --no-cache=true -t pcdummy/stretch-systemd .

push:
	docker tag pcdummy/stretch-systemd pcdummy/stretch-systemd:$$(date +%Y%m%d)
	docker push pcdummy/stretch-systemd

run:
	docker run -d -it --mount type=tmpfs,destination=/run --mount type=tmpfs,destination=/run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro pcdummy/stretch-systemd
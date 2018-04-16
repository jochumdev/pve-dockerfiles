all:
	docker build -t pcdummy/buster-systemd .

update-rootfs:
	wget -O rootfs.tar.xz https://github.com/debuerreotype/docker-debian-artifacts/blob/dist-amd64/buster/rootfs.tar.xz?raw=true

rebuild:
	docker build --no-cache=true -t pcdummy/buster-systemd .

push:
	docker tag pcdummy/buster-systemd pcdummy/buster-systemd:$$(date +%Y%m%d)
	docker push pcdummy/buster-systemd

run:
	docker run -d -it --mount type=tmpfs,destination=/run --mount type=tmpfs,destination=/run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro pcdummy/buster-systemd
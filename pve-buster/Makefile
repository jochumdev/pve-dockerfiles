all:
	docker build -t pcdummy/pve-buster .

rebuild:
	docker build --no-cache=true -t pcdummy/pve-buster .

push:
	docker tag pcdummy/pve-buster pcdummy/pve-buster:$$(date +%Y%m%d)
	docker push pcdummy/pve-buster

run:
	docker run -d -it --mount type=tmpfs,destination=/run --mount type=tmpfs,destination=/run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro pcdummy/pve-buster
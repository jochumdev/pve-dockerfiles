all:
	docker build -t pcdummy/pve-stretch .

rebuild:
	docker build --no-cache=true -t pcdummy/pve-stretch .

push:
	docker tag pcdummy/pve-stretch pcdummy/pve-stretch:$$(date +%Y%m%d)
	docker push pcdummy/pve-stretch

run:
	docker run -d -it --mount type=tmpfs,destination=/run --mount type=tmpfs,destination=/run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro pcdummy/pve-stretch
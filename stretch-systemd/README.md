# pcdummy/stretch-systemd

This contains a Debian stretch GNU/Linux image that has been adopted from the semi official debian:stretch image,
we added a `random password` and `systemd` from stretch-backports.


## run in docker:

eiter run:

``` bash
make run
```

or:

```bash
docker run -d -it --mount type=tmpfs,destination=/run --mount type=tmpfs,destination=/run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro pcdummy/stretch-systemd
```

## This works also with gitlab-runner:

My **/etc/gitlab-runner/config.toml**

    concurrent = 1
    check_interval = 0

    [[runners]]
    name = "gitr docker"
    url = "https://git.mydomain.org/"
    token = "XXX"
    executor = "docker"
    [runners.docker]
        pull_policy = "never"
        tls_verify = false
        image = "stretch-systemd"
        privileged = false
        disable_cache = false
        volumes = ["/sys/fs/cgroup:/sys/fs/cgroup:ro", "/cache"]
        shm_size = 0
    [runners.docker.services_tmpfs]
        "/run" = "rw"
        "/run/lock" = "rw"
    [runners.cache]


## update the rootfs:

Run:

``` bash
make update-rootfs
```
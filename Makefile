SHELL:=/bin/bash

export ALL_IMAGES=stretch-systemd pve-stretch buster-systemd pve-buster

all:
	for image in $${ALL_IMAGES[@]}; do	\
		cd $$image;				 	\
		make;						\
		cd ..;						\
	done

.PHONY: update-rootfs
update-rootfs:
	for image in $${ALL_IMAGES[@]}; do	\
		cd $$image;				 	\
		make update-rootfs;			\
		cd ..;						\
	done

.PHONY: rebuild
rebuild:
	for image in $${ALL_IMAGES[@]}; do	\
		cd $$image;				 	\
		make rebuild;				\
		cd ..;						\
	done

.PHONY: push
push:
	for image in $${ALL_IMAGES[@]}; do	\
		cd $$image;				 	\
		make rebuild;				\
		cd ..;						\
	done
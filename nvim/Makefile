CONTAINER="t14n/nvim"

.PHONY:
build:
	@docker build -t ${CONTAINER} . 

.PHONY:
debug:
	@docker run --rm -it --entrypoint sh -v ${PWD}:/home/t14n/config-files --workdir=${PWD} ${CONTAINER}

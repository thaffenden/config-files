CONTAINER="t14n/nvim"
NVIM_CONFIG_DIR="/home/t14n/.config/nvim"

define debug-volume-mounts
	-v ${PWD}/config/coc-settings.json:${NVIM_CONFIG_DIR}/coc-settings.json $\
		-v ${PWD}/config/functionality:${NVIM_CONFIG_DIR}/functionality $\
		-v ${PWD}/config/lua:${NVIM_CONFIG_DIR}/lua $\
		-v ${PWD}/config/plugins:${NVIM_CONFIG_DIR}/plugins $\
		-v ${PWD}/config/theme:${NVIM_CONFIG_DIR}/theme $\
		-v ${PWD}/config/UltiSnips:${NVIM_CONFIG_DIR}/UltiSnips $\
		-v ${PWD}/config/init.vim:${NVIM_CONFIG_DIR}/init.vim $\
		-v ${PWD}/config/init.lua:${NVIM_CONFIG_DIR}/init.lua
endef

.PHONY:
build:
	@docker build -t ${CONTAINER} . 

.PHONY:
debug:
	@docker run --rm -it --entrypoint sh -v ${PWD}:/home/t14n/config-files --workdir=${PWD} $(debug-volume-mounts) ${CONTAINER}

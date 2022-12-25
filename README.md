# Not affiliated with the official project

https://www.lunarvim.org/

https://github.com/LunarVim/LunarVim

### A base docker image
Provides a docker image for the OOTB LunarVim experience with no additional plugins or config

[Dockerfile](https://github.com/nicklundin08/lvim-docker/blob/main/stock.slim.Dockerfile)

[DockerHub](https://hub.docker.com/repository/docker/nlundin08/lvim-stock-slim/general)
```
// This will place you inside a bash shell in the running container
docker run -it nlundin08/lvim-slim-stock:release-1.2-neovim-0.8

lvim
// or 
lvim /path/to/foler
```

This can be used as a building block for bootstrapping new docker images with custom LunarVim config  


### Starter config
Extend the base image above by create a new image with the starter config pre-loaded

[Dockerfile](https://github.com/nicklundin08/lvim-docker/blob/main/custom_example.starter.Dockerfile)
```
FROM nlundin08/lvim-stock-slim:release-1.2-neovim-0.8


#############################
# Install additional packages
#############################
RUN apk add zsh openjdk17
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN echo 'export LV_PATH=/root/.local/bin' >> /root/.zshrc
RUN echo 'export PATH=$PATH:$LV_PATH' >> /root/.zshrc

##########################
# Swap out default config
##########################
RUN rm -rf /root/.config/lvim/
RUN git clone https://github.com/LunarVim/starter.lvim.git /root/.config/lvim
RUN cd /root/.config/lvim && git checkout java-ide
RUN "/root/.local/bin/lvim" --headless \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'
CMD /bin/zsh
```




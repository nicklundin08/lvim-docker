# lvim-docker


# stock.slim.Dockerfile
Provides a docker image for the OOTB LunarVim experience with no additional plugins or config

[DockerHub](https://hub.docker.com/repository/docker/nlundin08/lvim-stock-slim/general)

```
// This will place you inside a bash shell in the running container
docker run -it nlundin08/lvim-slim-stock:release-1.2-neovim-0.8

lvim
// or 
lvim /path/to/foler
```

This can be used as a building block for bootstrapping new docker images with custom LunarVim config  

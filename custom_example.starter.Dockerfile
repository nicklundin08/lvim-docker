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


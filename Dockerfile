FROM alpine:3.23

ARG USER_ID
ARG USERNAME

ENV HOME=/home/${USERNAME}

WORKDIR /workspace

# copy nvim config from the build context
COPY nvim ${HOME}/.config/nvim

RUN adduser -D -u "${USER_ID}" -G users -h "${HOME}" "${USERNAME}" \
    && apk add --no-cache \
        neovim \
        git ripgrep curl \
        fontconfig font-hack-nerd \
        musl-dev \
        rust-analyzer go gopls \
    && fc-cache -fv || true \
    && chown -R "${USER_ID}":users "${HOME}" \
    && apk del fontconfig font-hack-nerd



USER ${USER_ID}:users

ENTRYPOINT ["nvim"]
CMD []


FROM alpine:3.23

ARG USER_ID
ARG USERNAME

ENV HOME=/home/${USERNAME}

WORKDIR /workspace

RUN apk add --no-cache \
	neovim \
        git ripgrep curl \
        fontconfig font-hack-nerd \
        musl-dev \
        rust-analyzer go gopls \
    && fc-cache -fv || true \
    && apk del fontconfig font-hack-nerd

RUN adduser -D -u "${USER_ID}" -G users -h "${HOME}" "${USERNAME}"

# copy nvim config from the build context
COPY --chown=${USER_ID}:users nvim ${HOME}/.config/nvim

USER ${USER_ID}:users

RUN nvim --headless "+Lazy! sync" +qa \
    && nvim --headless "+TSUpdateSync" +qa \
    && chown -R "${USER_ID}":users "${HOME}"

ENTRYPOINT ["nvim"]
CMD []


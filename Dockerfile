FROM debian:forky-slim AS builder

ARG USERNAME

ENV HOME=/home/${USERNAME}

RUN apt update \
    && apt install --no-install-recommends -y \
        gcc libc6-dev curl ca-certificates git make cmake unzip neovim python3 python3-pip python3-venv \
    && curl -LO https://go.dev/dl/go1.25.6.linux-arm64.tar.gz \
    && tar -C /usr/local -xzf go1.25.6.linux-arm64.tar.gz

COPY nvim ${HOME}/.config/nvim

ENV PATH="${PATH}:/usr/local/go/bin"

RUN nvim --headless "+Lazy! sync" +qa \
    && nvim --headless "+MasonInstall gopls rust-analyzer ruff basedpyright" +qa \
    && nvim --headless "+TSUpdateSync" +qa



FROM debian:forky-slim AS final

ARG USER_ID
ARG USERNAME

ENV HOME=/home/${USERNAME}
ENV PATH="${PATH}:/usr/local/go/bin"

WORKDIR /workspace

RUN apt update \
    && apt install --no-install-recommends -y neovim ripgrep git python3-minimal \
    && rm -rf /var/lib/apt/lists/* \
    && useradd \
    --uid "${USER_ID}" \
    --gid users \
    --home-dir "${HOME}" \
    --create-home \
    --shell /bin/bash \
    "${USERNAME}" \
    && chown -R "${USER_ID}":users "${HOME}"

USER ${USER_ID}:users

COPY --from=builder --chown=${USER_ID}:users ${HOME}/.config/nvim ${HOME}/.config/nvim
COPY --from=builder --chown=${USER_ID}:users ${HOME}/.local/share/nvim ${HOME}/.local/share/nvim/
COPY --from=builder --chown=${USER_ID}:users /usr/local/go /usr/local/go/

ENTRYPOINT ["nvim"]
CMD []

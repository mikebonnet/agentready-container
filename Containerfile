FROM quay.io/fedora/fedora:latest

ENV VIRTUAL_ENV="/opt/venv" \
    PATH="/opt/venv/bin:$PATH" \
    UV_NO_CACHE=1 \
    UV_NO_MANAGED_PYTHON=1 \
    GOBIN=/usr/bin

RUN dnf -y --setopt=install_weak_deps=false install python3 uv git-core golang
RUN uv venv $VIRTUAL_ENV
RUN uv pip install agentready
RUN go install github.com/fzipp/gocyclo/cmd/gocyclo@latest

ENTRYPOINT ["agentready"]
CMD ["--help"]

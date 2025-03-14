ARG VARIANT="6.0-bullseye-slim"
FROM mcr.microsoft.com/vscode/devcontainers/dotnet:0-${VARIANT}

ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

RUN apt-get update
RUN su vscode --command 'sh -c "$(curl -fsSL https://aka.ms/install-artifacts-credprovider.sh)"'
RUN su vscode --command 'curl -s "https://get.sdkman.io" | bash && source "${HOME}/.sdkman/bin/sdkman-init.sh" && sdk install java "${JAVA_VERSION}"'

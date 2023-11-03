FROM gitpod/workspace-full

# Set up the non-interactive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Install custom tools, runtime, etc.
# install-packages is a wrapper for `apt` that helps skip a few commands in the docker env.
RUN sudo install-packages \
          binwalk \
          clang \
          tmux
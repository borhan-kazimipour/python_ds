ARG python_version=latest
FROM python:$python_version

LABEL author="Borhan Kazimipour"
LABEL maintainer="borhan.kazimi@gmail.com"

# Set default user name. Containers will be run as this user.
ARG user_name=me

# Set default libraries level
ARG level=bare

# Copy Python dependency list from the host to Docker container
COPY requirements_$level.txt /tmp/requirements.txt

# Install libraries based on the level and then clean up
RUN pip3 install --upgrade pip \
	&& pip3 install -r /tmp/requirements.txt --compile \
  && rm -rf /tmp/* \
  && rm -rf /var/tmp/*

# Enable colourful terminal
ENV TERM=xterm-256color

# Create working directory inside Docker container
# use -v <local-path>:/workdir to share the volume between host and Docker container
RUN mkdir /workdir

# Sets working directory (overwrite using -w if needed)
WORKDIR /workdir

# Add Users
RUN useradd -m $user_name
USER $user_name

CMD /bin/bash

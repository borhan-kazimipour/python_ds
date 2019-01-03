ARG python_version=latest

FROM python:$python_version

LABEL author="Borhan Kazimipour"
LABEL maintainer="borhan.kazimi@gmail.com"

# Creates working directory inside Docker container
# use -v <local-path>:/workdir to share the volume between host and Docker container
RUN mkdir /workdir

# Sets working directory (overwrite using -w if needed)
WORKDIR /workdir

CMD /bin/bash

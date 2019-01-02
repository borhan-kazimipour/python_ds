ARG python_version=latest

FROM python:$python_version

LABEL author="Borhan Kazimipour"
LABEL maintainer="borhan.kazimi@gmail.com"


RUN echo "$(python --version)"
CMD /bin/bash

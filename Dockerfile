FROM python:3.9-slim

RUN apt update
RUN apt install -y git gcc g++
ARG GIT_SNAPSHOT

# We clone the project
RUN git clone https://gitlab.com/litecord/litecord.git /litecord/

WORKDIR /litecord/

# Change to declared branch
RUN git reset --hard $GIT_SNAPSHOT

RUN pip install -U poetry
RUN poetry install

COPY ./config.py /litecord/config.py
COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 5000
EXPOSE 5001

ENTRYPOINT ["/entrypoint.sh"]

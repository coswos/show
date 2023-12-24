# image from docker hub
FROM python:3.11-slim


# commands will be run during the image build process
RUN apt-get update -y \
    && pip install --upgrade pip \
    # necessary for proper assembly of other packages
    && pip install --upgrade setuptools \
    # without this may be problem on Linux, will be better install this (good practice)
    && apt-get install -y build-essential \
    && pip install pipenv \
    && apt install make

# commands after launch container (for optimization rebuild image)
COPY ./Pipfile ./Pipfile.lock  /
RUN pipenv sync

# the container will be launched in this directory every time
WORKDIR /app

CMD [ "pipenv shell && make run" ]
FROM python:3.8.16-slim-buster
COPY ./* ./app/
RUN ls
WORKDIR app
RUN apt-get update && apt-get install git-all -y
RUN pip install -r requirements.txt
EXPOSE 7860

FROM python:3.8.16-slim-buster
RUN sudo apt-get update
RUN sudo apt-get install git-lfs
RUN git-lfs clone $hf_repo
WORKDIR $name

EXPOSE 7860
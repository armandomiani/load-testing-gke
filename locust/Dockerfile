FROM python:3.7.2

ADD src /locust

ENV GOOGLE_APPLICATION_CREDENTIALS /keys/gcloud.json

RUN mkdir -p /locust/stats
RUN pip install -r /locust/requirements.txt

RUN ls /locust
RUN chmod +x /locust/*.sh
RUN /locust/setup_gcsfuse.sh

EXPOSE 5557 5558 8089

ENTRYPOINT ["/locust/run.sh"] 
FROM python:3.7.2

ADD src /locust

RUN mkdir -p /locust/stats
RUN pip install -r /locust/requirements.txt

EXPOSE 5557 5558 8089

RUN chmod +x /locust/run.sh

ENTRYPOINT ["/locust/run.sh"] 
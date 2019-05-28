from locust import HttpLocust, TaskSet, task


class WebsiteTaskSet(TaskSet):
    @task
    def homepage(self):
        self.client.get('/')

    @task
    def reset_cache(self):
        self.client.get("/nocache")

    @task
    def get_listings(self):
        self.client.get('/listings')


class WebsiteLocust(HttpLocust):
    task_set = WebsiteTaskSet
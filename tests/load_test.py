##📌 Install Locust:
pip install locust

##📌 Create load_test.py:
from locust import HttpUser, task, between

class FintechLoadTest(HttpUser):
    wait_time = between(1, 5)  # Simulate user behavior with random wait times

    @task
    def test_homepage(self):
        self.client.get("/")

    @task
    def test_health(self):
        self.client.get("/health")

##💡 Run Load Test using Locust:
locust -f tests/load_test.py --host=http://localhost:5000

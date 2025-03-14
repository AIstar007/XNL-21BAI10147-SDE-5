import pytest
from src.app import app  # Import the Flask app

@pytest.fixture
def client():
    """Creates a test client for the Flask app."""
    with app.test_client() as client:
        yield client

def test_home(client):
    """Test the home route response."""
    response = client.get('/')
    assert response.status_code == 200
    assert response.json == {"message": "Welcome to Fintech App!"}

def test_health_check(client):
    """Test the health check endpoint."""
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json == {"status": "healthy"}

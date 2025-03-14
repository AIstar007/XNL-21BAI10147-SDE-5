import requests

BASE_URL = "http://localhost:5000"  # Replace with deployed URL when testing remotely

def test_endpoints():
    """Test API endpoints with real HTTP requests."""
    
    # Test Home Route
    response = requests.get(f"{BASE_URL}/")
    assert response.status_code == 200
    assert response.json()["message"] == "Welcome to Fintech App!"
    
    # Test Health Check
    response = requests.get(f"{BASE_URL}/health")
    assert response.status_code == 200
    assert response.json()["status"] == "healthy"

if __name__ == "__main__":
    test_endpoints()
    print("✅ Integration tests passed!")

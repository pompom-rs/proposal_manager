import pytest
from fastapi.testclient import TestClient
from app.main import app

@pytest.fixture
def client():
    """Fixture pro vytvoření testovacího klienta FastAPI."""
    return TestClient(app)

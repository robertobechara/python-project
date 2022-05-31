from src.models.user import User
from src.user.main import execute


def test_execute():
    input_user = User(name="Roberto", email="roberto.bechara@gmail.com")
    expected = "Hi, Roberto"
    result = execute(input_user)

    assert expected == result

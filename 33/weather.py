# weather.py
import requests

def get_weather(city: str) -> str:
    """Fetches weather data for a given city using a fake API."""
    response = requests.get(f"https://api.example.com/weather/{city}")
    if response.status_code != 200:
        raise ValueError("Could not retrieve weather data")
    
    data = response.json()
    return f"The temperature in {city} is {data['temperature']}°C"

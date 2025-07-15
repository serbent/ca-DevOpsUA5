# test_weather.py
import unittest
from unittest.mock import patch, Mock
from weather import get_weather

class TestWeather(unittest.TestCase):
    @patch('weather.requests.get')
    def test_get_weather_success(self, mock_get):
        # Create a mock response object
        mock_response = Mock()
        mock_response.status_code = 200
        mock_response.json.return_value = {'temperature': 22}
        mock_get.return_value = mock_response

        result = get_weather("Berlin")
        self.assertEqual(result, "The temperature in Berlin is 22°C")
        mock_get.assert_called_once_with("https://api.example.com/weather/Berlin")

    @patch('weather.requests.get')
    def test_get_weather_failure(self, mock_get):
        mock_response = Mock()
        mock_response.status_code = 404
        mock_get.return_value = mock_response

        with self.assertRaises(ValueError):
            get_weather("Nowhere")

if __name__ == '__main__':
    unittest.main()

import requests

URI = "https://15min.lt" 

def fetch_net():
    response = requests.get(URI)
    if response.status_code == 200:
        return "All good, got response from 15min.lt"
    return "All bad, no response from 15min.lt"

def parse():
    answer = fetch_net() + str(", Parsing")
    return answer
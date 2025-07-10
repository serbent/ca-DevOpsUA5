import requests

response = requests.get('https://ifconfig.me/all')

print("Status Code:", response.status_code)  # Should print 200 if the request was successful

if response.status_code == 200:
    try:
        data = response.json()
        print("IP Address:", data.get('ip_addr', 'Not found'))
        print("City:", data.get('city', 'Not found'))
        print("Region:", data.get('region', 'Not found'))
        print("Country:", data.get('country', 'Not found'))
    except ValueError:
        print("Response is not in JSON format. Raw response text:")
        print(response.text)

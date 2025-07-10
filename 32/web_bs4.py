from bs4 import BeautifulSoup
import requests

# URL to scrape
url = 'https://thypost.com/quote-of-the-day'

# Send a GET request to the URL
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    # Parse the HTML content using BeautifulSoup
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # print("Scraped Data:")
    # print(soup.prettify())  # Print the formatted HTML content
else:
    print(f"Failed to retrieve data. Status code: {response.status_code}")

# Find all the paragraphs in the HTML
paragraphs = soup.find_all(class_='quote')
for i, paragraph in enumerate(paragraphs):
    # Print the text of each paragraph
    print(f"Paragraph {i + 1}: {paragraph.get_text()}")
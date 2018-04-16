import requests
from lxml.html import fromstring
import argparse

desc = '''
This script gets the title of specifed page url.
'''

parser = argparse.ArgumentParser(description=desc)
parser.add_argument('url', help='URL to get the title')

try:
    args = parser.parse_args()
except:
    exit()

url = args.url
r = requests.get(url)
tree = fromstring(r.content)
print(tree.findtext('.//title'))


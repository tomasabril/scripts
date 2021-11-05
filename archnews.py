#!/usr/bin/python

import requests
import bs4
import datetime

content = requests.get('https://archlinux.org/feeds/news/')

#lxml
#html.parser
soup = bs4.BeautifulSoup(content.text, 'xml')

titles = soup.find_all('title')
dates  = soup.find_all('pubDate')

#print("\033[1mArch Linux Latest News \033[0m")
print("\033[1m> " + titles[0].string + "\033[0m")
for (t, d, _) in zip(titles[1:], dates, [1, 2, 3]):
    print(d.string[5:16], ":", t.string)


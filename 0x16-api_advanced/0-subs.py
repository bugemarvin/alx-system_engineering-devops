#!/usr.bin/python3
'''function to return the number of Reddit API subscribers
'''
import requests
import json


def number_of_subscribers(subreddit):
    '''find number of subscribers from reddit.
    No authentication requiered
    constrains:
    not active users, total subscribers for a given subreddit.
    if invalid subreddit return 0
    in order to avoid redirects add a User-Agent
    '''

    url = f"https://www.reddit.com/r/{subreddit}/about.json"

    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; rv:91.0) G\
                ecko/20100101 Firefox/91.0'}

    res = requests.get(url, headers=headers, allow_redirects=False)

    if res.status_code == 200:
        json_res = res.json()['data']['subscribers']
        return json_res
    return 0

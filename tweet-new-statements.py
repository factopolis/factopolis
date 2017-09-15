#!/usr/bin/python3

import os, re, json, twitter

def tweet(msg):
    if ('TWITTER_CONSUMER_KEY' in os.environ
            and 'TWITTER_CONSUMER_SECRET' in os.environ
            and 'TWITTER_ACCESS_TOKEN_KEY' in os.environ
            and 'TWITTER_ACCESS_TOKEN_SECRET' in os.environ
            and "TRAVIS_BRANCH" in os.environ
            and os.environ["TRAVIS_BRANCH"] == "master"
            and "TRAVIS_PULL_REQUEST" in os.environ
            and os.environ["TRAVIS_PULL_REQUEST"] == "false"):
        consumer_key=os.environ['TWITTER_CONSUMER_KEY']
        consumer_secret=os.environ['TWITTER_CONSUMER_SECRET']
        access_token_key=os.environ['TWITTER_ACCESS_TOKEN_KEY']
        access_token_secret=os.environ['TWITTER_ACCESS_TOKEN_SECRET']

        tApi = twitter.Api(
            consumer_key=consumer_key,
            consumer_secret=consumer_secret,
            access_token_key=access_token_key,
            access_token_secret=access_token_secret,
            input_encoding="utf-8")
        tApi.PostUpdate(msg)

    print("@factopolisdb says:", msg)

def twitterOrName(person):
    fp = open("web/person/{}/index.json".format(person))
    data = json.load(fp)
    if 'twitter' in data:
        return '@' + data['twitter']
    else:
        return data['name']

def handleStatement(filename):
    fp = open(re.sub('^content/(.+)\.md$', 'web/\\1/index.json', filename))
    stmt = json.load(fp)

    msg=twitterOrName(stmt['person']) + ': ' + stmt['claims'][0]['title']
    if (len(msg) + 25) > 140:
        msg = 'New statement by ' + twitterOrName(stmt['person']) + ' on ' + stmt['date']
        if 'where' in stmt:
            lenWithWhere = len(msg) + len(stmt['where']) + 28
            if lenWithWhere <= 140:
                msg += ' (' + stmt['where'] + ')'

    msg += ': https://www.factopolis.com/' + re.sub('^content/(.+)(_index)?\.md$', '\\1', filename)
    tweet(msg)

stmtRegex = re.compile("^content/person/[^/]+/[^/]+\.md$")
stream = os.popen("git diff --name-only --diff-filter=A {}".format(os.environ["TRAVIS_COMMIT_RANGE"]))
while True:
    filename = stream.readline().strip()
    if not filename:
        print("Done tweeting.")
        break
    if stmtRegex.match(filename):
        handleStatement(filename)

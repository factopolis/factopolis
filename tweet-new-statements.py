#!/usr/bin/python3

import os, re, json, twitter, datetime

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

    print(msg)

def twitterHandle(person):
    fp = open("web/person/{}/index.json".format(person))
    data = json.load(fp)
    if 'twitter' in data:
        return '@' + data['twitter']
    else:
        None

def handleStatement(filename):
    fp = open(re.sub('^content/person/(.+)\.md$', 'web/person/\\1/index.json', filename))
    stmt = json.load(fp)

    msg = ""

    m = re.match('^content/person/(([^/]+)/([0-9]{4})\-([0-9]{2})\-([0-9]{2}))(\-.+)?.md$', filename)
    when = datetime.datetime(year=int(m.group(3), 10), month=int(m.group(4),10), day=int(m.group(5), 10))
    archive = (when + datetime.timedelta(14)) < datetime.datetime.today()

    handle = twitterHandle(stmt['person'])

    if archive:
        msg = 'Archive: '
        if handle:
            msg += handle
        else:
            msg += stmt['name']
        msg += " said "
    else:
        msg = stmt['name']
        if handle:
            msg += ' (' + handle + ')'
        msg += " says "

    msg += stmt['claims'][0]['title']
    if (len(msg) + 25) > 140:
        if archive:
            msg = 'Old statement by '
        else:
            msg = 'New statement by '

        if handle:
            msg += handle
        else:
            msg += stmt['name']

        msg += ' on ' + stmt['date']
        if 'where' in stmt:
            lenWithWhere = len(msg) + len(stmt['where']) + 28
            if lenWithWhere <= 140:
                msg += ' (' + stmt['where'] + ')'

        msg += ' added'

    msg += ': https://www.factopolis.com/' + re.sub('^content/(.+)(_index)?\.md$', '\\1', filename)
    tweet(msg)

stmtRegex = re.compile("^content/person/[^/]+/[^/]+\.md$")
commit_range = "HEAD"
if "TRAVIS_COMMIT_RANGE" in os.environ:
    commit_range = os.environ["TRAVIS_COMMIT_RANGE"]

stream = os.popen("git diff --name-only --diff-filter=A {}".format(commit_range))
while True:
    filename = stream.readline().strip()
    if not filename:
        break
    if stmtRegex.match(filename):
        handleStatement(filename)

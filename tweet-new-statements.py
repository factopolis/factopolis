#!/usr/bin/python3

# Yes, this is in desparate need of refactoring. Functionality grew without proper planning.

import os, re, json, tweepy, datetime, pprint

def tweet(msg, in_reply_to):
    if ('TWITTER_CONSUMER_KEY' in os.environ
            and 'TWITTER_CONSUMER_SECRET' in os.environ
            and 'TWITTER_ACCESS_TOKEN_KEY' in os.environ
            and 'TWITTER_ACCESS_TOKEN_SECRET' in os.environ
            and "TRAVIS_BRANCH" in os.environ
            and os.environ["TRAVIS_BRANCH"] == "master"
            and "TRAVIS_PULL_REQUEST" in os.environ
            and os.environ["TRAVIS_PULL_REQUEST"] == "false"):
        auth = tweepy.OAuthHandler(os.environ['TWITTER_CONSUMER_KEY'], os.environ['TWITTER_CONSUMER_SECRET'])
        auth.set_access_token(os.environ['TWITTER_ACCESS_TOKEN_KEY'], os.environ['TWITTER_ACCESS_TOKEN_SECRET'])

        tApi = tweepy.API(auth)
        tApi.update_status(msg, in_reply_to)

    if in_reply_to:
        print("Re " + str(in_reply_to) + ": " + msg)
    else:
        print(msg)

def twitterHandle(person):
    fp = open("web/person/{}/index.json".format(person))
    data = json.load(fp)
    if 'twitter' in data:
        return data['twitter']
    else:
        None

def checkerTwitterHandle(checker):
    fp = open("web/checker/{}/index.json".format(checker))
    data = json.load(fp)
    if 'twitter' in data:
        return '@' + data['twitter']
    else:
        return None

statementsToHandle = {}

def handleStatement(stmt, onlyReply=False):
    msg = ""

    m = re.match('^/person/(([^/]+)/([0-9]{4})\-([0-9]{2})\-([0-9]{2}))(\-.+)?/$', stmt["id"])
    when = datetime.datetime(year=int(m.group(3), 10), month=int(m.group(4),10), day=int(m.group(5), 10))
    archive = (when + datetime.timedelta(14)) < datetime.datetime.today()

    handle = twitterHandle(stmt['person'])
    if handle and False:
        msg += ".@" + handle
    else:
        msg += stmt['name']

    msg += " wrongly "

    if archive:
        msg += "claimed "
    else:
        msg += "claims "

    msg += stmt['claims'][0]['title']
    if (len(msg) + 24) > 280:
        if archive:
            msg = 'Old incorrect statement by '
        else:
            msg = 'New incorrect statement by '

        if handle:
            msg += '@' + handle
        else:
            msg += stmt['name']

        msg += ' on ' + stmt['date']
        if 'where' in stmt:
            lenWithWhere = len(msg) + len(stmt['where']) + 28
            if lenWithWhere <= 280:
                msg += ' (' + stmt['where'] + ')'

        msg += ' added'

    checkerList = ''
    if "checks" in stmt:
        handles = []
        for check in stmt['checks']:
            checkerHandle = checkerTwitterHandle(check['checkerId'])
            if checkerHandle:
                handles.append(checkerHandle)
        clist = " checked by " + (", ".join(handles))

        if (len(msg) + len(clist) + 25) < 280:
            checkerList = clist

    url = 'https://www.factopolis.com' + stmt['id']
    msg += ' ' + url
    msg += checkerList

    if not onlyReply:
        tweet(msg, None)

    for source in stmt['sources']:
        if source['type'] == 'twitter':
            if 'id' in source:
                claim = stmt['claims'][0]
                msg = '@' + source['user'] + " No, " + claim['negativePlain'] + " "
                msg += 'https://www.factopolis.com/claims/' + claim['id'] + '/'
                tweet(msg, int(source['id']))

def parseStatement(person, stmtId):
    fp = open('web/person/' + person + '/' + stmtId + '/index.json')
    stmt = json.load(fp)
    claimId = stmt['claims'][0]['id']

    if not person in statementsToHandle:
        statementsToHandle[person] = {}

    if not claimId in statementsToHandle[person]:
        statementsToHandle[person][claimId] = []

    statementsToHandle[person][claimId].insert(0, stmt)

def handleStatements():
    for person in statementsToHandle:
        for claim in statementsToHandle[person]:
            isFirst = True
            for stmt in statementsToHandle[person][claim]:
                handleStatement(stmt, not isFirst)
                isFirst = False


stmtRegex = re.compile("^content/person/([^/]+)/(([0-9]{4})\-([0-9]{2})\-([0-9]{2})(\-.+)?).md$")
commit_range = "origin/master"
if "TRAVIS_COMMIT_RANGE" in os.environ:
    commit_range = os.environ["TRAVIS_COMMIT_RANGE"]

stream = os.popen("git diff --name-only --diff-filter=A {}".format(commit_range))
while True:
    filename = stream.readline().strip()
    if not filename:
        break
    else:
        match = stmtRegex.match(filename)
        if match:
            parseStatement(match.group(1), match.group(2))
            # handleStatement(filename)

handleStatements()


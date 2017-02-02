![Swift Version](https://img.shields.io/badge/Swift-3.0-orange.svg) ![Plaforms](https://img.shields.io/badge/Platforms-Linux-lightgrey.svg) ![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg)

##SlackBot: A swift slack bot easy to deploy using Docker

###Description

The goal of this project is to have a starting point for making a slack bot (https://api.slack.com/bot-users) written in swift, up and running in production under 10 minutes.

This bot is using: [SlackKit](https://github.com/pvzig/SlackKit.git) that use [Zewo](https://github.com/Zewo/Zewo).

###Pre requirements
You will need to [create a bot on your slack account](https://my.slack.com/services/new/bot). And get a slack API token.

###Usage
####On your computer
- clone this repository
- swift build
- .build/debug/SlackBot --token=YOUR_SLACK_API_TOKEN


####With Docker

docker build . -t SlackBot

docker run --rm -it -p 8080:8080 -e SLACK_TOKEN="your slack key" SlackBot

####With Heroku

- heroku create
- heroku container:push worker

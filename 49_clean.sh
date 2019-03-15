#!/bin/bash

kubectl -n knativetutorial delete ksvc event-greeter

kubectl -n knativetutorial delete cronjobsources event-greeter-cronjob-source

kubectl -n knativetutorial delete subscriptions event-greeter-subscriber

kubectl -n knativetutorial delete channels ch-event-greeter
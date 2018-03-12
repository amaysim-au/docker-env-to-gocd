#!/usr/bin/python3
import os, re

variables = open('.env.template', 'r').read()
whitelisted_vars = [
    "AWS_SECRET_ACCESS_KEY",
    "AWS_SESSION_TOKEN",
    "AWS_ACCESS_KEY_ID",
    "AWS_SECURITY_TOKEN",
    "AWS_PROFILE",
    "AWS_DEFAULT_REGION",
    "BUILD_VERSION"
]

for env in variables.split('\n'):
    env = env.split('=')[0]
    if env not in whitelisted_vars and env != '' and not re.match(r'^\s?#', env) and os.environ.get(env, None):
        print("""          <variable name="{key}">
            <value>{value}</value>
          </variable>""".format(key=env, value=os.environ[env]))

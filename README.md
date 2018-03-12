# docker-env-to-gocd 
Converts a .env/.env.template in to XML that can be pasted in to GoCD's configuration file.

## Usage
`docker run -it -v $(pwd):/srv/app:Z --env-file .env amaysim/env-to-gocd`

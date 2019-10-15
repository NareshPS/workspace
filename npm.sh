#Global NPM directory
mkdir -p ~/.npm-global/bin
npm config set prefix '~/.npm-global'

#Add it to system PATH
set -gx ~/.npm-global/bin PATH $PATH

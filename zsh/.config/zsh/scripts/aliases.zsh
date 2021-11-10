alias watch='watch '
alias le='exa -la --group-directories-first --color-scale --time-style long-iso'
alias myip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d" " -f2 | head -1'
alias extip='curl -s http://ipecho.net/plain && echo || echo "Huh! No Internet?"'
alias curltime='curl -w "@/Users/yagneshmistry/.bin/curl-template.txt"'
alias curlex='curl -w "@/Users/yagneshmistry/.bin/curlex-template.txt"'
alias reload='source ~/.zshrc'
alias serve='python -m SimpleHTTPServer 8000'
alias cleardnscache='sudo killall -HUP mDNSResponder'

if command -v fkst-cli &> /dev/null
then
	alias ssh='fkst-cli installCert; ssh '
fi

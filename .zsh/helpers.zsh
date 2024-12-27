################################################################################
# helpers
################################################################################
# When you really can't remember the name of a command
netstat () {lsof -nP -iTCP | grep LISTEN}

# UTC date time converters
udate () { gdate -u --date=@$(gdate +%s --date="$*") "+%Y-%m-%d %H:%M:%S" }
us3date () { gdate -u --date=@$(gdate +%s --date="$*") "+%Y-%m-%d:%H:%M:%S" }

# Switch a proxy on and off
alias proxyon="export https_proxy=https://localhost:8080"
alias proxystatus="env | grep https_proxy"
alias proxyoff="unset https_proxy"
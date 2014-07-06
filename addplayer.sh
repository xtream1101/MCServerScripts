
server=$1
player=$2


screen -s mcs_$server -X stuff "whitelist add $player $(printf '\r')"

screen -s mcs_$server -X stuff "whitelist reload $(printf '\r')"

screen -s mcs_$server -X stuff "say Player $player has been added to the whitelist $(printf '\r')"

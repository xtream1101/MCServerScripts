
server=$1
backupPath="backups/$server/"
serverPath="servers/"

screen -S mcs_$server -X stuff "say Backup starting. World no longer saving!... $(printf '\r')"
screen -S mcs_$server -X stuff "save-off $(printf '\r')"
screen -S mcs_$server -X stuff "save-all $(printf '\r')"

now=$(date +"%Y-%m-%d_%H.%M.%S")

cd ~
if [ ! -d "$backupPath" ]; then
  mkdir -p $backupPath
fi

cd "$serverPath"
tar -cpvzf ~/$backupPath/$server-$now.tar.gz $server

screen -S mcs_$server -X stuff "save-on $(printf '\r')"
screen -S mcs_$server -X stuff "say Backup complete! World now saving. $(printf '\r')"



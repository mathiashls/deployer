if [ $# -eq 0 ]
  then
    echo "Pass the last numbers of the server's host!"
    exit
fi
SERVER=$1
cd ~/byne/code/paleale-server

branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
read -p "Your SERVER branch is $branch! Send it to 172.16.16.$SERVER? (y/N)" -s -n1 key
if [ "$key" == "Y" ] || [ "$key" == "y" ] ; then
    ./tests/test_util/restart_remote.sh 172.16.16.$SERVER
fi

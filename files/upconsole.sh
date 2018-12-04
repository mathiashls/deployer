if [ $# -eq 0 ]
  then
    echo "Pass the last numbers of the console's host!"
    exit
fi
CONSOLE=$1
cd /Users/mathias/byne/code/sour

branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
echo "WARNING: This will completely destroy files inside the console!"
read -p "Your branch is $branch. Send it to 172.16.16.$CONSOLE? (y/N)" -s -n1 key
if [ "$key" == "Y" ] || [ "$key" == "y" ] ; then
    ssh root@172.16.16.$CONSOLE 'rm -rf /opt/console/simb/pale_ale/console'
    scp -r /Users/mathias/byne/code/sour/simb/pale_ale/console root@172.16.16.$CONSOLE:/opt/console/simb/pale_ale/
    ssh root@172.16.16.$CONSOLE 'service console stop'
    ssh root@172.16.16.$CONSOLE 'service console-sip restart'
fi

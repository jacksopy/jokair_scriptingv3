                                                                                                           

                                                                                                                                                                                                                 
echo "+----------+------------+--------------------------+------------+---------------+----------------------------+"
echo "/                                                     connection                                             /"
echo "+----------+------------+----------+------------+-------------+---------+------+----------+-----------------+"
echo "/   ssh    /   telnet   /   mysql  /    mssql   /     smb     /   ftp   /"                                   
echo "+----------+------------+----------+------------+-------------+---------+-------+----------+-----------------+"
echo "/    1     /     2      /    3     /       4    /      5      /    6    /"
echo "+----------+------------+----------+------------+-------------+---------+------+----------+-----------------+"
echo "choose a tool                 osint  100        TOOLS2         TOOLS1 97        99 leave"
read tool_choice2
if [ tool_choice2 = 1 ]; then
    clear
    echo "ssh connection"
    echo "met l'username"
    read username
    echo "met l'ip"
    read ip
    echo "choisir co avec id_rsa ou pas 1=y 2=no 3=port personalisé"
    read choice
    if [ $choice= 2 ]; then
        ssh $username@$ip
    elif [ $choice = 1 ]; then
        echo "path vers le file id_rsa"
        read path
        ssh -i $path $username@$ip
    elif
        
    else
        ./2.
        fi
elif [ tool_choice2 = 6 ]; then
    echo "ftp"
    echo "met l'ip"
    read ip 
    echo "met le port"
    read port
    ftp $ip $port
elif [ tool_choice2 = 2 ]; then
    echo "telnet"
    echo "met l'ip"
    read ip 
    echo "met le port"
    read port
    telnet $IP $port
elif [ tool_choice2 = 3 ]; then
    echo "met l'ip"
    read ip
    echo "met le port"
    read port
    echo "username"
    read username
    echo "password"
    read password
    mysql -h $ip -P $port -u $username -p $password
elif [ tool_choice2 = 4 ]; then
    echo "mssql"
    echo "met l'ip"
    read ip
    echo "met le username"
    read username
    echo "met le password"
    read password
    python3 mssqlclient.py $pseudo:$mdp@$IP -windows-auth
elif [ tool_choice2 = 5 ]; then
    echo "smb"
    echo "5.1 enumeration of share in anonymous"
    echo "5.2 connection of a groupe with a username" 
    echo "choisis"
    read choice
    if [ $choice = 5.1 ]; then
        smbclient -N \\$ip\\$share\
    
    elif [ $choice = 5.2 ]; then
        echo "met le groupe"
        read group
        echo "met le username"
        read username
        echo "ip"
        read ip
        smbclient -U $username //$STMIP/$group
    else
        clear
        ./connection.sh
    
elif [ $tool_choice2 = 97 ]; then
    clear
    ./jokair_scripting.sh
elif [ $tool_choice2 = 98 ]; then
    clear
    ./2.sh
elif  [ $tool_choice2 = 100 ]; then
    clear
    ./osint.sh

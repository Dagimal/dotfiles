function icon
    set filePath "/home/dagimal/.ssh/icon.csv"
    set title (awk -F',' '{print $1, "("$2"@"$3")"}' $filePath | fzf)
    set name (string split ' ' $title)[1]
    # Variable Check
    if test -n "$name"
        set user (grep "^$name," $filePath | awk -F',' '{print $2}')
        set host (grep "^$name," $filePath | awk -F',' '{print $3}')
        set pass (grep "^$name," $filePath | awk -F',' '{print $4}')
        
        echo "SSH session started, connecting to host: $host, user: $user", name: $name
	/usr/bin/sshpass -p $pass ssh $user@$host
    else
        echo "No host selected."
    end
end

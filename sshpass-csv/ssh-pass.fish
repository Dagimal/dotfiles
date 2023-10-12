function icon
    set filePath "/home/dagimal/.ssh/icon.csv"
    set title (awk -F',' '!/^$|^#/ {print $1, "("$2"@"$3")"}' $filePath | fzf)
    
    if test -n "$title"
        set name (string split ' ' $title)[1]
        set user (grep "^$name," $filePath | awk -F',' '{print $2}')
        set host (grep "^$name," $filePath | awk -F',' '{print $3}')
        set pass (grep "^$name," $filePath | awk -F',' '{print $4}')
        set port (grep "^$name," $filePath | awk -F',' '{print $5}')

        # Check if $port is empty and set it to 22 if it is
        if test -z "$port"
            set port 22
        end
        
        echo "SSH session started, connecting to host: $host, user: $user, name: $name, port: $port"
        /usr/bin/sshpass -p $pass ssh $user@$host -p $port
    else
        echo "No host selected."
    end
end

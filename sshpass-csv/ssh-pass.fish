function icon
    set filePath "/home/dagimal/.ssh/icon.csv"
    set getCSV (awk -F',' '!/^$|^#/ {print $1","$2","$3","$4","$5}' $filePath | fzf)
    set title (echo $getCSV | awk -F',' '{printf "%s (%s@%s)\n", $1, $2, $3}')
    
    if test -n "$title"
        set name (echo $getCSV | awk -F',' '{print $1}')
        set user (echo $getCSV | awk -F',' '{print $2}')
        set host (echo $getCSV | awk -F',' '{print $3}')
        set pass (echo $getCSV | awk -F',' '{print $4}')
        set port (echo $getCSV | awk -F',' '{print $5}')

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

function icons
    set filePath "/home/dagimal/.ssh/icon.csv"
    set getCSV (awk -F',' '!/^$|^#/ {print $1","$2","$3","$4","$5}' $filePath | fzf)
    set title (echo $getCSV | awk -F',' '{printf "%s (%s@%s)\n", $1, $2, $3}')
    
    if test -n "$title"
        set name (echo $getCSV | awk -F',' '{print $1}')
        set user (echo $getCSV | awk -F',' '{print $2}')
        set host (echo $getCSV | awk -F',' '{print $3}')
        set pass (echo $getCSV | awk -F',' '{print $4}')
        set port (echo $getCSV | awk -F',' '{print $5}')

        # Check if $port is empty and set it to 22 if it is
        if test -z "$port"
            set port 22
        end
        
        echo "SSH session started, connecting to host: $host, user: $user, name: $name, port: $port"
        /usr/bin/sshpass -p $pass sftp -P $port $user@$host
    else
        echo "No host selected."
    end
end

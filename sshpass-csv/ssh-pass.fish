function icon
    set filePath "/home/dagimal/.ssh/icon.csv"
    set getCSV (awk -F',' '!/^$|^#/ {print $1","$2","$3","$4","$5","$1" ("$2"@"$3")"}' $filePath | fzf --with-nth 6 --delimiter ,)
    # set title (echo $getCSV | awk -F',' '{printf "%s (%s@%s)\n", $1, $2, $3}')
    
    if test -n "$getCSV"
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
    set getCSV (awk -F',' '!/^$|^#/ {print $1","$2","$3","$4","$5","$1" ("$2"@"$3")"}' $filePath | fzf --with-nth 6 --delimiter ,)
    # set title (echo $getCSV | awk -F',' '{printf "%s (%s@%s)\n", $1, $2, $3}')
    
    if test -n "$getCSV"
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

# Function Untuk Copy Password
function copy_pass
    set filePath "/home/dagimal/.ssh/icon.csv"
    set getCSV (awk -F',' '!/^$|^#/ {print $1","$2","$3","$4","$5","$1" ("$2"@"$3")"}' $filePath | fzf -e --with-nth 6 --delimiter ,)
    
    if test -n "$getCSV"
        set pass (echo $getCSV | awk -F',' '{print $4}')
        
        if test -n "$pass"
            #echo $pass | xclip -selection clipboard  # or use xsel --clipboard if preferred
            printf "%s" $pass | xclip -selection clipboard
            echo "Password copied to clipboard."
        else
            echo "Password is empty."
        end
    else
        echo "No host selected."
    end
end

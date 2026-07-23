#   _         _           _ 
# _| |___ ___|_|_____ ___| |
#| . | .'| . | |     | .'| |
#|___|__,|_  |_|_|_|_|__,|_|
#        |___| 2024 ~             
# https://github.com/Dagimal/fuzzy-credential

# SSH Function
# |- function for ssh, change [ssf] with the command you like
function ssf
    # Change the path below to the CSV file path used
    # we recommend using absolute paths !
    # |- Use the CSV file template provided
    # v
    set filePath "/home/dagimal/.pass"
    set getCSV (awk -F',' '!/^$|^#/ {print $1","$2","$3","$4","$5","$1" ("$2"@"$3")"}' $filePath | fzf -e --with-nth 6 --delimiter ,)
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

# SFTP Function
# |- function for sftp, change [sff] with the command you like
function sff
    # Change the path below to the CSV file path used
    # |
    # v
    set filePath "/home/dagimal/.pass"
    set getCSV (awk -F',' '!/^$|^#/ {print $1","$2","$3","$4","$5","$1" ("$2"@"$3")"}' $filePath | fzf -e --with-nth 6 --delimiter ,)
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

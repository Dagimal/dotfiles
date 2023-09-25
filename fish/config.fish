if status is-interactive
    # Commands to run in interactive sessions can go here
end

function ssf
	set host $(grep -e "^Host " ~/.ssh/config | awk '{print $2}' | fzf)
	echo "SSH session started, connecting to" $host
	ssh $host
end

alias ssh-config="nano /home/dagimal/.ssh/config"

#export GIT_SSH_COMMAND="ssh -oPort=23"
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

zoxide init fish | source


function fish_should_add_to_history
    for cmd in aichat acc acs
        string match -qr "^$cmd(\s|\$)" -- $argv; and return 1
    end
    return 0
end
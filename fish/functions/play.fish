function play --description 'Cari dan putar lagu dari YouTube'
    set id (yt-dlp "ytsearch10:$argv" --get-title --get-id --flat-playlist | sed 'N;s/\n/ /' | fzf | awk '{print $NF}')
    if test -n "$id"
        mpv --no-video "https://www.youtube.com/watch?v=$id"
    end
end

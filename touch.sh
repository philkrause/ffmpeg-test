yt-dlp -o '%(title)s.%(ext)s' -f best $1 --continue --restrict-filenames --no-cache-dir --socket-timeout 10 --retries infinite


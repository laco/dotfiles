function l-weather -d 'Display weather information'
    curl 'http://wttr.in/Besnyő' -H 'Accept-Language: hu-HU'
end

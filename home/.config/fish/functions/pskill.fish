function pskill --description 'Kill processes from piped psgrep output'
    awk '{print $2}' | sort -d | xargs -n1 kill -9
end

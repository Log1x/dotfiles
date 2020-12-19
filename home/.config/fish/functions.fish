# Print each PATH entry on a separate line
function path
    for val in $PATH
        echo "- $val"
    end
end

# Flush DNS
function flushdns
    echo '✅  Flushing Cache'
    command sudo dscacheutil -flushcache

    echo '✅  Killing DNS Services'
    command sudo killall -HUP mDNSResponder; and sudo killall mDNSResponderHelper
end

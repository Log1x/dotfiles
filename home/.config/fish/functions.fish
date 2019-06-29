# Print each PATH entry on a separate line
function path
    for val in $PATH
        echo "- $val"
    end
end

# Get IPs
function ips
    echo 'Public IP:' (dig +short myip.opendns.com @resolver1.opendns.com)
    echo 'Local IP' (ipconfig getifaddr en0)
end

# Flush DNS
function flushdns 
    command sudo dscacheutil -flushcache; and sudo killall -HUP mDNSResponder; and sudo killall mDNSResponderHelper
end

# Upgrade System
function update
    command sudo softwareupdate -i -a
    command brew update
    command brew upgrade 
    command cask upgrade
    command brew cleanup 
    command cask cleanup
end
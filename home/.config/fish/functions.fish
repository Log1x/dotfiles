# Print each PATH entry on a separate line
function path
    for val in $PATH
        echo "- $val"
    end
end

# Get IPs
function ips
    echo '🌎  Public IP:' (dig +short myip.opendns.com @resolver1.opendns.com)
    echo '🏠  Local IP:' (ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
end

# Flush DNS
function flushdns
    echo ✅  Flushing Cache
    command sudo dscacheutil -flushcache

    echo ✅  Restarting DNS Services
    command sudo killall -HUP mDNSResponder; and sudo killall mDNSResponderHelper
end

# Upgrade System
function update
    echo ✅  Upgrading System Apps...
    command sudo softwareupdate -i -a

    echo ✅  Updating Brew Taps
    command brew update

    echo ✅  Upgrading Brew Apps
    command brew upgrade

    echo ✅  Upgrading Cask Apps
    command brew cask upgrade

    echo ✅  Running Cleanup
    command brew cleanup
end

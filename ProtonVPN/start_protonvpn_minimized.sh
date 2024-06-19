#!/bin/bash
# Script was designed for automatically hiding ProtonVPN after it connects
# Start ProtonVPN
protonvpn-app &
# Function to check VPN connection status
check_vpn_connection() {
    nmcli -t -f TYPE connection show --active | grep "vpn"
    return $?
}
# Loop to wait until VPN connection is established
while :; do
    if check_vpn_connection; then
        # VPN is connected, find and hide ProtonVPN window
        sleep 5  # Add a small delay to ensure VPN connection stability
        WINDOW_ID=$(xdotool search --name "Proton VPN")
        if [ -n "$WINDOW_ID" ]; then
            # Hide the window and exit
            xdotool windowunmap "$WINDOW_ID"
            exit 0
        fi
    fi
    sleep 2
done

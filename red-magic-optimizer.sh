#!/bin/bash
# =================================================================
# Nubia Red Magic Pro Performance Optimizer
# Developer: WILLY JR. CARNASA GAILO
# Compatible with: Termux, Brevent, and Qute
# =================================================================

# Check if running in supported terminal
TERMINAL="$(ps -o comm= -p "$PPID")"
if [[ ! "$TERMINAL" =~ (termux|brevent|qute) ]]; then
    echo "This script must be run in Termux, Brevent, or Qute!"
    exit 1
fi

# Display ASCII skull animation
display_skull() {
    clear
    echo -e "\e[31m"
    echo "      .     .       .  .   . .   .   . .    +  ."
    sleep 0.1
    clear
    echo -e "\e[31m"
    echo "      .     .       .  .   . .   .   . .    +  ."
    echo "    .       .  :     .    .. :. .___---------___."
    sleep 0.1
    clear
    echo -e "\e[31m"
    echo "      .     .       .  .   . .   .   . .    +  ."
    echo "    .       .  :     .    .. :. .___---------___."
    echo "         .  .   .    .  :.:. _\".^ .^ ^.  '.. :\"-_. ."
    sleep 0.1
    clear
    echo -e "\e[31m"
    echo "      .     .       .  .   . .   .   . .    +  ."
    echo "    .       .  :     .    .. :. .___---------___."
    echo "         .  .   .    .  :.:. _\".^ .^ ^.  '.. :\"-_. ."
    echo "    .    .       .  .  .:../:            . .^  :.:\\."
    sleep 0.1
    clear
    echo -e "\e[31m"
    echo "      .     .       .  .   . .   .   . .    +  ."
    echo "    .       .  :     .    .. :. .___---------___."
    echo "         .  .   .    .  :.:. _\".^ .^ ^.  '.. :\"-_. ."
    echo "    .    .       .  .  .:../:            . .^  :.:\\."
    echo "        .   . ..:..  .    .:::           .  :       \\."
    sleep 0.1
    clear
    echo -e "\e[31m"
    echo "      .     .       .  .   . .   .   . .    +  ."
    echo "    .       .  :     .    .. :. .___---------___."
    echo "         .  .   .    .  :.:. _\".^ .^ ^.  '.. :\"-_. ."
    echo "    .    .       .  .  .:../:            . .^  :.:\\."
    echo "        .   . ..:..  .    .:::           .  :       \\."
    echo "   .   .   .   :. .   .   .:.  .    .      . .:\\     '."
    sleep 0.1
    clear
    echo -e "\e[31m"
    echo "      .     .       .  .   . .   .   . .    +  ."
    echo "    .       .  :     .    .. :. .___---------___."
    echo "         .  .   .    .  :.:. _\".^ .^ ^.  '.. :\"-_. ."
    echo "    .    .       .  .  .:../:            . .^  :.:\\."
    echo "        .   . ..:..  .    .:::           .  :       \\."
    echo "   .   .   .   :. .   .   .:.  .    .      . .:\\     '."
    echo "  .   .   .  :   .   .      :. .   .       ..:. .'     ."
    sleep 0.1
    clear
    echo -e "\e[31m"
    echo "      .     .       .  .   . .   .   . .    +  ."
    echo "    .       .  :     .    .. :. .___---------___."
    echo "         .  .   .    .  :.:. _\".^ .^ ^.  '.. :\"-_. ."
    echo "    .    .       .  .  .:../:            . .^  :.:\\."
    echo "        .   . ..:..  .    .:::           .  :       \\."
    echo "   .   .   .   :. .   .   .:.  .    .      . .:\\     '."
    echo "  .   .   .  :   .   .      :. .   .       ..:. .'     ."
    echo " .  .   .   .   .   .    .. ::'   .::::'      .'      :"
    sleep 0.1
    clear
    echo -e "\e[31m"
    echo "      .     .       .  .   . .   .   . .    +  ."
    echo "    .       .  :     .    .. :. .___---------___."
    echo "         .  .   .    .  :.:. _\".^ .^ ^.  '.. :\"-_. ."
    echo "    .    .       .  .  .:../:            . .^  :.:\\."
    echo "        .   . ..:..  .    .:::           .  :       \\."
    echo "   .   .   .   :. .   .   .:.  .    .      . .:\\     '."
    echo "  .   .   .  :   .   .      :. .   .       ..:. .'     ."
    echo " .  .   .   .   .   .    .. ::'   .::::'      .'      :"
    echo "   .   .   .   .   .   .    .:' '::'        .::."
    sleep 0.1
    clear
    echo -e "\e[31m"
    echo "                    .^. .^."
    echo "                   :  '  :"
    echo "                   '.   .'"
    echo "        ▄████▄       `:`     ▄████▄"
    echo "       ███▄█▀               ▀█▄███"
    echo "      ▐████                   ████▌"
    echo "       █████▄               ▄█████"
    echo "       ▀████▀               ▀████▀"
    echo "        ▀▀▀                   ▀▀▀"
    echo -e "\e[91mNUBIA RED MAGIC PRO PERFORMANCE OPTIMIZER"
    echo -e "\e[94m-------------------------------------"
    echo -e "\e[94mDeveloper: WILLY JR. CARNASA GAILO"
    echo -e "\e[94m-------------------------------------\e[0m"
    sleep 2
}

# Variables
IS_ROOTED=false
DEVICE_MODEL=""
CPU_INFO=""
MEMORY_INFO=""
KERNEL_VERSION=""
ANDROID_VERSION=""
SCRIPT_PID=$$

# Check if device is rooted
check_root() {
    echo -e "\e[93mChecking root status...\e[0m"
    if [ -f /system/xbin/su ] || [ -f /system/bin/su ] || [ -f /sbin/su ] || [ -f /su/bin/su ]; then
        IS_ROOTED=true
        echo -e "\e[92mDevice is rooted\e[0m"
    else
        echo -e "\e[93mDevice is not rooted\e[0m"
    fi
    sleep 1
}

# Get device information
get_device_info() {
    echo -e "\e[93mGathering device information...\e[0m"
    DEVICE_MODEL=$(getprop ro.product.model)
    CPU_INFO=$(cat /proc/cpuinfo | grep "Hardware" | head -n 1 | cut -d ":" -f 2 | xargs)
    MEMORY_INFO=$(free -m | grep "Mem:" | awk '{print $2}')
    KERNEL_VERSION=$(uname -r)
    ANDROID_VERSION=$(getprop ro.build.version.release)
    sleep 1
}

# Display device information
display_device_info() {
    echo -e "\e[96m═════════════════════════════════"
    echo -e "📱 Device Model: $DEVICE_MODEL"
    echo -e "🧠 CPU: $CPU_INFO"
    echo -e "💾 RAM: $MEMORY_INFO MB"
    echo -e "🐧 Kernel: $KERNEL_VERSION"
    echo -e "🤖 Android: $ANDROID_VERSION"
    echo -e "🔒 Root Status: $(if $IS_ROOTED; then echo 'Yes'; else echo 'No'; fi)"
    echo -e "═════════════════════════════════\e[0m"
    sleep 2
}

# Send notification
send_notification() {
    am start -a android.intent.action.VIEW -d "notification://$1" > /dev/null 2>&1 || \
    termux-notification -t "Red Magic Optimizer" -c "$1" --icon speed > /dev/null 2>&1 || \
    echo -e "\e[92m$1\e[0m"
}

# Optimize system performance - Non-root methods
optimize_performance_nonroot() {
    echo -e "\e[93mOptimizing system performance (non-root)...\e[0m"
    
    # Clear background apps
    am kill-all > /dev/null 2>&1
    
    # Set CPU governor to performance if accessible
    if [ -w /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ]; then
        for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
            echo "performance" > $cpu 2>/dev/null
        done
    fi
    
    # Disable animations to improve performance
    settings put global window_animation_scale 0.0 > /dev/null 2>&1
    settings put global transition_animation_scale 0.0 > /dev/null 2>&1
    settings put global animator_duration_scale 0.0 > /dev/null 2>&1
    
    # Enable gaming mode if available (Nubia specific)
    pm enable com.nubia.gamebooster > /dev/null 2>&1
    am start -n com.nubia.gamebooster/.main.GameBoosterActivity > /dev/null 2>&1
    
    # Reduce memory pressure
    am set-inactive-state com.google.android.gms true > /dev/null 2>&1
    
    send_notification "Performance optimizations applied"
    echo -e "\e[92mNon-root performance optimizations applied\e[0m"
    sleep 1
}

# Root-only optimizations
optimize_performance_root() {
    if [ "$IS_ROOTED" = true ]; then
        echo -e "\e[93mApplying root-level optimizations...\e[0m"
        
        # Use root to apply more aggressive tweaks
        su -c "echo 0 > /proc/sys/vm/swappiness" 2>/dev/null
        su -c "echo 1 > /proc/sys/vm/compact_memory" 2>/dev/null
        su -c "echo 100 > /proc/sys/vm/vfs_cache_pressure" 2>/dev/null
        su -c "echo 10 > /proc/sys/vm/dirty_ratio" 2>/dev/null
        
        # Disable thermal throttling (use carefully)
        su -c "echo 0 > /sys/class/thermal/thermal_zone0/mode" 2>/dev/null
        
        # Set CPU governor to performance
        for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
            su -c "echo performance > $cpu" 2>/dev/null
        done
        
        # Set GPU governor to performance
        su -c "echo performance > /sys/class/kgsl/kgsl-3d0/devfreq/governor" 2>/dev/null
        
        # SafetyNet bypass attempt
        if [ -d "/data/adb/modules" ] && [ -d "/data/adb/magisk" ]; then
            echo -e "\e[93mConfiguring SafetyNet bypass...\e[0m"
            su -c "magisk --sqlite \"DELETE FROM hidelist WHERE package_name='com.google.android.gms'\"" 2>/dev/null
            su -c "magisk --sqlite \"INSERT INTO hidelist (package_name) VALUES ('com.google.android.gms')\"" 2>/dev/null
            su -c "magisk --sqlite \"DELETE FROM hidelist WHERE package_name='com.google.android.gsf'\"" 2>/dev/null
            su -c "magisk --sqlite \"INSERT INTO hidelist (package_name) VALUES ('com.google.android.gsf')\"" 2>/dev/null
            su -c "settings put global device_provisioned 1" 2>/dev/null
        fi
        
        send_notification "Root optimizations applied"
        echo -e "\e[92mRoot-level optimizations applied\e[0m"
    fi
    sleep 1
}

# Optimize gaming performance
optimize_gaming() {
    echo -e "\e[93mOptimizing gaming performance...\e[0m"
    
    # Close unnecessary background apps
    am kill-all > /dev/null 2>&1
    
    # Non-root tweaks
    settings put system pointer_speed 1 > /dev/null 2>&1
    
    # Nubia specific settings if available
    if [ -e "/system/bin/nubiaconfig" ]; then
        nubiaconfig set fan_mode high > /dev/null 2>&1
        nubiaconfig set touch_sample_rate high > /dev/null 2>&1
        nubiaconfig set game_mode on > /dev/null 2>&1
    fi
    
    # Apply root gaming tweaks if available
    if [ "$IS_ROOTED" = true ]; then
        # Disable thermal throttling temporarily
        su -c "echo 0 > /sys/class/thermal/thermal_zone0/mode" 2>/dev/null
        
        # Set touch polling rate to maximum if available
        su -c "echo 1 > /sys/class/touch/switch/set_touchscreen_active_mode" 2>/dev/null
        
        # Set GPU to max frequency if available
        if [ -f "/sys/class/kgsl/kgsl-3d0/max_gpuclk" ]; then
            MAX_GPU=$(cat /sys/class/kgsl/kgsl-3d0/max_gpuclk)
            su -c "echo $MAX_GPU > /sys/class/kgsl/kgsl-3d0/gpuclk" 2>/dev/null
        fi
    fi
    
    send_notification "Gaming optimizations applied"
    echo -e "\e[92mGaming optimizations applied\e[0m"
    sleep 1
}

# Monitor cleanup trap
clean_up() {
    echo -e "\e[93mScript terminated. Restoring normal device operation.\e[0m"
    exit 0
}

# Main execution function
main() {
    # Set trap for clean exit
    trap clean_up SIGINT SIGTERM
    
    # Show animation
    display_skull
    
    # Check root status
    check_root
    
    # Get and display device info
    get_device_info
    display_device_info
    
    # Apply optimizations
    optimize_performance_nonroot
    optimize_performance_root
    optimize_gaming
    
    # Final message
    echo -e "\e[92m✅ All optimizations applied successfully!\e[0m"
    echo -e "\e[93mScript will keep running in background until device restart\e[0m"
    echo -e "\e[93mPress Ctrl+C to terminate manually\e[0m"
    
    send_notification "Red Magic Pro Optimizer running - Performance boost active"
    
    # Keep script running
    while true; do
        sleep 60
        # Reapply some optimizations periodically
        am kill-all > /dev/null 2>&1
        if [ "$IS_ROOTED" = true ]; then
            for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
                su -c "echo performance > $cpu" 2>/dev/null
            done
        fi
    done
}

# Execute main function
main
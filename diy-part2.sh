#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.254.254/g' package/base-files/files/bin/config_generate

# Modify default  Password
sed -i 's/root::0:0:99999:7:::/root:$1$EQxGTyLQ$nYH8qlpXbvjV6DJeJ2nrp\/:18686:0:99999:7:::/g' package/base-files/files/etc/shadow

# Modify default Host name
sed -i 's/OpenWrt/MW4530R/g' package/base-files/files/bin/config_generate

# Modify Timezone
sed -i "s/timezone='UTC'/zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# Enable Wifi
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify default Wifi SSID
sed -i 's/OpenWrt/MW4530R/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Flash
sed -i 's/7d0000/fd0000/g' target/linux/ath79/dts/ar9344_tplink_tl-wdrxxxx.dtsi
sed -i 's/7f0000/ff0000/g' target/linux/ath79/dts/ar9344_tplink_tl-wdrxxxx.dtsi
sed -i 's/8mlzma/16mlzma/g' target/linux/ath79/image/generic-tp-link.mk

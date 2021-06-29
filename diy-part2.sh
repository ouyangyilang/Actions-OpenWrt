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

# openwrt-vlmcsd
git clone https://github.com/cokebar/openwrt-vlmcsd.git -b master package/feeds/packages/openwrt-vlmcsd
git clone https://github.com/cokebar/luci-app-vlmcsd.git -b master package/feeds/luci/luci-app-vlmcsd

#helloworld
git clone https://github.com/fw876/helloworld.git -b master package/feeds/helloworld
git clone https://github.com/kenzok8/openwrt-packages.git -b master package/feeds/helloworld/openwrt-package
mv package/feeds/helloworld/openwrt-package/lua-maxminddb microsocks redsocks2 ..
rm -r -f package/feeds/helloworld/openwrt-package
git clone https://github.com/kenzok8/small.git -b master package/feeds/helloworld/small
mv package/feeds/helloworld/small/dns2socks ipt2socks kcptun pdnsd-alt simple-obfs trojan ..
rm -r -f package/feeds/helloworld/small

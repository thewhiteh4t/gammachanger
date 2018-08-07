#!/usr/bin/env bash
#--------------------------------------------------------------------
# Author : thewhiteh4t
#
# Description : A simple shell script to change display gamma values
#
# Dependency : xrandr
#--------------------------------------------------------------------
echo
# fetch display name using xrandr query
opt=$(xrandr --query | grep -w connected | cut -d ' ' -f 1)
# fetch current gamma values using xrandr verbose
curr=$(xrandr --verbose | grep Gamma | awk '{print $2}')
echo "[+] Connected Displays   : "$opt
echo "[+] Current Gamma Values : "$curr
read -p "[+] Enter Display Name   : " disp
echo "[!] Enter New Values : "
read -p "[+] Red   : " red
read -p "[+] Green : " green
read -p "[+] Blue  : " blue
echo "[!] Applying New Gamma Values..."
xrandr --output $disp --gamma $red:$green:$blue
echo "[+] Done."

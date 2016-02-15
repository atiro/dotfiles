#!/bin/bash

# Stuff to make a PC as unobtrusive as possible

# Turn off NIC lights

ethtool -s eth0 wol d


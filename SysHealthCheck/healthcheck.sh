#!/bin/bash

echo "CPU Usage:"
top -b -n1 | grep "Cpu(s)"

echo "Memory Usage:"
free -h

echo "Disk Usage:"
df -h

echo "System health check completed."

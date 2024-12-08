#!/bin/bash

# 检查进程是否在运行
pgrep -x "http" > /dev/null

# 如果没有运行，则启动 vmess
if [ $? -ne 0 ]; then
    nohup ./vless/http -c ./vless/config.json >/dev/null 2>&1 &
fi

# 接收用户传入的参数（端口、字符串或json格式内容）
INPUT_PARAM=$1

# 检查进程是否在运行
pgrep -x "node" > /dev/null

if [ $? -ne 0 ]; then 
    nohup ./vless/tunnel.sh >/dev/null 2>&1 &
fi
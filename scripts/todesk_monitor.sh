#!/bin/bash

# 设置日志文件路径
LOG_FILE="/var/log/todesk/todesk_monitor.log"
# 要检查的进程名和服务名
PROCESS_NAME="ToDesk"
SERVICE_NAME="todeskd.service"

current_time=$(date "+%Y-%m-%d %H:%M:%S")

# 检查todeskd服务状态
service_status=$(systemctl is-active $SERVICE_NAME)
if [ "$service_status" != "active" ]; then
    echo "[$current_time] 警告: $SERVICE_NAME 服务未运行！状态: $service_status" >> "$LOG_FILE"
    # 尝试重启服务
    systemctl restart $SERVICE_NAME
fi

# 使用pgrep检查进程是否存在todesk gui(Linux系统)
# if ! pgrep -x "$PROCESS_NAME" > /dev/null; then
#     # 如果进程不存在，记录到日志文件
#     echo "[$current_time] 警告: $PROCESS_NAME 进程未运行！" >> "$LOG_FILE"
#     systemctl restart $SERVICE_NAME
# fi

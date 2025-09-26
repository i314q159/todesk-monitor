sudo apt update
sudo apt-get install libappindicator3-dev
# sudo apt-get install ./todesk-v4.7.2.0-amd64.deb

sudo cp ./scripts/todesk_monitor.sh /usr/local/bin/todesk_monitor.sh
sudo cp ./systemd/todesk-monitor.service /etc/systemd/system/todesk-monitor.service
sudo cp ./systemd/todesk-monitor.timer /etc/systemd/system/todesk-monitor.timer

sudo systemctl daemon-reload

# 开机自启和启动监视器
sudo systemctl enable todesk-monitor.service
sudo systemctl start todesk-monitor.service


# 开机自启和启动定时器
sudo systemctl enable todesk-monitor.timer
sudo systemctl start todesk-monitor.timer

# 检查状态
# sudo systemctl status todesk-monitor.service
# sudo systemctl status todesk-monitor.timer

# 查找定时器
sudo systemctl list-timers --all | grep todesk

# 关闭 todeskd 服务，等待一分钟后连接成功，并检查日志，此为配置成功
sudo systemctl stop todeskd.service
cat /var/log/todesk/todesk_monitor.log

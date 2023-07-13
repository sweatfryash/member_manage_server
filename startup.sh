#!/bin/bash

# 检查 libsqlite3-dev 是否已安装
if dpkg -s libsqlite3-dev >/dev/null 2>&1; then
  echo "libsqlite3-dev is already installed."
else
  echo "libsqlite3-dev is not installed. Installing..."
  sudo apt-get update
  sudo apt-get install -y libsqlite3-dev
  echo "libsqlite3-dev has been installed."
fi

program_name="bin/server.exe"
webPath="$1"

# 检查程序是否正在运行
if pgrep -f "$program_name" >/dev/null; then
  echo "正在停止 $program_name..."
  pkill -f "$program_name"
  sleep 1 # 可选：等待一段时间确保程序完全停止
  echo "$program_name 已停止."
fi

# 更新程序源码
git pull

# 重新编译和运行程序
dart pub get
dart compile exe bin/server.dart
bin/server.exe --webPath="$webPath"
  echo "$program_name 已启动."
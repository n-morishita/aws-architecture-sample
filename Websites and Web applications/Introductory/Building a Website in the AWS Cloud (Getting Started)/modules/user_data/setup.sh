#!/bin/bash
set -e

# Apache（httpd）をインストール
yum update -y
yum install -y httpd

# Apache の起動と自動起動設定
systemctl start httpd
systemctl enable httpd

# カスタムHTML（オプション）
echo "<h1>Apache is running on Amazon Linux 2!</h1>" > /var/www/html/index.html

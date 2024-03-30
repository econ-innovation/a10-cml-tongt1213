#!/bin/bash

# 检查命令行参数是否提供了收件人邮箱
if [ "$#" -ne 1 ]; then
    echo "使用方式: $0 收件人邮箱"
    exit 1
fi

# 收件人邮箱地址
recipient="$1"

# 邮件标题
subject="作业提交通知"

# 邮件正文
body="这是一封证明我完成了作业的邮件。亲爱的接收者，祝你一切顺利。\n\n诚挚的问候,\n佟彤"

# 构造邮件内容，包括标题、发件人、收件人及正文
email_content="Subject: $subject\nFrom: ttong@smail.nju.edu.cn\nTo: $recipient\n\n$body"

# 使用msmtp发送邮件
echo -e "$email_content" | msmtp -a default "$recipient"

# 确认邮件已发送
echo "邮件已成功发送至 $recipient。"


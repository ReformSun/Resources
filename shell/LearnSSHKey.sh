#!/usr/bin/env bash
# 生成秘钥
ssh-keygen -t rsa
# 把公钥复制到登陆此服务器的目录中并安装
172.31.35.61
172.31.35.58
172.31.35.57
10.4.247.17
ssh-copy-id -i ~/.ssh/id_rsa.pub root@172.31.35.57

vi /root/.ssh/authorized_keys


cat ~/.ssh/id_rsa_login.pub >> ~/.ssh/authorized_keys

mac 22 端口 进入----》系统偏好设置---》共享----》远程登录
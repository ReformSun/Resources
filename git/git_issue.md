## 问题1
### 问题现象

```
To https://gitlab.ctbiyi.com/Sunny/learnarithmetic.git
 ! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'https://gitlab.ctbiyi.com/Sunny/learnarithmetic.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.

```

### 问题分析

### 解决办法  

```
git pull origin master --allow-unrelated-histories //把远程仓库和本地同步，消除差异
git status

git add .

git commit -m "dd"

git push -u origin master

```
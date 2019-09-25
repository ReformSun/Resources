## 克隆远程仓库
git clone  + clone 地址
克隆指定分支
git clone -b  release-1.8  https://github.com/ReformSun/flink.git
git clone -b  branch-2.4  https://github.com/ReformSun/spark.git
## 如果想取消一些文件的track
   
   git rm -r/-f --cache .  
   或者删除指定文件  
   git rm -r/-f --cache “*.iml”   
   git add .  
   git commit -m "update gitignore"
## checkouty远程分支
   git ls-remote origin  
   git checkout -b branceName origin/branchName

   git fetch torvalds release-1.8.0

## 拉取指定分支
   git pull origin version2

## 推送指定分支
git push origin release-1.8

## 把一个分支的部分文件合并到另个分支
   先把被合并的分支提交
   切换到另一个分支 git checkout version2
   拉去主分支的LearnWeb文件 git checkout master LearnWeb
   在version2分支执行 git add . -> git commit -m "d" -> git push -u origin version2


## 回滚到指定的tag位置
   git branch
   git checkout master
   git tag
   git show 标签名 通过这个可以获取到标签的commitid
   git reset --hard commitid 通过commitid回退
   git log 查看所有版本提交信息
   git reflog 查看所有分支的所有操作记录
   git status
   git push origin master 提交远程仓库

## 回退部分文件
   git tag
   git show 标签名
   git checkout commitId 文件名   这里可以是文件名。或者目录名。或者使用通配符
   git commit -m ""
   git push origin master



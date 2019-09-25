## 基本使用
 
```
// 初始化本地仓库
git init  
git add .
git commit -m "first commit"
// 与远程仓库连接
git remote add flink-tpc-ds git@github.com:flink-tpc-ds/flink.git
// 提交本地变化到远程仓库的主分支
git push -u origin master
```


## 其他经常使用的操作
1. git status
2. git branch 查看分支  

```
ideaS@sunjihuadeMacBook-Pro  ~/Documents/GitHub/Resources   testdev ●  git branch
  master
* testdev
```




## 创建分支
1. 先切换到主分支  
git checkout master  
2. 创建分支并切换到分支  
	1. 一条命令直接创建和切换  
	git checkout -b panda  
	2. 先创建再切换  
	git branch dev  
	git checkout dev  
	
	```
	ideaS@sunjihuadeMacBook-Pro  ~/Documents/GitHub/Resources   master ●  git branch testdev
 ideaS@sunjihuadeMacBook-Pro  ~/Documents/GitHub/Resources   master ●  git checkout testdev
M	git/LearnGit.md
M	"git/git\347\232\204\344\275\277\347\224\250.md"
D	"git/\345\206\262\347\252\201\350\247\243\345\206\263.md"
Switched to branch 'testdev'
	```
3. 分支管理

- 将创建的分支推送到远程仓库  
git push origin testdev  
- 分支不提交到远程仓库，修改完文件把结果直接合并到主分支，直接删除本地分支  
修改文件  
git add .    
git commit -m "c"  
git checkout master 
合并分支   
git merge testdev1


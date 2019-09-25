## 正在工作分支工作突然间主分支代码有bug，在主分支建立修复bug的分支，但是工作分支的代码还不想提交没有开发完毕
 

### 流程1
当你直接切换到主分支时  

```
git checkout master
error: Your local changes to the following files would be overwritten by checkout:
	git/测试文件.md
Please commit your changes or stash them before you switch branches.
Aborting
```
会报错，让你把分支的工作内容进行提交 
 
```
✘ ideaS@sunjihuadeMacBook-Pro  ~/Documents/GitHub/Resources   testdev ●  git add .
 ideaS@sunjihuadeMacBook-Pro  ~/Documents/GitHub/Resources   testdev ✚  git checkout master
error: Your local changes to the following files would be overwritten by checkout:
	git/测试文件.md
Please commit your changes or stash them before you switch branches.
Aborting
```
依然会报错  
git commit -m "c"  
git checkout master  
正确切换到主分支，但是上面的操作流程不符合我的预期，我工作空间的内容还不想进行提交
### 流程2
保存工作区内容到堆栈中  

```
git stash
Saved working directory and index state WIP on testdev: 2860427 c
```
git checkout master  
切换到主分支成功  
bug处理完成  
返回到工作分支  
git checkout testdev  
发现工作目录中的文件不是切换前的内容，这时因为工作前的内容在堆栈中，需要执行出栈操作  
git stash pop  
继续之前的工作  


## 相关命令的学习
- git stash  
把工作区和暂存区的内容暂存到堆栈中
- git stash save  
把工作区和暂存区的内容暂存到堆栈中和上面相同可以添加注解  
```git stash save "ddd"```  
- git stash list  
查看当前stash中的内容 

```
stash@{1}: On testdev: ddd
stash@{0}: On testdev: ccc
(END)
```   
- git stash pop  
将当前stash中的内容弹出，并应用到当前分支对应的工作目录上。  
注：该命令将堆栈中最近保存的内容删除（栈是先进后出）  
在执行git stash list  

```
stash@{0}: On testdev: ddd
(END)
```
- git stash apply  
将当前stash中的内容应用到工作区。  
注：该命令将堆栈中最近保存的内容不删除  
执行git stash list 
 
```
stash@{0}: On testdev: ccc
stash@{1}: On testdev: ddd
(END)
```  
如果这个时候在执行git stash pop会报错  

```
error: Your local changes to the following files would be overwritten by merge:
	git/测试文件.md
Please commit your changes or stash them before you merge.
Aborting
```  
执行git add .  
git commit -m "dd"  
再执行git stash pop成功  
以上操作说明了，同样的一份工作区代码可以从堆栈中应用多次  
- git stash drop + 索引  
从堆栈中移除指定的stash  

```
stash@{0}: On testdev: ccc
stash@{1}: On testdev: ddd
(END)
```   
执行git stash drop 1  

```
stash@{0}: On testdev: ccc
(END)
```  
- git stash clear  
清除堆栈中的所有内容   
- git stash show  
查看堆栈中最新保存的stash和当前目录的差异。  
  git stash show stash@{1}  
  查看堆栈中指定的stash和当前目录的差异。  
  git stash show -p  
  查看堆栈中最新保存的stash和当前目录的差异详情信息 
   
  ```
  diff --git "a/git/\346\265\213\350\257\225\346\226\207\344\273\266.md" "b/git/\346\265\213\350\257\225\346\226\207\344\273\266.md"
index 3094dcf..2d290d9 100644
--- "a/git/\346\265\213\350\257\225\346\226\207\344\273\266.md"
+++ "b/git/\346\265\213\350\257\225\346\226\207\344\273\266.md"
@@ -8,4 +8,5 @@ ddlld
 deie
 开始工作
 dkkkdk
-kdkdkdkk
\ No newline at end of file
+kdkdkdkkd
+开始工作
\ No newline at end of file
(END)
  ```  
- git stash branch  
从最新的stash创建分支


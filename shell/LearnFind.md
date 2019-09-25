## find命令的使用
递归查找
   find . -name "*.iml" | xargs rm -rf
   find . -name "*.rtf" | xargs rm -rf
   find . -name  .classpath | xargs rm -rf
   查找当前目录中的.settings的目录
   find . -name .settings -type d
   查找当前目录中的.settings的文件
   find . -name .settings -type f

   find . -name .settings -type d | xargs rm -rf


   find . -name "*.zip" -type f | xargs -I a  /Users/apple/Documents/GitHub/LearnShell/src/test2.sh a a


   find . -name "*.zip" -type f | xargs -I a unzip  -q a  -d ~  -d a

   
   unzip  -q ./wildfly-8-1.0.jar.src.zip -d ./wildfly-8-1.0.jar.src.zip/

   
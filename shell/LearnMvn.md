## 打包多项目中一个项目

   mvn package -pl flink-libraries -amd -Dmaven.test.skip=true
   mvn clean package -pl flink-table  -Dmaven.test.skip=true
   mvn clean package -pl flink-table -Pproduct -Dmaven.test.skip=true
   mvn clean package -pl flink-table -amd -Dmaven.test.skip=true


   mvn clean compile install -U -Ptest -Dmaven.test.skip=true -pl flink-table

   mvn -DskipTests clean package -pl flink-table

   https://www.cnblogs.com/hiver/p/7850954.html
   在flink-master目录下执行
   mvn clean package -DskipTests -pl ./flink-runtime -am

   mvn clean package -DskipTests -pl ./flink-streaming-java -am


   
## maven依赖管理
### 指定本地仓库
### 在pom文件中指定仓库
当添加一个依赖包时，此依赖包在maven的官方仓库中不存在，maven下载不到，这种情况下通过两种方式解决  
1. 下载依赖jar包，通过命令，添加到本地仓库

```
mvn install:install-file -DgroupId=groupId   -DartifactId=artifactId -Dversion=version  -Dfile=下载的jar包地址 -Dpackaging=jar
```
2. 指定依赖jar包所在的私有仓库地址

```

	<repositories>
		<repository>
			<id>elasticsearch-releases</id>
			<url>https://artifacts.elastic.co/maven</url>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>false</enabled>
			</snapshots>
		</repository>
	</repositories>
```

### 添加依赖

```
	<dependency>
      <groupId>org.elasticsearch</groupId>
      <artifactId>elasticsearch</artifactId>
      <version>${elasticsearch.version}</version>
      <exclusions>
        <exclusion>
          <groupId>org.ow2.asm</groupId>
          <artifactId>*</artifactId>
        </exclusion>
      </exclusions>
    </dependency>
  </dependencies>
  
```

#### exclusions的作用
用maven管理库依赖，有个好处就是连同库的依赖的全部jar文件一起下载，免去手工添加的麻烦，但同时也带来了同一个jar会被下载了不同版本的问题，好在pom的配置里面允许用<exclusion>来排除一些不需要同时下载的依赖jar 。

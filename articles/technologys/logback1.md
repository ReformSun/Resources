# Java日志学习总结
## logback介绍
### logback架构图
![logback](https://raw.githubusercontent.com/ReformSun/Resources/master/pictures/logback.png)
### logback介绍
#### logback概括
Logback 是一个 Java 领域的日志框架。
Logback 主要由三个模块组成：

* Logback-core
* Logback-classic
* Logback-accecc

logback-core 是其它模块的基础设施，其它模块基于它构建，显然，logback-core 提供了一些关键的通用机制。

logback-classic 的地位和作用等同于 Log4J，它也被认为是 Log4J 的一个改进版，并且它实现了简单日志门面 SLF4J。

logback-access 主要作为一个与 Servlet 容器交互的模块，比如说 tomcat 或者 jetty，提供一些与 HTTP 访问相关的功能。

#### logback关键类
logback中有六个非常重要的类或者接口

* Logger
* TurboFilter
* Filter
* Appender
* Layout

Logger是位于Logback-classic包中我们前面说过Logback-classic包在整个Logback架构中相当于日志门面，所以Logger类在logback中相当于是门面的服务台
直接与顾客打交道，满足顾客的需求。

TurboFilter同样位于Logback-classic包中参与服务客户的环节之中，它在服务中所起到的作用为拦截不符合服务窗口规定的服务也可以说是总的接口
这个类用户可以自定义并设定过滤条件
TurboFilter类的实例是绑定到LoggingContext上的
代码实例：

    public class CustomTurboFilter extends TurboFilter{
        private final Marker markerToMatch = LogbackMarkers.FINE_MARKER;
            @Override
            public FilterReply decide(Marker marker, Logger logger, Level level, String format, Object[] params, Throwable t) {
                设置过滤条件可以自己实现
                slf4j通过Marker接口来判断判断条件
            }
    }
    
    
Filter是位于Logback-core包的核心抽象类，和门面服务没有任何关系，前面两个类都是门面框架Logback-classic对Logback-core的封装
Filter的实现类是绑定到Appender的实现类上的

Appender也是位于Logback-core的接口主要作用是决定日志的输出目的地，比如：控制台，日志文件，数据库
Appender的实现类是绑定到Logger上的

Layout也是位于Logback-core的接口类主要作用是决定了日志的输出格式
Layout的实现类是绑定到Appender的实现对象上的

#### logback性能
关于日志系统，人们讨论得最多的是性能问题，即使是小型的应用程序，也有可能输出大量的日志。打印日志中的不当处理，会引发各种性能问题，例如太多的日志记录请求可能使磁盘 IO 成为性能瓶颈，从而影响到应用程序的正常运行。在合适的时候记录日志、以更好的方式发起日志请求、以及合理设置日志级别方面，都有可能造成性能问题。

关于性能问题，以下几个方面需要了解

* 建议使用占位符的方式参数化记录日志
* logback 内部机制保证 logger 在记录日志时，不必每一次都去遍历它的父辈以获得关于日志级别、Appender 的信息
* 在 logback 中，将日志信息格式化，以及输出到目的地，是最损耗性能的操作  

####logback的输出格式
#####常见输出格式 

* relative打印从程序开始到现在的毫秒数
* thread当前程序所在的线程打印的线程名
* level输出等级
* logger表示loggerName
* msg代表日志信息

#####输出格式的常见书写格式

|Format|Left justify|Minimum width|Maximum width|Comment|  
|:------:|:---------|:---------:|:------------:|:--------------------|  
|%20logger|false|20|none|如果logger名字字符说少于20个左边就用空字符填充|
|%-20logger|true|20|none|如果logger名字字符少于20个右边用空字符填充|
|%.30logger|NA|none|30|如果logger名字字符大于30个就从名字开始位置截取30个字符|
|%20.30logger|false|20|30|如果logger名字字符数小于20个字符左边就用空字符填充，如果字符数大于20小于30logger名字不变，如果大于30个，从字符开始位置截取30个字符|  
|%-20.30logger|true|20|30|如果logger名字字符数小于20个字符右边就用空字符填充，如果字符数大于20小于30logger名字不变，如果大于30个，从字符开始位置截取30个字符|  
|%.-30logger|NA|none|30|当logger名字字符数大于30个时从字符的结束位置截取30个字符|  
想要看到所有的输出格式可以查看logback-classic包中的ch.qos.logback.classic.PatternLayout类里面包含了所用的官方定义输出格式 
 
#####自定义输出格式 
第一个自定义类
 
    class CustomPatternLogbackEncoder extends PatternLayoutEncoderBase<ILoggingEvent> {
    public CustomPatternLogbackEncoder(String pPattern) {
        setPattern(pPattern);
    }

    public void start() {
        PatternLayout patternLayout = new CustomPatternLogbackLayout(getPattern());
        patternLayout.setContext(this.context);
        patternLayout.start();
        this.layout = patternLayout;
        super.start();
    }
    }  
第二个自定义类

      class CustomPatternLogbackLayout extends PatternLayout {
    private static final String THREAD_ID_CHAR = "i";
    private static final String MARKER_LEVEL_ID = "ml";
    private static final String PROCESS_ID = "pid";

    public CustomPatternLogbackLayout(String pPattern) {
        defaultConverterMap.put("i", ThreadIdLogbackConverter.class.getName());

        setPattern(pPattern);
    }
    }
    
第三个自定义类

    public class ThreadIdLogbackConverter extends ClassicConverter {
    public String convert(ILoggingEvent event) {
        try {
            long theId = Thread.currentThread().getId();
            return Long.toString(theId);
        } catch (Exception e) {
        }
        return null;
    }
    }


[logback配置详情](https://www.jianshu.com/p/1ded57f6c4e3)  
[logback-Filter机制](https://blog.csdn.net/d8111/article/details/45249555)  
[logback的日志格式配置](https://www.cnblogs.com/chrischennx/p/6781574.html)


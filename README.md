# The Issue
src/main/resources contains the application.properties to hook up to a local PG Docker image. To run it, just use the start_pg.sh command.

Ideally the system should start up, execute the schema.sql to create the schema shouldinit (should init). Right now it fails with

```
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.0.2.RELEASE)

2018-05-09 12:03:10.804  INFO 18399 --- [           main] c.f.issue.SchemaIssueApplication         : Starting SchemaIssueApplication on jdavenpo-ubuntu with PID 18399 (/home/jdavenpo/Code/workspaces/felicity/schema-issue/target/classes started by jdavenpo in /home/jdavenpo/Code/workspaces/felicity/schema-issue)
2018-05-09 12:03:10.808  INFO 18399 --- [           main] c.f.issue.SchemaIssueApplication         : No active profile set, falling back to default profiles: default
2018-05-09 12:03:10.853  INFO 18399 --- [           main] s.c.a.AnnotationConfigApplicationContext : Refreshing org.springframework.context.annotation.AnnotationConfigApplicationContext@7bf3a5d8: startup date [Wed May 09 12:03:10 EDT 2018]; root of context hierarchy
2018-05-09 12:03:11.591  INFO 18399 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
2018-05-09 12:03:11.673  INFO 18399 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
2018-05-09 12:03:12.036  WARN 18399 --- [           main] s.c.a.AnnotationConfigApplicationContext : Exception encountered during context initialization - cancelling refresh attempt: org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'liquibase' defined in class path resource [org/springframework/boot/autoconfigure/liquibase/LiquibaseAutoConfiguration$LiquibaseConfiguration.class]: Invocation of init method failed; nested exception is liquibase.exception.LockException: liquibase.exception.DatabaseException: ERROR: schema "shouldinit" does not exist
  Position: 14 [Failed SQL: CREATE TABLE shouldinit.databasechangeloglock (ID INT NOT NULL, LOCKED BOOLEAN NOT NULL, LOCKGRANTED TIMESTAMP WITHOUT TIME ZONE, LOCKEDBY VARCHAR(255), CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID))]
2018-05-09 12:03:12.036  INFO 18399 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Shutdown initiated...
2018-05-09 12:03:12.039  INFO 18399 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Shutdown completed.
2018-05-09 12:03:12.040  INFO 18399 --- [           main] o.s.j.e.a.AnnotationMBeanExporter        : Unregistering JMX-exposed beans on shutdown
2018-05-09 12:03:12.047  INFO 18399 --- [           main] ConditionEvaluationReportLoggingListener : 

Error starting ApplicationContext. To display the conditions report re-run your application with 'debug' enabled.
2018-05-09 12:03:12.051 ERROR 18399 --- [           main] o.s.boot.SpringApplication               : Application run failed

org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'liquibase' defined in class path resource [org/springframework/boot/autoconfigure/liquibase/LiquibaseAutoConfiguration$LiquibaseConfiguration.class]: Invocation of init method failed; nested exception is liquibase.exception.LockException: liquibase.exception.DatabaseException: ERROR: schema "shouldinit" does not exist
  Position: 14 [Failed SQL: CREATE TABLE shouldinit.databasechangeloglock (ID INT NOT NULL, LOCKED BOOLEAN NOT NULL, LOCKGRANTED TIMESTAMP WITHOUT TIME ZONE, LOCKEDBY VARCHAR(255), CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID))]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1706) ~[spring-beans-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:579) ~[spring-beans-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:501) ~[spring-beans-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:317) ~[spring-beans-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:228) ~[spring-beans-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:315) ~[spring-beans-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:199) ~[spring-beans-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:760) ~[spring-beans-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:869) ~[spring-context-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:550) ~[spring-context-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:759) [spring-boot-2.0.2.RELEASE.jar:2.0.2.RELEASE]
	at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:395) [spring-boot-2.0.2.RELEASE.jar:2.0.2.RELEASE]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:327) [spring-boot-2.0.2.RELEASE.jar:2.0.2.RELEASE]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1255) [spring-boot-2.0.2.RELEASE.jar:2.0.2.RELEASE]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1243) [spring-boot-2.0.2.RELEASE.jar:2.0.2.RELEASE]
	at com.felicityportal.issue.SchemaIssueApplication.main(SchemaIssueApplication.java:10) [classes/:na]
Caused by: liquibase.exception.LockException: liquibase.exception.DatabaseException: ERROR: schema "shouldinit" does not exist
  Position: 14 [Failed SQL: CREATE TABLE shouldinit.databasechangeloglock (ID INT NOT NULL, LOCKED BOOLEAN NOT NULL, LOCKGRANTED TIMESTAMP WITHOUT TIME ZONE, LOCKEDBY VARCHAR(255), CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID))]
	at liquibase.lockservice.StandardLockService.acquireLock(StandardLockService.java:242) ~[liquibase-core-3.5.5.jar:na]
	at liquibase.lockservice.StandardLockService.waitForLock(StandardLockService.java:170) ~[liquibase-core-3.5.5.jar:na]
	at liquibase.Liquibase.update(Liquibase.java:196) ~[liquibase-core-3.5.5.jar:na]
	at liquibase.Liquibase.update(Liquibase.java:192) ~[liquibase-core-3.5.5.jar:na]
	at liquibase.integration.spring.SpringLiquibase.performUpdate(SpringLiquibase.java:431) ~[liquibase-core-3.5.5.jar:na]
	at liquibase.integration.spring.SpringLiquibase.afterPropertiesSet(SpringLiquibase.java:388) ~[liquibase-core-3.5.5.jar:na]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.invokeInitMethods(AbstractAutowireCapableBeanFactory.java:1765) ~[spring-beans-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1702) ~[spring-beans-5.0.6.RELEASE.jar:5.0.6.RELEASE]
	... 15 common frames omitted
Caused by: liquibase.exception.DatabaseException: ERROR: schema "shouldinit" does not exist
  Position: 14 [Failed SQL: CREATE TABLE shouldinit.databasechangeloglock (ID INT NOT NULL, LOCKED BOOLEAN NOT NULL, LOCKGRANTED TIMESTAMP WITHOUT TIME ZONE, LOCKEDBY VARCHAR(255), CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID))]
	at liquibase.executor.jvm.JdbcExecutor$ExecuteStatementCallback.doInStatement(JdbcExecutor.java:309) ~[liquibase-core-3.5.5.jar:na]
	at liquibase.executor.jvm.JdbcExecutor.execute(JdbcExecutor.java:55) ~[liquibase-core-3.5.5.jar:na]
	at liquibase.executor.jvm.JdbcExecutor.execute(JdbcExecutor.java:113) ~[liquibase-core-3.5.5.jar:na]
	at liquibase.executor.jvm.JdbcExecutor.execute(JdbcExecutor.java:103) ~[liquibase-core-3.5.5.jar:na]
	at liquibase.lockservice.StandardLockService.init(StandardLockService.java:94) ~[liquibase-core-3.5.5.jar:na]
	at liquibase.lockservice.StandardLockService.acquireLock(StandardLockService.java:206) ~[liquibase-core-3.5.5.jar:na]
	... 22 common frames omitted
Caused by: org.postgresql.util.PSQLException: ERROR: schema "shouldinit" does not exist
  Position: 14
	at org.postgresql.core.v3.QueryExecutorImpl.receiveErrorResponse(QueryExecutorImpl.java:2433) ~[postgresql-42.2.2.jar:42.2.2]
	at org.postgresql.core.v3.QueryExecutorImpl.processResults(QueryExecutorImpl.java:2178) ~[postgresql-42.2.2.jar:42.2.2]
	at org.postgresql.core.v3.QueryExecutorImpl.execute(QueryExecutorImpl.java:306) ~[postgresql-42.2.2.jar:42.2.2]
	at org.postgresql.jdbc.PgStatement.executeInternal(PgStatement.java:441) ~[postgresql-42.2.2.jar:42.2.2]
	at org.postgresql.jdbc.PgStatement.execute(PgStatement.java:365) ~[postgresql-42.2.2.jar:42.2.2]
	at org.postgresql.jdbc.PgStatement.executeWithFlags(PgStatement.java:307) ~[postgresql-42.2.2.jar:42.2.2]
	at org.postgresql.jdbc.PgStatement.executeCachedSql(PgStatement.java:293) ~[postgresql-42.2.2.jar:42.2.2]
	at org.postgresql.jdbc.PgStatement.executeWithFlags(PgStatement.java:270) ~[postgresql-42.2.2.jar:42.2.2]
	at org.postgresql.jdbc.PgStatement.execute(PgStatement.java:266) ~[postgresql-42.2.2.jar:42.2.2]
	at com.zaxxer.hikari.pool.ProxyStatement.execute(ProxyStatement.java:95) ~[HikariCP-2.7.9.jar:na]
	at com.zaxxer.hikari.pool.HikariProxyStatement.execute(HikariProxyStatement.java) ~[HikariCP-2.7.9.jar:na]
	at liquibase.executor.jvm.JdbcExecutor$ExecuteStatementCallback.doInStatement(JdbcExecutor.java:307) ~[liquibase-core-3.5.5.jar:na]
	... 27 common frames omitted

```
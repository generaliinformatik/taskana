package pro.taskana.rest;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.DependsOn;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.PlatformTransactionManager;

import pro.taskana.jobs.TransactionalJobsConfiguration;
import pro.taskana.ldap.LdapCacheTestImpl;
import pro.taskana.ldap.LdapClient;
import pro.taskana.ldap.LdapConfiguration;
import pro.taskana.sampledata.SampleDataGenerator;

/** Example Application showing the implementation of taskana-rest-spring. */
@SpringBootApplication
@EnableScheduling
@ComponentScan(basePackages = "pro.taskana")
@SuppressWarnings("checkstyle:Indentation")
@Import({
  TransactionalJobsConfiguration.class,
  LdapConfiguration.class,
  RestConfiguration.class,
  WebMvcConfig.class
})
public class ExampleRestApplication {

  @Value("${taskana.schemaName:TASKANA}")
  public String schemaName;

  @Value("${generateSampleData:true}")
  public boolean generateSampleData;

  @Autowired private SampleDataGenerator sampleDataGenerator;

  @Autowired private LdapClient ldapClient;

  @Autowired private LdapCacheTestImpl ldapCacheTest;

  public static void main(String[] args) {
    SpringApplication.run(ExampleRestApplication.class, args);
  }

  @Bean
  public PlatformTransactionManager txManager(DataSource dataSource) {
    return new DataSourceTransactionManager(dataSource);
  }

  @Bean
  @DependsOn("getTaskanaEngine") // generate sample data after schema was inserted
  public SampleDataGenerator generateSampleData(DataSource dataSource) {
    sampleDataGenerator = new SampleDataGenerator(dataSource, schemaName);
    return sampleDataGenerator;
  }

  @PostConstruct
  private void init() {
    if (!ldapClient.useLdap()) {
      AccessIdController.setLdapCache(ldapCacheTest);
    }
    if (generateSampleData) {
      sampleDataGenerator.generateSampleData();
    }
  }
}

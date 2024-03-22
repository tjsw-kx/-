package com.graduation.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.baomidou.mybatisplus.MybatisConfiguration;
import com.baomidou.mybatisplus.MybatisXMLLanguageDriver;
import com.baomidou.mybatisplus.entity.GlobalConfiguration;
import com.baomidou.mybatisplus.enums.DBType;
import com.baomidou.mybatisplus.mapper.LogicSqlInjector;
import com.baomidou.mybatisplus.plugins.OptimisticLockerInterceptor;
import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.plugins.PerformanceInterceptor;
import com.baomidou.mybatisplus.spring.MybatisSqlSessionFactoryBean;
import com.baomidou.mybatisplus.spring.boot.starter.SpringBootVFS;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.mapping.DatabaseIdProvider;
import org.apache.ibatis.plugin.Interceptor;
import org.mybatis.spring.boot.autoconfigure.MybatisProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.bind.RelaxedPropertyResolver;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.Environment;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.ResourceLoader;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import javax.sql.DataSource;
import java.sql.SQLException;

@Configuration
@EnableConfigurationProperties(MybatisProperties.class)
@Slf4j
public class MybatisPlusConfig {

    @Autowired
    private Environment environment;
    private RelaxedPropertyResolver propertyResolver;
    @Autowired
    private DataSource dataSource;
    @Autowired
    private MybatisProperties properties;
    @Autowired
    private ResourceLoader resourceLoader = new DefaultResourceLoader();
    @Autowired(required = false)
    private Interceptor[] interceptors;
    @Autowired(required = false)
    private DatabaseIdProvider databaseIdProvider;

    /**
     * @Description : mybatis-plus SQL执行效率插件【生产环境可以关闭】
     */
    @Bean
    @Profile("dev") //开发环境生效
    public PerformanceInterceptor performanceInterceptor() {
        log.info("mybatis plus sql 性能插件 注入");
        return new PerformanceInterceptor();
    }


    /**
     * 配置DataSource
     * @return
     * @throws SQLException
     */
    @Bean
    public DataSource druidDataSource() throws SQLException {
        this.propertyResolver = new RelaxedPropertyResolver(environment, "spring.datasource.");
        log.info("druid连接池注入");
        DruidDataSource datasource = new DruidDataSource();
        datasource.setUrl(propertyResolver.getProperty("url"));
        datasource.setDriverClassName(propertyResolver.getProperty("driver-class-name"));
        datasource.setUsername(propertyResolver.getProperty("username"));
        datasource.setPassword(propertyResolver.getProperty("password"));
        datasource.setInitialSize(Integer.valueOf(propertyResolver.getProperty("initial-size")));
        datasource.setMinIdle(Integer.valueOf(propertyResolver.getProperty("min-idle")));
        datasource.setMaxWait(Long.valueOf(propertyResolver.getProperty("max-wait")));
        datasource.setMaxActive(Integer.valueOf(propertyResolver.getProperty("max-active")));
        datasource.setMinEvictableIdleTimeMillis(Long.valueOf(propertyResolver.getProperty("min-evictable-idle-time-millis")));
        return datasource;
    }

    /**
     * @Description : mybatis-plus分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor page = new PaginationInterceptor();
        log.info("mybatis plus mysql 分页插件注入");
        page.setDialectType("mysql");
        return page;
    }


    @Value("${mybatis.configuration.id-type}")
    private Integer idType;//ID类型
    @Value("${mybatis.configuration.field-strategy}")
    private Integer  fieldStrategy;//字段策略
    @Value("${mybatis.configuration.map-underscore-to-camel-case}")
    private boolean  dbColumnUnderline;//字段策略
    @Value("${mybatis.configuration.refresh-mapper}")
    private boolean isRefresh; // 是否刷新mapper
    // 是否大写命名
    @Value("${mybatis.configuration.capital-mode}")
    private boolean isCapitalMode;


//    /**
//     * 注入主键生成器
//     */
//    @Bean
//    public IKeyGenerator keyGenerator(){
//        return new H2KeyGenerator();
//    }
//
//    /**
//     * 注入sql注入器
//     */
//    @Bean
//    public ISqlInjector sqlInjector(){
//        return new LogicSqlInjector();
//    }

    @Bean
     public OptimisticLockerInterceptor optimisticLockerInterceptor(){
         return  new OptimisticLockerInterceptor();
     }

    /**
     * 这里全部使用mybatis-autoconfigure 已经自动加载的资源。不手动指定
     * 配置文件和mybatis-boot的配置文件同步
     * @return
     */
    @Bean
    public MybatisSqlSessionFactoryBean mybatisSqlSessionFactoryBean() {
        MybatisSqlSessionFactoryBean mybatisPlus = new MybatisSqlSessionFactoryBean();
        mybatisPlus.setDataSource(dataSource);
        mybatisPlus.setVfs(SpringBootVFS.class);
        if (StringUtils.hasText(this.properties.getConfigLocation())) {
            mybatisPlus.setConfigLocation(this.resourceLoader.getResource(this.properties.getConfigLocation()));
        }
        if (!ObjectUtils.isEmpty(this.interceptors)) {
            mybatisPlus.setPlugins(this.interceptors);
        }

        // MP 全局配置，更多内容进入类看注释
        GlobalConfiguration globalConfig = new GlobalConfiguration(new LogicSqlInjector());
        globalConfig.setDbType(DBType.MYSQL.name());
        globalConfig.setIdType(idType);
        globalConfig.setCapitalMode(isCapitalMode);
        globalConfig.setDbColumnUnderline(dbColumnUnderline);
        globalConfig.setFieldStrategy(fieldStrategy);

        //逻辑删除
//        globalConfig.setLogicDeleteValue("1");//删除表示
//        globalConfig.setLogicNotDeleteValue("0");//未删除表示

        //自动注入公共字段
//        globalConfig.setMetaObjectHandler(new GiMiiiMetaObjectHandler());

        mybatisPlus.setGlobalConfig(globalConfig);

        org.apache.ibatis.session.Configuration configuration  = properties.getConfiguration();
        MybatisConfiguration mc = new MybatisConfiguration();
        mc.setDefaultScriptingLanguage(MybatisXMLLanguageDriver.class);
        mc.setSafeRowBoundsEnabled(configuration.isSafeRowBoundsEnabled());
        mc.setSafeResultHandlerEnabled(configuration.isSafeResultHandlerEnabled());
        mc.setMapUnderscoreToCamelCase(configuration.isMapUnderscoreToCamelCase());
        mc.setAggressiveLazyLoading(configuration.isAggressiveLazyLoading());
        mc.setMultipleResultSetsEnabled(configuration.isMultipleResultSetsEnabled());
        mc.setUseGeneratedKeys(configuration.isUseGeneratedKeys());
        mc.setUseColumnLabel(configuration.isUseColumnLabel());
        mc.setCacheEnabled(configuration.isCacheEnabled());
        mc.setCallSettersOnNulls(configuration.isCallSettersOnNulls());
        mc.setUseActualParamName(configuration.isUseActualParamName());
        mc.setReturnInstanceForEmptyRow(configuration.isReturnInstanceForEmptyRow());
        mybatisPlus.setConfiguration(mc);
        if (this.databaseIdProvider != null) {
            mybatisPlus.setDatabaseIdProvider(this.databaseIdProvider);
        }
        if (StringUtils.hasLength(this.properties.getTypeAliasesPackage())) {
            mybatisPlus.setTypeAliasesPackage(this.properties.getTypeAliasesPackage());
        }
        if (StringUtils.hasLength(this.properties.getTypeHandlersPackage())) {
            mybatisPlus.setTypeHandlersPackage(this.properties.getTypeHandlersPackage());
        }
        if (!ObjectUtils.isEmpty(this.properties.resolveMapperLocations())) {
            mybatisPlus.setMapperLocations(this.properties.resolveMapperLocations());
        }
        return mybatisPlus;
    }
}
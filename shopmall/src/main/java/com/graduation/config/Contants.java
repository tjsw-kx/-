package com.graduation.config;

import com.graduation.entity.UserEntity;
import com.graduation.model.CustomerEntity;

public class Contants {
    /**
     * 线程变量
     */
    public static final ThreadLocal<UserEntity> USER_ENTITY_THREAD_LOCAL = new ThreadLocal<>();

    public static final UserEntity get(){
        return USER_ENTITY_THREAD_LOCAL.get();
    }

    public static final ThreadLocal<CustomerEntity> CUSTOMER_ENTITY_THREAD_LOCAL = new ThreadLocal<>();

    public static final CustomerEntity getCustomer(){
        return CUSTOMER_ENTITY_THREAD_LOCAL.get();
    }
}

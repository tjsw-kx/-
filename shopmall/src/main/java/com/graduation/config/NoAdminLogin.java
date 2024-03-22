package com.graduation.config;

import java.lang.annotation.*;

@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(value = RetentionPolicy.RUNTIME)
@Documented
public @interface NoAdminLogin {
}

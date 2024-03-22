package com.graduation.config;

import com.baomidou.mybatisplus.toolkit.IdWorker;

public class IdWorkerUtil {

    public static final String getId(){
        return "aaa"+ IdWorker.getId();
    }
}

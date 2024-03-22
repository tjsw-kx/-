package com.graduation.controller.admin;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.graduation.config.IdWorkerUtil;
import com.graduation.config.Result;
import com.graduation.model.XinwenEntity;
import com.graduation.service.XinwenService;

/**
 * 商品管理
 */
@Controller
@RequestMapping("xinwen")
public class XinwenController {

    @Autowired
    private XinwenService service;

    @Autowired
    private XinwenService XinwenService;


    /**
     * 界面
     * @param model
     * @return
     */
    @RequestMapping("list.htm")
    public String list(Model model){
        List<XinwenEntity> list = service.selectList(new EntityWrapper<>());
        model.addAttribute("list",list);
        return "xinwen/list";
    }


    /**
     * 保存界面
     * @param model
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("save.htm")
    public String save(Model model,String id)throws Exception{
        XinwenEntity entity = new XinwenEntity();
        if(!StringUtils.isEmpty(id)){
            entity = service.selectById(id);
        }
        model.addAttribute("entity",entity);

        List<XinwenEntity> types =  XinwenService.selectList(new EntityWrapper<>());
        model.addAttribute("types",types);
        return "xinwen/save";
    }

    /**
     * 保存
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("saveData.htm")
    @ResponseBody
    public Result save(Model model, XinwenEntity entity)throws Exception{
    	entity.setTime(new Date());
        if(StringUtils.isEmpty(entity.getId())){
            entity.setId(IdWorkerUtil.getId());
            service.insert(entity);
        }else{
            service.updateById(entity);
        }
        return Result.success("保存成功");
    }

    /**
     * 删除
     * @param id
     * @return
     * @throws Exception
     */
    @PostMapping("del.htm")
    @ResponseBody
    public Result del(String id)throws Exception{
        service.deleteById(id);
        return Result.success("保存成功");
    }



}

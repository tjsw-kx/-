package com.graduation.controller.mobile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.graduation.config.Contants;
import com.graduation.config.IdWorkerUtil;
import com.graduation.config.Result;
import com.graduation.model.CustomerAddressEntity;
import com.graduation.model.CustomerEntity;
import com.graduation.service.CustomerAddressService;
import com.graduation.table.CustomerAddressTable;

@Controller
@RequestMapping("customerAddress")
public class CustomerAddressController {

    @Autowired
    private CustomerAddressService service;
    
    /**
     * 列表界面
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("list.do")
    public String list(Model model)throws Exception{
        CustomerEntity customerEntity = Contants.getCustomer();
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq(CustomerAddressTable.CUSTOMER_ID,customerEntity.getId());
        List<CustomerAddressEntity> list = service.selectList(wrapper);
        model.addAttribute("list",list);
        return "mobile/address_list";
    }
    

    /**
     * 保存界面
     * @param model
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("save.do")
    public String save(Model model,String id)throws Exception{
        CustomerAddressEntity entity = new CustomerAddressEntity();
        if(!StringUtils.isEmpty(id)){
            entity = service.selectById(id);
        }
        model.addAttribute("entity",entity);
        return "mobile/address_save";
    }

    /**
     * 保存
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("saveData.do")
    @ResponseBody
    public Result save(Model model, CustomerAddressEntity entity)throws Exception{
        CustomerEntity customerEntity = Contants.getCustomer();
        entity.setCustomerId(customerEntity.getId());
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
    @PostMapping("del.do")
    @ResponseBody
    public Result del(String id)throws Exception{
        service.deleteById(id);
        return Result.success("保存成功");
    }
}

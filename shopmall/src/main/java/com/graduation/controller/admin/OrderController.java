package com.graduation.controller.admin;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.graduation.config.NoAdminLogin;
import com.graduation.config.Result;
import com.graduation.model.OrderEntity;
import com.graduation.model.OrderShopEntity;
import com.graduation.service.OrderService;
import com.graduation.service.OrderShopService;
import com.graduation.service.ShopService;
import com.graduation.service.ShoppingGatService;
import com.graduation.table.OrderTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderShopService orderShopService;

    @Autowired
    private OrderService orderService;


    /**
     * 界面
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("page.htm")
    public String page(Model model)throws Exception{
        EntityWrapper entityWrapper = new EntityWrapper();
        entityWrapper.orderBy(OrderTable.TIME,false);
        List<OrderEntity> list = orderService.selectList(entityWrapper);
        if(list!=null){
            for (OrderEntity orderEntity : list) {
                entityWrapper = new EntityWrapper();
                entityWrapper.eq("order_id",orderEntity.getId());
                List<OrderShopEntity> shoppingGatEntities = orderShopService.selectList(entityWrapper);
                orderEntity.setOrderShops(shoppingGatEntities);
            }
        }
        model.addAttribute("list",list);
        return "order/list";
    }


    /**
     * 修改
     * @param orderEntity
     * @return
     * @throws Exception
     */
    @RequestMapping("update.htm")
    @ResponseBody
    @NoAdminLogin
    public Result update(OrderEntity orderEntity)throws Exception{
        orderService.updateById(orderEntity);
        return Result.success("1");
    }
    
    @NoAdminLogin
    @RequestMapping("wancheng.htm")
    @ResponseBody
    public Result wancheng(OrderShopEntity orderEntity)throws Exception{
    	OrderShopEntity orderEntity22 = orderShopService.selectById(orderEntity.getId());
    	orderEntity22.setStatus(orderEntity.getStatus());
    	orderShopService.updateById(orderEntity);
    	return Result.success("1");
    }
}

package com.graduation.controller.mobile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.toolkit.IdWorker;
import com.baomidou.mybatisplus.toolkit.StringUtils;
import com.graduation.config.Contants;
import com.graduation.config.IdWorkerUtil;
import com.graduation.config.Result;
import com.graduation.mapper.OrderShopDao;
import com.graduation.model.*;
import com.graduation.service.*;
import com.graduation.table.OrderTable;

import org.apache.http.client.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("order")
public class SpOrderController {
    @Autowired
    private ShoppingGatService shoppingGatService;

    @Autowired
    private ShopService shopService;

    @Autowired
    private OrderShopService orderShopService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CustomerAddressService customerAddressService;

    @Autowired
    private OrderShopDao orderShopDao;

    /**
     * 评价界面
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("comment.do")
    public String comment(String id,Model model)throws Exception{
        OrderShopEntity orderShopEntity = orderShopService.selectById(id);
        model.addAttribute("entity",orderShopEntity);
        return "mobile/comment";
    }
    
    @RequestMapping("tousu.do")
    public String tousu(String id,Model model)throws Exception{
    	OrderEntity orderShopEntity = orderService.selectById(id);
    	model.addAttribute("entity",orderShopEntity);
    	return "mobile/tousu";
    }


    @RequestMapping("commentData.do")
    @ResponseBody
    public Result commentData(OrderShopEntity orderShopEntity)throws Exception{
        orderShopService.updateById(orderShopEntity);
        orderShopEntity = orderShopService.selectById(orderShopEntity.getId());
        Double num = orderShopDao.num(orderShopEntity.getShopId());
        ShopEntity shopEntity = new ShopEntity();
        shopEntity.setId(orderShopEntity.getShopId());
        shopEntity.setScore(num);
        shopService.updateById(shopEntity);
        return Result.success(1);
    }
    
    @RequestMapping("tousuData.do")
    @ResponseBody
    public Result tousuData(OrderEntity orderEntity)throws Exception{
    	
    	OrderEntity orderEntity22 = orderService.selectById(orderEntity.getId());
    	orderEntity22.setTousu(orderEntity.getTousu());
    	orderEntity22.setTstime(DateUtils.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
    	orderService.updateById(orderEntity22);
    	
        return Result.success(1);
    }


    /**
     * 收货
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("shouhuo.do")
    @ResponseBody
    public Result shouhuo(String id)throws Exception{
        OrderEntity orderEntity = orderService.selectById(id);
        orderEntity.setStatus(3);
        orderService.updateById(orderEntity);
        
        EntityWrapper wrapper11 = new EntityWrapper();
		wrapper11.eq("order_id", id);
        List<OrderShopEntity> selectList = orderShopService.selectList(wrapper11);
        for (OrderShopEntity orderShopEntity : selectList) {
        	orderShopEntity.setStatus("2");
        	orderShopService.updateById(orderShopEntity);
		}
        
        return Result.success("欢迎下次光临");
    }
    @RequestMapping("thh.do")
    @ResponseBody
    public Result thh(String id)throws Exception{
    	OrderShopEntity orderEntity = orderShopService.selectById(id);
    	orderEntity.setStatus("3");
    	orderShopService.updateById(orderEntity);
    	return Result.success("欢迎下次光临");
    }
    @RequestMapping("wx.do")
    @ResponseBody
    public Result wx(String id)throws Exception{
    	OrderShopEntity orderEntity = orderShopService.selectById(id);
    	orderEntity.setStatus("4");
    	orderShopService.updateById(orderEntity);
    	return Result.success("欢迎下次光临");
    }
    
    /**
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("list.do")
    public String list(Model model) throws Exception{
        CustomerEntity userEntity = Contants.getCustomer();
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq(OrderTable.CUSTOMER_ID,userEntity.getId()).orderBy("time",false);
        List<OrderEntity> orders = orderService.selectList(wrapper);
        if(orders!=null){
            for (OrderEntity order : orders) {
                wrapper = new EntityWrapper();
                wrapper.eq("order_id",order.getId());
                List<OrderShopEntity> orderShops = orderShopService.selectList(wrapper);
                order.setOrderShops(orderShops);
            }
        }
        model.addAttribute("orders",orders);
        return "mobile/orderList";
    }


    /**
     *  订单结算
     * @param ids 购物车ids
     * @param nums 数量
     * @return
     * @throws Exception
     */
    @RequestMapping("jiesuan.do")
    @ResponseBody
    public Result jiesuan(String ids[], Integer nums[], String prices[], OrderEntity orderEntity,String addressId)throws Exception{
        CustomerEntity userEntity = Contants.getCustomer();

        orderEntity.setId(IdWorkerUtil.getId());
        orderEntity.setCustomerId(userEntity.getId());
        orderEntity.setStatus(1);
        orderEntity.setTime(new Date());

        CustomerAddressEntity customerAddressEntity = customerAddressService.selectById(addressId);
        if(customerAddressEntity==null){
            return  Result.error("请选择收货地址");
        }
        //验证库存是否足够
        for (int i = 0; i <ids.length ; i++) {
            ShoppingGatEntity shoppingGatEntity = shoppingGatService.selectById(ids[i]);
            ShopEntity shopEntity = shopService.selectById(shoppingGatEntity.getShopId());
            if(shopEntity.getStock()==null || shopEntity.getStock()<shoppingGatEntity.getNum()){
                return Result.error(shopEntity.getName()+"库存不足");
            }
        }

        orderEntity.setAddress(customerAddressEntity.getAddress());
        orderEntity.setName(customerAddressEntity.getName());
        orderEntity.setPhone(customerAddressEntity.getPhone());
        orderService.insert(orderEntity);
        for (int i = 0; i <ids.length ; i++) {
            ShoppingGatEntity shoppingGatEntity = shoppingGatService.selectById(ids[i]);
            ShopEntity shopEntity = shopService.selectById(shoppingGatEntity.getShopId());
            OrderShopEntity orderShopEntity = new OrderShopEntity();
            orderShopEntity.setId(IdWorkerUtil.getId());
            orderShopEntity.setPrice(new BigDecimal(prices[i]));
            orderShopEntity.setNum(nums[i]);
            orderShopEntity.setOrderId(orderEntity.getId());
            orderShopEntity.setName(shopEntity.getName());
            orderShopEntity.setCover(shopEntity.getCover());
            orderShopEntity.setShopId(shopEntity.getId());
            orderShopEntity.setCustomerId(userEntity.getId());
            orderShopService.insert(orderShopEntity);
            shopEntity.setStock(shopEntity.getStock()-nums[i]);
            shopService.updateById(shopEntity);
            shoppingGatService.deleteById(ids[i]);

        }
        return Result.success("订单结算成功");
    }

}

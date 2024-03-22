package com.graduation.controller.mobile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.graduation.mapper.OrderShopDao;
import com.graduation.model.OrderShopEntity;
import com.graduation.model.ShopEntity;
import com.graduation.model.XinwenEntity;
import com.graduation.service.ShopService;
import com.graduation.service.XinwenService;

@Controller
@RequestMapping("mobileShop")
public class MobileShopController {
	@Autowired
	private ShopService shopService;

	@Autowired
	private OrderShopDao orderShopDao;
	@Autowired
	private XinwenService XinwenService;

	@RequestMapping("info.html")
	public String info(String id, String customerId, Model model) throws Exception {
		ShopEntity shopEntity = shopService.selectById(id);
		System.out.println(shopEntity.getName() + "xxxxxx");
		model.addAttribute("shop", shopEntity);
		model.addAttribute("id", id);
		List<OrderShopEntity> list = orderShopDao.list(id);
		model.addAttribute("list", list);
		model.addAttribute("customerId", customerId);
		return "mobile/shop_info";
	}

	@RequestMapping("xinwenDetail.html")
	public String xinwenDetail(String id, Model model) throws Exception {
		XinwenEntity selectById = XinwenService.selectById(id);
		model.addAttribute("shop", selectById);
		model.addAttribute("id", id);
		return "mobile/xinwenDetail";
	}
	

}

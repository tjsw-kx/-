package com.graduation.controller.mobile;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.graduation.config.Contants;
import com.graduation.entity.TuijianEntity;
import com.graduation.mapper.TuiJianDao;
import com.graduation.model.CustomerEntity;
import com.graduation.model.ShopEntity;
import com.graduation.model.ShopTypeEntity;
import com.graduation.model.XinwenEntity;
import com.graduation.service.ShopService;
import com.graduation.service.ShopTypeService;
import com.graduation.service.XinwenService;

@Controller
@RequestMapping("mobile")
public class MobileIndexController {

	@Autowired
	private ShopTypeService shopTypeService;

	@Autowired
	private ShopService shopService;
	@Autowired
	private XinwenService XinwenService;

	@Autowired
	private TuiJianDao tuiJianDao;

	/**
	 * 首页
	 * 
	 * @return
	 * @throws Exception
	 */
	@GetMapping("index.html")
	public String index(Model model) throws Exception {
		List<ShopTypeEntity> types = shopTypeService.selectList(new EntityWrapper<>());
		model.addAttribute("types", types);
		EntityWrapper wrapper = new EntityWrapper();
		wrapper.eq("status", true);
		List<ShopEntity> shopEntities = shopService.selectList(wrapper);
		model.addAttribute("shops", shopEntities);
		if (shopEntities != null) {
			List<ShopEntity> hot1 = new ArrayList<>();
			List<List<ShopEntity>> hots = new ArrayList<>();
			for (ShopEntity shopEntity : shopEntities) {
				if (shopEntity.isHot()) {
					hot1.add(shopEntity);
				}
			}
			for (int i = 0; i < (hot1.size() % 4 == 0 ? hot1.size() / 4 : hot1.size() / 4 + 1); i++) {
				int end = (i + 1) * 4;
				if (end > hot1.size() - 1) {
					end = hot1.size() - 1;
				}
				hots.add(hot1.subList(i * 4, end));
			}
			model.addAttribute("hots", hots);
		}

		List<XinwenEntity> selectList = XinwenService.selectList(null);
		model.addAttribute("xinwenList", selectList);

		List<ShopEntity> rejList = new LinkedList<ShopEntity>();

		CustomerEntity customer = Contants.getCustomer();
		if (customer != null) {
			EntityWrapper wrapper11 = new EntityWrapper();
			wrapper11.eq("userid", customer.getId());
			List<TuijianEntity> selectList2 = tuiJianDao.selectList(wrapper11);
			if (selectList2 != null && !selectList2.isEmpty()) {
				for (TuijianEntity object : selectList2) {
					rejList.add(shopService.selectById(object.getGoodid()));
				}
			}
		}
		
		model.addAttribute("rejList", rejList);
		return "mobile/index";
	}

}

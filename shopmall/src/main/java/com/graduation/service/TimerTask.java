package com.graduation.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.graduation.entity.TuijianEntity;
import com.graduation.mapper.CustomerDao;
import com.graduation.mapper.ShopDao;
import com.graduation.mapper.TuiJianDao;
import com.graduation.model.CustomerEntity;
import com.graduation.model.ShopEntity;

@Component
public class TimerTask {

	@Autowired // spring注入类对象
	private CustomerDao customerDao;
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private TuiJianDao tuiJianDao;

	// 每天0点0分0秒执行一次
	@Scheduled(cron = "*/10 * * * * ?")
	public void timer1() {
		List<CustomerEntity> users = customerDao.selectList(null);
		if (users != null && !users.isEmpty()) {
			tuiJianDao.deleTuijian();
			for (CustomerEntity users2 : users) {
				JSONArray array = this.getNumByCustomer(users2.getId());
				if (array != null && !array.isEmpty()) {
					for (int i = 0; i < array.size(); i++) {
						JSONObject jsonObject = array.getJSONObject(i);
						TuijianEntity tj = new TuijianEntity();
						tj.setUserid(users2.getId());
						tj.setId(UUID.randomUUID().toString());
						tj.setGoodid(jsonObject.getString("goodsId"));
						tuiJianDao.insert(tj);
					}
				}
			}
		}

	}

	public JSONArray getNumByCustomer(String mid) {
		// 当前用户所购买的商品
		List<ShopEntity> list = shopDao.findAll(mid);
		if (list == null || list.isEmpty()) {
			return null;
		}
		JSONArray retArray = new JSONArray();
		JSONArray array = new JSONArray();
		JSONObject allJson = new JSONObject();
		// 查询所有用户
		List<CustomerEntity> userList = customerDao.selectList(null);
		if (userList != null && !userList.isEmpty()) {
			for (CustomerEntity member : userList) {
				if (member.getId() != mid) {
					// 其他人的购物商品
					List<ShopEntity> otherList = shopDao.findAll(member.getId());
					if (otherList != null && !otherList.isEmpty()) {
						allJson = new JSONObject();
						int sum = 0;
						// 统计两个用户的相似度
						JSONArray goodsArray = new JSONArray();
						for (int i = 0; i < list.size(); i++) {
							for (int j = 0; j < otherList.size(); j++) {
								if (list.get(i).getId().equals(otherList.get(j).getId())) {
									sum++;
									continue;
								}
								JSONObject goodsJson = new JSONObject();
								goodsJson.put("goodsId", otherList.get(j).getId());
								goodsArray.add(goodsJson);
							}
						}
						allJson.put("num", sum);
						allJson.put("userId", member.getId());
						allJson.put("goodsArray", goodsArray);
						array.add(allJson);
					}
				}
			}

			if (!array.isEmpty()) {
				for (int i = 0; i < array.size(); i++) {
					JSONObject obj = array.getJSONObject(i);
					if (obj.getInteger("num") != 0) {
						JSONArray jsonArray = obj.getJSONArray("goodsArray");
						if (!jsonArray.isEmpty()) {
							for (int j = 0; j < jsonArray.size(); j++) {
								JSONObject objjj = jsonArray.getJSONObject(j);
								retArray.add(objjj);
							}
						}
					}
				}

			}
		}

		return delRepeatIndexid(retArray);
	}

	// 取出相似度最高得商品
	public static JSONArray delRepeatIndexid(JSONArray array) {

		JSONArray arrayTemp = new JSONArray();
		int num = 0;
		for (int i = 0; i < array.size(); i++) {
			if (num == 0) {
				arrayTemp.add(array.get(i));
			} else {
				int numJ = 0;
				for (int j = 0; j < arrayTemp.size(); j++) {
					JSONObject newJsonObjectI = (JSONObject) array.get(i);
					JSONObject newJsonObjectJ = (JSONObject) arrayTemp.get(j);
					String index_idI = newJsonObjectI.get("goodsId").toString();
					String index_idJ = newJsonObjectJ.get("goodsId").toString();
					if (index_idI.equals(index_idJ)) {
						arrayTemp.remove(j);
						JSONObject newObject = new JSONObject();
						newObject.put("goodsId", index_idI);
						arrayTemp.add(newObject);
						break;
					}
					numJ++;
				}
				if (numJ - 1 == arrayTemp.size() - 1) {
					arrayTemp.add(array.get(i));
				}
			}
			num++;
		}
		return arrayTemp;
	}

}

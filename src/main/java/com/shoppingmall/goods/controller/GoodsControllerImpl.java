package com.shoppingmall.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.common.base.BaseController;

@Controller("goodsController")
@RequestMapping
public class GoodsControllerImpl extends BaseController implements GoodsController{

	@Override
	public ModelAndView goodsDetail(String goods_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String keywordSearch(String keyword, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView searchGoods(String searchWord, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

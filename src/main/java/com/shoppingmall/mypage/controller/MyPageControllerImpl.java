package com.shoppingmall.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shoppingmall.common.base.BaseController;

public class MyPageControllerImpl extends BaseController implements MyPageController{
	@Autowired
	MyPageService myPageService;
	@Autowired
	MemberVO memberVO;
	
	public ModelAndView mayPageMain(String message, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ModelAndView myOrderDetail(String order_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ModelAndView cancelMyOrder(String order_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ModelAndView listMyOrderHistory(Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ResponseEntity modifyMyInfo(String attribute, String value, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}

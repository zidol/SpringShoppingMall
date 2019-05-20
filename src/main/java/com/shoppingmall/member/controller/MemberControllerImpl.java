package com.shoppingmall.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shoppingmall.member.service.MemberService;
import com.shoppingmall.member.vo.MemberVO;

public class MemberControllerImpl implements MemberController{
	@Autowired
	MemberService memberService;
	@Autowired
	MemberVO memberVO;

	@Override
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(loginMap);
		if(memberVO != null && memberVO.getMember_id() != null) {
			HttpSession session = request.getSession();
			session = request.getSession();
			session.setAttribute("isLogin", true);
			session.setAttribute("memberInfo", memberVO);
			
			String action = (String)session.getAttribute("action");
			if(action != null && action.equals("/order/orderEachGoods.do")) {
				mav.setViewName("forward:" + action);
			} else {
				mav.setViewName("redirect:/main/main.do");
			}
			
		}else {
			String message = "";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}

	@Override
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogin", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}

	@Override
	@RequestMapping(value="/addMember.do", method=RequestMethod.POST)
	public ResponseEntity insertMember(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			memberService.insertMember(memberVO);
			message = "<script>";
			message += "alert('');";
			message += "location.href='"+request.getContextPath() + "/member/memberForm.do';";
			message += "</script>";
		} catch (Exception e) {
			message = "<script>";
			message += "alert('');";
			message += "location.href='"+request.getContextPath() + "/member/memberForm.do';";
			message += "</script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/overlapped.do", method= RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id")String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

}

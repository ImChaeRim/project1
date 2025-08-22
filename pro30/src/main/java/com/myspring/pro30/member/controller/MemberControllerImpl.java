package com.myspring.pro30.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.myspring.pro30.member.service.MemberService;
import com.myspring.pro30.member.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl extends MultiActionController implements MemberController{
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	
	@Autowired
	private MemberService memberService; 
	
	@Autowired
	MemberVO memberVO; 
	
	@RequestMapping(value="/member/searchMemberList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchMemberList(@RequestParam("name") String name,
			HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		
		
		List searchMemberList = memberService.searchMemberList(name);
		mav.addObject("membersList", searchMemberList);
		mav.addObject("name", name);
		
		return mav;
	}
	
	@RequestMapping(value="/member/listMembers.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName = getViewName(request);
		
		logger.info("info  : viewName = "+ viewName);
		logger.debug("debug  : viewName = "+ viewName);
		
		List membersList = memberService.listMembers();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);		
		
		return mav;
	}
	
	@RequestMapping(value="/member/loginForm.do", method=RequestMethod.GET)
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/member/memberForm.do", method=RequestMethod.GET)
	public ModelAndView memberForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
	        HttpServletRequest request, HttpServletResponse response) throws Exception{
	    
	    String viewName = getViewName(request);
	    ModelAndView mav = new ModelAndView(viewName);
	    
	    memberVO = memberService.login(member);
	    
	    if(memberVO != null) {
<<<<<<< HEAD
	    	// 관리자 여부 확인
=======
	        // 愿�由ъ옄 �뿬遺� �솗�씤
>>>>>>> origin/main
	        if (memberVO.isAdmin()) { 
	            HttpSession session = request.getSession();
	            session.setAttribute("member", memberVO); 
	            session.setAttribute("isLogOn", true); 
	            
	            // 愿�由ъ옄�뒗 �쉶�썝 紐⑸줉 �럹�씠吏�濡� 由щ뵒�젆�뀡
	            mav.setViewName("redirect:/member/listMembers.do");
	        } else {
	            HttpSession session = request.getSession();
	            session.setAttribute("member", memberVO); 
	            session.setAttribute("isLogOn", true); 
	            
	            // �씪諛� �궗�슜�옄�뒗 硫붿씤 �럹�씠吏�濡� 由щ뵒�젆�뀡
	            mav.setViewName("redirect:/main.do");
	        }
	    } else {
	        logger.info(" 濡쒓렇�씤 �떎�뙣 ");
	        mav.setViewName("redirect:/member/loginForm.do");
	    }
	    
	    return mav;
	}

	
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
	    ModelAndView mav = new ModelAndView();
	    
	    HttpSession session = request.getSession();
	    MemberVO member = (MemberVO) session.getAttribute("member");

	    // 濡쒓렇�븘�썐 �썑 �꽭�뀡�뿉�꽌 'member'�� 'isLogOn' �젣嫄�
	    session.removeAttribute("member"); 
	    session.removeAttribute("isLogOn");

	    // 愿�由ъ옄�씪硫� 硫붿씤 �럹�씠吏�濡� 由щ뵒�젆�뀡
	    if (member != null && member.isAdmin()) {
	        mav.setViewName("redirect:/main.do");
	    } else {
	        mav.setViewName("redirect:/main.do");
	    }

	    return mav;
	}

	
	@RequestMapping(value="/member/addMember.do", method=RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO memberVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		int addMember = memberService.addMember(memberVO);
		
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");	
		
		return mav;
	}
	
	@RequestMapping(value="/member/memberUpdateForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateForm(@ModelAttribute("member") MemberVO memberVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName = getViewName(request);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("member", memberVO);	
		
		return mav;
	}
	
	@RequestMapping(value="/member/updateMember.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateMember(@ModelAttribute("member") MemberVO memberVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		memberService.updateMember(memberVO);
		

		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		
		return mav;
	}
	
	@RequestMapping(value="/member/delete.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView delMember(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("id = "+ id);
		
		memberService.delMember(id);
		
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		
		return mav;
	}
	
		
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		
		System.out.println("contextPath :: "+ contextPath);
		
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0; //
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length(); 
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";"); 
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?"); 
		} else {
			end = uri.length();
		}

		String fileName = uri.substring(begin, end);
		if (fileName.indexOf(".") != -1) {
			fileName = fileName.substring(0, fileName.lastIndexOf(".")); 
																			
		}
		if (fileName.lastIndexOf("/") != -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/"), fileName.length()); 
																							
		}
		return fileName;
	}

}

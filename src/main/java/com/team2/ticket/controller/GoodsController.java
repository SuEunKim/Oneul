package com.team2.ticket.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team2.ticket.dto.Paging;
import com.team2.ticket.service.GoodsService;

@Controller
public class GoodsController {
	@Autowired
	GoodsService gs;
	
	@RequestMapping("/goodsMain")
	public String goods_main(HttpServletRequest request, Model model) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ref_cursor1", null);
		paramMap.put("ref_cursor2", null);
		gs.getBestNewGoods(paramMap);
		
		ArrayList<HashMap<String, Object>> list1
			= (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor1");
		ArrayList<HashMap<String, Object>> list2
			= (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor2");
		model.addAttribute("bestGoodsList", list1);
		model.addAttribute("newGoodsList", list2);
		
		return "goods/goodsMain";
	}
	
	@RequestMapping("/goodsCategory")
	public ModelAndView category(HttpServletRequest request, @RequestParam("kind") String kind) {
		ModelAndView mav = new ModelAndView();
		
		int page = 1;
		HttpSession session = request.getSession();
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		}else if(session.getAttribute("page")!=null) {
			page = (Integer)session.getAttribute("page");
		}else {
			session.removeAttribute("page");
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ref_cursor", null);
		paramMap.put("kind", kind);
		
		gs.getGoodsKindList(paramMap, page);		
		ArrayList<HashMap<String, Object>> list
			= (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
		
		String [] goodsKindList = {"","문구","디지털","가방 · 파우치","취미용품","패션 · 잡화"};
		
		mav.addObject("goodsKind", goodsKindList[Integer.parseInt(kind)]);
		mav.addObject("goodsCategoryList", list);
		mav.addObject("kind", kind);
		mav.addObject("paging", (Paging)paramMap.get("paging"));
		mav.setViewName("goods/goodsCategory");
		return mav;
	}
}

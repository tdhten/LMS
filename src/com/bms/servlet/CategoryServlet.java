package com.bms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bms.common.servlet.BaseServlet;
import com.bms.domain.Category;
import com.bms.service.CategoryService;


/**  
* @ClassName: CategoryServlet  
* @Description: 分类模块WEB层  
*/
public class CategoryServlet extends BaseServlet{
	
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService = new CategoryService();
	/**
	 * 查询所有分类
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 通过service得到所有的分类
		 * 2. 保存到request中，转发到left.jsp
		 */
		List<Category> parents = categoryService.findAll();
		req.setAttribute("parents", parents);
		return "f:/jsps/left.jsp";
	}
}

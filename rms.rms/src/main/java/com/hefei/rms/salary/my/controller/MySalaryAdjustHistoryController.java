package com.hefei.rms.salary.my.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hefei.api.rms.salary.dto.SalaryHistoryDTO;
import com.hefei.common.exception.BusinessException;
import com.hefei.common.page.Pagination;
import com.hefei.frontend.framework.http.request.CommonParameterThreadLocal;
import com.hefei.frontend.framework.http.request.RequestThreadLocal;
import com.hefei.rms.salary.service.ISalaryService;

@Controller
@RequestMapping("/salary/my")
@SuppressWarnings("all")
public class MySalaryAdjustHistoryController {

	private Logger logger = Logger.getLogger(MySalaryAdjustHistoryController.class);
	
	@Autowired
	private ISalaryService salaryService;
	
	@RequestMapping(value="/adjustHistory",produces="text/plain;charset=UTF-8")
	public String index(HttpServletRequest request, HttpServletResponse response,Integer pageIndex, Integer pageSize){
		try{
			if(pageIndex == null || pageIndex <= 0){
				pageIndex = 1;
			}
			if(pageSize == null || pageSize <=0){
				pageSize = Pagination.DEFAULT_PAGE_SIZE;
			}
			Pagination<SalaryHistoryDTO> pagination = salaryService.findSalaryAdjustHistory(CommonParameterThreadLocal.getCurrentCompanyId(), CommonParameterThreadLocal.getEmployeeId(), CommonParameterThreadLocal.getUserId(), null,null,pageIndex, pageSize);
			request.setAttribute("pagination", pagination);
		} catch (BusinessException e) {
			logger.error(RequestThreadLocal.getTimer() + " error", e);
		}
		return "salary/my/adjusthistory" ;
	}
}

package com.hefei.cas.admin.cas.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.hefei.api.cas.module.vo.ModuleInfo;
import com.hefei.cas.admin.auth.controller.AuthController;
import com.hefei.cas.admin.cas.service.IAdminCasService;
import com.hefei.cas.module.po.Module;
import com.hefei.common.http.response.BaseResponse;
import com.hefei.common.returncode.ReturnCode;
import com.hefei.common.util.JacksonUtil;
import com.hefei.service.framework.base.request.RequestThreadLocal;
import com.hefei.service.framework.exception.ServiceException;

@Controller
@RequestMapping(value="/admin/menu", produces = "text/plain;charset=UTF-8")
public class AdminMenuController {

private static final Logger logger = Logger.getLogger(AuthController.class);
	
	@Autowired
	private IAdminCasService adminCasService;
	
	@RequestMapping(value="/get")
	@ResponseBody
	public String get() {
		BaseResponse result = new BaseResponse();
		String plain = RequestThreadLocal.getPlain();
		//参数判断非空
		if(StringUtils.isBlank(plain)) {
			result.setReturnCode(ReturnCode.RETURN_CODE_ERROR_PARAM_NULL);
			logger.info(RequestThreadLocal.getLoggerStr() + " Plain is null ");
			return JacksonUtil.beanToJson(result);
		}
		JsonNode node = JacksonUtil.getJsonNode(plain);
		Long adminId = JacksonUtil.getLong(node, "adminId");
		Long systemId = JacksonUtil.getLong(node, "systemId");
		try {
			List<Module> moduleMenus = adminCasService.getModuleMenus(adminId, systemId);
			List<ModuleInfo> menus = new ArrayList<ModuleInfo>();
			if(moduleMenus != null && moduleMenus.size() > 0)
				for(Module  module: moduleMenus){
					ModuleInfo menu = new ModuleInfo();
					BeanUtils.copyProperties(module, menu);
					menus.add(menu);
				}
			
			result.setReturnCode(ReturnCode.RETURN_CODE_SUCCESS);
			result.setReturnObject(menus);
		} catch (ServiceException e) {
			result.setReturnCode(e.getErrorCode());
		}
		logger.info(RequestThreadLocal.getLoggerStr()+" result "+result);
		return JacksonUtil.beanToJson(result);
	}
}

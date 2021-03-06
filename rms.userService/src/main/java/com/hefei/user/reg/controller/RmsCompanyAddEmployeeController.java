package com.hefei.user.reg.controller;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.hefei.api.user.reg.vo.RegisterRequestByEmailMobile;
import com.hefei.common.http.response.BaseResponse;
import com.hefei.common.returncode.ReturnCode;
import com.hefei.common.util.JacksonUtil;
import com.hefei.service.framework.base.request.RequestThreadLocal;
import com.hefei.service.framework.exception.ServiceException;
import com.hefei.user.reg.service.IRegisterService;

@Controller
@RequestMapping(value="/reg/rms", produces = "text/plain;charset=UTF-8")
public class RmsCompanyAddEmployeeController {

	private static final Logger logger = Logger.getLogger(RmsCompanyAddEmployeeController.class);
	
	@Autowired
	private IRegisterService registerService;

	@RequestMapping(value="/companyAddEmployee")
	@ResponseBody
	public String companyAddEmployee() {
		BaseResponse result = new BaseResponse();
		result.setReturnCode(ReturnCode.RETURN_CODE_ERROR);
		
		String plain = RequestThreadLocal.getPlain();
		//参数判断非空
		if(StringUtils.isBlank(plain)) {
			result.setReturnCode(ReturnCode.RETURN_CODE_ERROR_PARAM_NULL);
			logger.info(RequestThreadLocal.getLoggerStr() + " Plain is null ");
			return JacksonUtil.beanToJson(result);
		}
		JsonNode node = JacksonUtil.getJsonNode(plain);
		JsonNode regRequestNode = node.get("registerRequest");
		RegisterRequestByEmailMobile registerRequest = JacksonUtil.jsonToBean(regRequestNode, RegisterRequestByEmailMobile.class);
		try {
			Long userId = registerService.companyAddEmployee(registerRequest);
			result.setReturnCode(ReturnCode.RETURN_CODE_SUCCESS);
			result.setReturnObject(userId);
		} catch (ServiceException e) {
			result.setReturnCode(e.getErrorCode());
		} catch ( Exception e) {
			logger.error(RequestThreadLocal.getLoggerStr() + " error", e);
		}
		logger.info(RequestThreadLocal.getLoggerStr()+" result "+result);
		return JacksonUtil.beanToJson(result);
	}
}

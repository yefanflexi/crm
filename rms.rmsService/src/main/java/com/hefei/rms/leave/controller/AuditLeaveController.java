package com.hefei.rms.leave.controller;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.hefei.common.http.response.BaseResponse;
import com.hefei.common.returncode.ReturnCode;
import com.hefei.common.util.JacksonUtil;
import com.hefei.rms.leave.service.ILeaveService;
import com.hefei.service.framework.base.request.RequestThreadLocal;
import com.hefei.service.framework.exception.ServiceException;

@Controller
@RequestMapping(value="/leave", produces = "text/plain;charset=UTF-8")
public class AuditLeaveController {

	private static final Logger logger = Logger.getLogger(AuditLeaveController.class);
	
	@Autowired
	private ILeaveService leaveService;
	
	
	/**
	 * 查询员工信息
	 * @return
	 */
	@RequestMapping(value="/audit",produces="text/plain;charset=UTF-8",method=RequestMethod.POST)
	@ResponseBody
	public String audit(){
		BaseResponse result = new BaseResponse();
		result.setReturnCode(ReturnCode.RETURN_CODE_ERROR);
		try {
			String plainString = RequestThreadLocal.getPlain();
			if(StringUtils.isBlank(plainString)){
				logger.info(RequestThreadLocal.getLoggerStr() + " Plain is null ");
				result.setReturnCode(ReturnCode.RETURN_CODE_ERROR_PARAM_NULL);
				return JacksonUtil.beanToJson(result);
			}
			String auditStatus=null; 
			Long auditEmployeeId=null;
			Long leaveId=null;
			
			JsonNode jsonNode = JacksonUtil.jsonToBean(plainString, JsonNode.class);
			if(jsonNode.has("auditStatus")){
				auditStatus = JacksonUtil.getString(jsonNode, "auditStatus");
			}
			if(jsonNode.has("auditEmployeeId")){
				auditEmployeeId = JacksonUtil.getLong(jsonNode, "auditEmployeeId");
			}
			if(jsonNode.has("leaveId")){
				leaveId = JacksonUtil.getLong(jsonNode, "leaveId");
			}
			leaveService.audit(auditEmployeeId, leaveId, auditStatus);
			result.setReturnCode(ReturnCode.RETURN_CODE_SUCCESS);
		} catch(ServiceException e){
			result.setReturnCode(e.getErrorCode());
		} catch (Exception e) {
			result.setReturnCode(ReturnCode.RETURN_CODE_ERROR);
			logger.error(RequestThreadLocal.getLoggerStr()+"error:",e);
		}
		
		String resultStr = JacksonUtil.beanToJson(result);
		logger.info(RequestThreadLocal.getLoggerStr()+" result:"+resultStr);
		return resultStr ;
	}
}

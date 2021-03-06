package com.hefei.rms.leave.controller;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.hefei.common.http.response.BaseResponse;
import com.hefei.common.page.Pagination;
import com.hefei.common.returncode.ReturnCode;
import com.hefei.common.util.DateUtil;
import com.hefei.common.util.JacksonUtil;
import com.hefei.rms.leave.po.Leave;
import com.hefei.rms.leave.service.ILeaveService;
import com.hefei.service.framework.base.request.RequestThreadLocal;
import com.hefei.service.framework.exception.ServiceException;

@Controller
@RequestMapping(value="/leave", produces = "text/plain;charset=UTF-8")
public class LeaveController {

	private static final Logger logger = Logger.getLogger(LeaveController.class);
	
	@Autowired
	private ILeaveService leaveService;
	
	/**
	 * 查询员工信息列表
	 * @return
	 */
	@RequestMapping(value="/findPagination",produces="text/plain;charset=UTF-8",method=RequestMethod.POST)
	@ResponseBody
	public String findPagination(){
		BaseResponse result = new BaseResponse();
		result.setReturnCode(ReturnCode.RETURN_CODE_ERROR);
		try {
			String plainString = RequestThreadLocal.getPlain();
			if(StringUtils.isBlank(plainString)){
				logger.info(RequestThreadLocal.getLoggerStr() + " Plain is null ");
				result.setReturnCode(ReturnCode.RETURN_CODE_ERROR_PARAM_NULL);
				return JacksonUtil.beanToJson(result);
			}
			
			JsonNode jsonNode = JacksonUtil.getJsonNode(plainString);
			String employeeName=null; 
			Long employeeId=null;
			String cardNo=null;
			Long companyId=null;
			String leaveType=null;
			Long auditEmployeeId=null;
			String auditStatus=null;
			Date startTime=null;
			Date endTime=null;
			Integer pageIndex = null;
			Integer pageSize = null;
			
			if(jsonNode.has("employeeName")){
				employeeName = JacksonUtil.getString(jsonNode, "employeeName");
			}
			if(jsonNode.has("employeeId")){
				employeeId = JacksonUtil.getLong(jsonNode, "employeeId");
			}
			if(jsonNode.has("companyId")){
				companyId = JacksonUtil.getLong(jsonNode, "companyId");
			}
			if(jsonNode.has("cardNo")){
				cardNo = JacksonUtil.getString(jsonNode, "cardNo");
			}
			if(jsonNode.has("leaveType")){
				leaveType = JacksonUtil.getString(jsonNode, "leaveType");
			}
			if(jsonNode.has("auditEmployeeId")){
				auditEmployeeId = JacksonUtil.getLong(jsonNode, "auditEmployeeId");
			}
			if(jsonNode.has("auditStatus")){
				auditStatus = JacksonUtil.getString(jsonNode, "auditStatus");
			}
			if(jsonNode.has("startTime")){
				String st = JacksonUtil.getString(jsonNode, "startTime");
				if(StringUtils.isNotBlank(st)){
					startTime = DateUtil.string2date(st, DateUtil.FORMAT_YYYY_MM_DDHHMMSS);
				}
			}
			if(jsonNode.has("endTime")){
				String st = JacksonUtil.getString(jsonNode, "endTime");
				if(StringUtils.isNotBlank(st)){
					endTime = DateUtil.string2date(st, DateUtil.FORMAT_YYYY_MM_DDHHMMSS);
				}
			}
			if(jsonNode.has("pageIndex")){
				pageIndex = JacksonUtil.getInt(jsonNode, "pageIndex");
			}
			if(jsonNode.has("pageSize")){
				pageSize = JacksonUtil.getInt(jsonNode, "pageSize");
			}
			if(pageSize ==0 ){
				pageSize = Pagination.DEFAULT_PAGE_SIZE;
			}
			Pagination<Leave> pagination = leaveService.findLeave(employeeName, employeeId, cardNo, companyId, leaveType, auditEmployeeId, auditStatus, startTime, endTime, pageIndex, pageSize);
			result.setReturnCode(ReturnCode.RETURN_CODE_SUCCESS);
			result.setReturnObject(pagination);
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
	
	/**
	 * 查询员工信息
	 * @return
	 */
	@RequestMapping(value="/getById",produces="text/plain;charset=UTF-8",method=RequestMethod.POST)
	@ResponseBody
	public String getById(){
		BaseResponse result = new BaseResponse();
		result.setReturnCode(ReturnCode.RETURN_CODE_ERROR);
		try {
			Long leaveId = null;
			String plainString = RequestThreadLocal.getPlain();
			if(StringUtils.isBlank(plainString)){
				logger.info(RequestThreadLocal.getLoggerStr() + " Plain is null ");
				result.setReturnCode(ReturnCode.RETURN_CODE_ERROR_PARAM_NULL);
				return JacksonUtil.beanToJson(result);
			}
			
			JsonNode jsonNode = JacksonUtil.jsonToBean(plainString, JsonNode.class);
			if( jsonNode.has("leaveId")) {
				leaveId = JacksonUtil.getLong(jsonNode, "leaveId");
				if(leaveId == null){
					result.setReturnCode(ReturnCode.RETURN_CODE_ERROR_PARAM_NULL);
					return JacksonUtil.beanToJson(result);
				}
			}
			
			Leave leave = leaveService.get(leaveId);
			if(leave == null){
				result.setReturnCode(ReturnCode.RETURN_CODE_ERROR_DATA_NOTEXISTS);
			}else{
				result.setReturnCode(ReturnCode.RETURN_CODE_SUCCESS);
				result.setReturnObject(leave);
			}
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

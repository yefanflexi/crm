<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.hefei.frontsample.common.util.FrontSampleConstant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>公司管理-更新公司信息</title>

	<link rel="stylesheet" type="text/css" href="<%=FrontSampleConstant.STAIC_SERVER_URL %>/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=FrontSampleConstant.STAIC_SERVER_URL %>/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=FrontSampleConstant.STAIC_SERVER_URL %>/lib/Hui-iconfont/1.0.7/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=FrontSampleConstant.STAIC_SERVER_URL %>/lib/icheck/icheck.css" />
	<link rel="stylesheet" type="text/css" href="<%=FrontSampleConstant.STAIC_SERVER_URL %>/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="<%=FrontSampleConstant.STAIC_SERVER_URL %>/static/h-ui.admin/css/style.css" />

	<script type="text/javascript" src="<%=FrontSampleConstant.STAIC_SERVER_URL %>/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="<%=FrontSampleConstant.STAIC_SERVER_URL %>/lib/layer/2.1/layer.js"></script> 
	<script type="text/javascript" src="<%=FrontSampleConstant.STAIC_SERVER_URL %>/static/h-ui/js/H-ui.js"></script> 
	<script type="text/javascript" src="<%=FrontSampleConstant.STAIC_SERVER_URL %>/static/h-ui.admin/js/H-ui.admin.js"></script>
</head>
<body>
    <div class="page-container">
		<form method="post" action="<%=FrontSampleConstant.FRONTSAMPLE_URL %>/sample/edit.do" id="editsampleForm" class="form form-horizontal">
			<input  value="${sample.id }"  id="id" name="id" type="hidden">
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>type：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" value="${sample.type }" id="type" name="type" type="text">
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
					<button onclick="editsampleForm();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont"></i> 保存</button>
					<button onclick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../common/panel-pop.jsp"></jsp:include>
	<script type="text/javascript" src="<%=FrontSampleConstant.STAIC_SERVER_URL %>/js/base/panel-pop/industry_func.js"></script>
	<script type="text/javascript" src="<%=FrontSampleConstant.STAIC_SERVER_URL %>/js/base/address/address.js"></script>
<script language="javascript">
function editsampleForm(){
	document.forms['editsampleForm'].submit();
}
</script>
</body>
</html>


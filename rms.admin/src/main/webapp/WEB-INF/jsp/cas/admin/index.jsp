<%@page import="com.hefei.admin.constants.AdminConstants"%>
<%@page import="com.hefei.api.cas.admin.vo.AdminInfo"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html >
  <head>
    <meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<LINK rel="Bookmark" href="<%=AdminConstants.STAIC_SERVER_URL %>/img/favicon.ico" >
	<LINK rel="Shortcut Icon" href="<%=AdminConstants.STAIC_SERVER_URL %>/img/favicon.ico" />
	<meta name="keywords" content="">
	<meta name="description" content="">
	
    <title>管理后台</title>

	<link rel="stylesheet" type="text/css" href="<%=AdminConstants.STAIC_SERVER_URL %>/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=AdminConstants.STAIC_SERVER_URL %>/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=AdminConstants.STAIC_SERVER_URL %>/lib/Hui-iconfont/1.0.7/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=AdminConstants.STAIC_SERVER_URL %>/lib/icheck/icheck.css" />
	<link rel="stylesheet" type="text/css" href="<%=AdminConstants.STAIC_SERVER_URL %>/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="<%=AdminConstants.STAIC_SERVER_URL %>/static/h-ui.admin/css/style.css" />

	<script type="text/javascript" src="<%=AdminConstants.STAIC_SERVER_URL %>/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="<%=AdminConstants.STAIC_SERVER_URL %>/lib/layer/2.1/layer.js"></script> 
	<script type="text/javascript" src="<%=AdminConstants.STAIC_SERVER_URL %>/static/h-ui/js/H-ui.js"></script> 
	<script type="text/javascript" src="<%=AdminConstants.STAIC_SERVER_URL %>/static/h-ui.admin/js/H-ui.admin.js"></script>
  </head>

  <body>
    	<nav class="breadcrumb">
    		<i class="Hui-iconfont">&#xe67f;</i> 首页
    		<span class="c-gray en">&gt;</span> 权限管理
    		<span class="c-gray en">&gt;</span> Admin用户管理
    		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    	</nav>
    	
    	<div class="page-container">
			<div class="text-c">
				<form method="post" action="<%=AdminConstants.ADMIN_SERVER_URL %>/cas/admin/search.do">
					<input type="hidden" name="pageIndex" id="pageIndex">
					<input type="hidden" name="pageSize" id="pageSize">
					<input type="text" name="username" id="" placeholder="用户登录名" style="width:250px" class="input-text">
					<input type="text" name="mobile" id="" placeholder="用户手机号码" style="width:250px" class="input-text">
					<input type="text" name="email" id="" placeholder="用户邮箱" style="width:250px" class="input-text">
					<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i>查询</button>
				</form>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20"> 
				<span class="l">
					<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
					<a class="btn btn-primary radius" href="javascript:;" onclick="admin_add('添加管理员','<%=AdminConstants.ADMIN_SERVER_URL %>/cas/admin/toCreate.do','800')"><i class="Hui-iconfont">&#xe600;</i>添加管理员</a>
				</span>
			</div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name="" value=""></th>
							<th width="80">ID</th>
							<th width="150">登录名</th>
							<th width="150">真实名称</th>
							<th width="150">手机号码</th>
							<th width="150">邮箱</th>
							<th width="80">状态</th>
							<th width="80">创建信息</th>
							<th width="120">更新信息</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty pagination.items }">
							<c:forEach var="item" items="${ pagination.items}" varStatus="status">
							<tr class="text-c">
								<td><input type="checkbox" value="${item.id }" name="chk" id="chk_${item.id }"></td>
								<td>${item.id }</td>
								<td class="text-l">${item.username }</td>
								<td class="text-l">${item.realName }</td>
								<td class="text-l">${item.mobileNo }</td>
								<td class="text-l">${item.email }</td>
								<td class="text-l">${item.username }</td>
								<td class="text-l">${item.username }</td>
								<td>
									<c:if test="${item.delFlag eq AdminInfo.DEL_FLAG_NORMAL }">正常</c:if>
									<c:if test="${item.delFlag eq AdminInfo.DEL_FLAG_CLOSE }">无效</c:if>
									<c:if test="${item.delFlag eq AdminInfo.DEL_FLAG_FREEZE }">无效</c:if>
								</td>
								<td>${item.creator}--<fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd hh:MM:ss"  /></td>
								<td>${item.updater}--<fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd hh:MM:ss"  /></td>
								<td class="f-14 td-manage">
									<a style="text-decoration:none" onClick="adminAuthRole(${item.id })" href="javascript:;" title="授权">授权</a>
									<a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
									<a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
								</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<jsp:include page="../../common/pagination.jsp"></jsp:include>
				</table>
			</div>
		</div>
<script type="text/javascript">
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
function adminAuthRole(adminId){
	var index = layer.open({
		type: 2,
		title: "授权",
		content: '<%=AdminConstants.ADMIN_SERVER_URL %>'+'/cas/admin/toAuthRole.do?adminId=' + adminId
	});
	layer.full(index);
}
</script>
  </body>
</html>

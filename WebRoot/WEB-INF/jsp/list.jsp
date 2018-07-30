<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>教育系统后台</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet"
			href="<%=basePath%>bootstrap/css/bootstrap.min.css">
		<link type="text/css"
			href="<%=basePath%>bootstrap/css/bootstrap-responsive.min.css"
			rel="stylesheet">
		<link type="text/css" href="<%=basePath%>index/css/theme.css"
			rel="stylesheet">
		<link type="text/css"
			href="<%=basePath%>index/images/icons/css/font-awesome.css"
			rel="stylesheet">
		<link type="text/css"
			href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
			rel='stylesheet'>

		<style>
		.loader {
			border: 16px solid #f3f3f3;
			border-radius: 50%;
			border-top: 16px solid #3498db;
			width: 10px;
			height: 10px;
			-webkit-animation: spin 2s linear infinite; /* Safari */
			animation: spin 2s linear infinite;
		}
		
		 /* Safari */
         @-webkit-keyframes spin {
             0% { -webkit-transform: rotate(0deg); }
             100% { -webkit-transform: rotate(360deg); }
         }

         @keyframes spin {
             0% { transform: rotate(0deg); }
             100% { transform: rotate(360deg); }
         }
         
		.loading {
			position: absolute;
			left: 0;
			top: 0;
			z-index: 1000;
			width: 100%;
			height: 100%;
			min-height: 100%;
			background: white;
			opacity: 0.8;
			text-align: center;
			color: Teal;
		}
		
		.loading_anim {
			position: absolute;
			display: flex;
			left: 50%;
			top: 50%;
			transform: translate(-50%, -50%);
			z-index: 1010;
		}
		</style>
	</head>

	<body ng-app="myApp" ng-controller="myCtrl">
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar" data-toggle="collapse"
						data-target=".navbar-inverse-collapse"> <i
						class="icon-reorder shaded"></i> </a>
					<a class="brand" href="<%=basePath%>school/init.do">教育系统后台</a>
				</div>
			</div>
			<!-- /navbar-inner -->
		</div>
		<!-- /navbar -->
		<div class="wrapper">
			<div class="container">
				<div class="row">
					<div class="span3">
						<div class="sidebar">
							<ul class="widget widget-menu unstyled">
								<li>
									<a href="javascript:;" ng-click="magArea()"><i
										class="menu-icon icon-inbox"></i>区域管理</a>
								</li>
								<li>
									<a href="javascript:;" ng-click="magSchool()"><i
										class="menu-icon icon-book"></i>学校管理</a>
								</li>
								<li>
									<a href="javascript:;" ng-click="magStreet()"><i
										class="menu-icon icon-tasks"></i>街道管理</a>
								</li>
							</ul>
							<!--/.widget-nav-->
							<ul class="widget widget-menu unstyled">
								<li>
									<a href="<%=basePath%>"><i class="menu-icon icon-signout"></i>登出</a>
								</li>
							</ul>
						</div>
						<!--/.sidebar-->
					</div>
					<!--/.span3-->
					<div class="span9">
						<div class="content" ng-show="bgShow"
							style="background: url(<%=basePath%>images/info-bg.png); background-repeat: no-repeat; display: block; width: 100%; height: 60%; background-size: 100% 100%;"></div>
						<div class="content" ng-show="areaShow">
							<div class="content">
								<div class="module">
									<div class="module-head">
										<h3>
											区域信息
										</h3>
									</div>
									<div class="module-body table">
										<div id="DataTables_Table_0_wrapper"
											class="dataTables_wrapper" role="grid">
											<div id="DataTables_Table_0_length" class="dataTables_length">
												<a class="btn btn-success" ng-click="addArea()">添加</a>
											</div>
											<table
												class="table table-striped table-bordered table-condensed">
												<thead>
													<tr>
														<th>
															ID
														</th>
														<th>
															名称
														</th>
														<th>
															操作
														</th>
													</tr>
												</thead>
												<tbody>
													<tr ng-repeat="area in areas">
														<td>
															{{ area.id }}
														</td>
														<td>
															{{ area.name }}
														</td>
														<td>
															<a class="btn btn-primary">修改</a>
															<a class="btn btn-danger">删除</a>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!--/.module-->
							</div>
						</div>
						<!-- area add -->
						<div class="content" ng-show="areaAddShow">
							<div class="module">
								<div class="module-head">
									<h3>
										添加区域
									</h3>
								</div>
								<div class="module-body">
									<div class="alert alert-error" ng-show="areaError">
										<strong>错误:</strong> 请填写区域名称
									</div>
									<form class="form-horizontal row-fluid">
										<div class="control-group">
											<label class="control-label" for="basicinput">
												区域名称
											</label>
											<div class="controls">
												<input type="text" ng-model="areaName" placeholder="请填写区域名称"
													class="span8 tip">
											</div>
										</div>
										<div class="control-group">
											<div class="controls">
												<button class="btn" type="submit" ng-click="addAreaSub()">
													提交
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- /.area add -->
						<!-- /.area content -->
						<div class="content" ng-show="schoolShow">
							school
						</div>
						<div class="content" ng-show="streetShow">
							streetShow
						</div>
						<!--/.content-->
					</div>
					<!--/.span9-->
				</div>
			</div>
			<!--/.container-->
		</div>
		<!--/.wrapper-->
		<div class="footer">
			<div class="container">
				<b class="copyright">&copy; 2018 Daniel - Duan </b>All rights
				reserved.
			</div>
		</div>
		<!-- loading -->
		<div class="loading" ng-show="loadingShow">
			<div class="loading_anim">
				<div class="loader" style="flex-grow: 1;"></div>
				<div
					style="flex-grow: 1; text-align: center; line-height: 52px; height: 52px;">
					数据提交中请稍后
				</div>
			</div>
		</div>
		<script src="<%=basePath%>js/angular1.4.8.min.js"
			type="text/javascript"></script>
		<script type="text/javascript">
			var app = angular.module('myApp', []);
			app.controller('myCtrl', function($scope,$http) {
				$scope.bgShow = true;
				$scope.loadingShow = false;
				//区域信息
			    $scope.areaShow = false;
			    $scope.areaAddShow = false;
			    $scope.areaError = false;
			    $scope.areaName = '';
			    //学校信息
			    $scope.schoolShow = false;
			    //街道信息
			    $scope.streetShow = false;
			    //初始化区域信息
			    $http({
			        method : "GET",
			        url : "<%=basePath%>school/getAreaList.do"
			    }).then(function mySucces(response) {
			        $scope.areas = response.data.datas;
			    }, function myError(response) {
			        alert("area/getAreaList.do访问错误出错!");
			        console.log(response.statusText);
			    });
			    $scope.magArea = function() {
			        $scope.areaShow = true;
				    $scope.schoolShow = false;
				    $scope.streetShow = false;
				    $scope.bgShow = false;
				    $scope.areaAddShow = false;
			    };
			    $scope.magSchool = function() {
			        $scope.areaShow = false;
				    $scope.schoolShow = true;
				    $scope.streetShow = false;
				    $scope.bgShow = false;
				    $scope.areaAddShow = false;
			    };
			    $scope.magStreet = function() {
			        $scope.areaShow = false;
				    $scope.schoolShow = false;
				    $scope.streetShow = true;
				    $scope.bgShow = false;
				    $scope.areaAddShow = false;
			    };
			    //添加区域信息
			    $scope.addArea = function() {
			        $scope.areaAddShow = true;
				    $scope.areaShow = false;
			    };
			    //添加区域提交
			    $scope.addAreaSub = function() {
			        if($scope.areaName == ''){
			        	$scope.areaError = true;
			        }else{
			        	$scope.areaError = false;
			        	$scope.loadingShow = true;
			        	var areaName = $scope.areaName;
			        	areaName = encodeURI(areaName);
			        	//增加区域信息
					    $http({
					        method : "POST",
					        url : "<%=basePath%>school/addArea.do",
					        //headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8' },
					        params: {
								name:areaName
							}
					    }).then(function mySucces(response) {
					        if(response.data.code==0){
					            $scope.areaName = '';
					            $http({
							        method : "GET",
							        url : "<%=basePath%>school/getAreaList.do"
							    }).then(function mySucces(response) {
							    	$scope.loadingShow = false;
							        $scope.areas = response.data.datas;
							    }, function myError(response) {
							    	$scope.loadingShow = false;
							        alert("area/getAreaList.do访问错误出错!");
							        console.log(response.statusText);
							    });
							    $scope.areaAddShow = false;
				    			$scope.areaShow = true;
					        	alert('添加成功!');
					        }else{
					        	$scope.loadingShow = false;
					        	alert('添加失败!');
					        }
					    }, function myError(response) {
					        alert("getAreaList.do访问错误出错!");
					        console.log(response.statusText);
					    });
			        }
			    };
			});
		</script>
	</body>
</html>

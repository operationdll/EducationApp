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
		body {
			background-color: white;
		}
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
		<div class="content" ng-show="areaShow">
			<div class="content">
				<div class="module">
					<div class="module-head">
						<h3>
							区域信息
						</h3>
					</div>
					<div class="module-body table">
						<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper"
							role="grid">
							<div id="DataTables_Table_0_length" class="dataTables_length">
								<a class="btn btn-success" ng-click="addArea()">添加</a>
							</div>
							<table class="table table-striped table-bordered table-condensed">
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
											<a class="btn btn-primary"
												ng-click="showUpdArea(area.id,area.name)">修改</a>
											<a class="btn btn-danger" ng-click="delArea(area.id)">删除</a>
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
								<input type="hidden" ng-model="areaId">
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
			//初始化区域信息
			function initAreaData($http,$scope){
			    $http({
			        method : "GET",
			        url : "<%=basePath%>school/getAreaList.do"
			    }).then(function mySucces(response) {
			    	$scope.loadingShow = false;
			        $scope.areas = response.data.datas;
			    }, function myError(response) {
			    	$scope.loadingShow = false;
			        alert("getAreaList.do访问错误出错!");
			        console.log(response.statusText);
			    });
			}
			var app = angular.module('myApp', []);
			app.controller('myCtrl', function($scope,$http) {
				$scope.loadingShow = true;
				//区域信息
			    $scope.areaShow = true;
			    $scope.areaAddShow = false;
			    $scope.areaError = false;
			    $scope.areaName = '';
			    //学校信息
			    $scope.schoolShow = false;
			    //街道信息
			    $scope.streetShow = false;
			    //初始化区域信息
			    initAreaData($http,$scope);
			    //添加区域信息
			    $scope.addArea = function() {
			        $scope.areaAddShow = true;
				    $scope.areaShow = false;
				    $scope.areaId="";
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
			         	if($scope.areaId==""){
			         		//增加区域信息
						    $http({
						        method : "POST",
						        url : "<%=basePath%>school/addArea.do",
						        params: {
									name:areaName
								}
						    }).then(function mySucces(response) {
						        if(response.data.code==0){
						            $scope.areaName = '';
						            //初始化区域信息
				    				initAreaData($http,$scope);
								    $scope.areaAddShow = false;
					    			$scope.areaShow = true;
						        	alert('添加成功!');
						        }else{
						        	$scope.loadingShow = false;
						        	alert('添加失败!');
						        }
						    }, function myError(response) {
						        alert("addAreaSub.do访问错误出错!");
						        console.log(response.statusText);
						    });
			         	}else{
			         		var id = $scope.areaId;
			         		//修改区域信息
						    $http({
						        method : "POST",
						        url : "<%=basePath%>school/updArea.do",
						        params: {
									name:areaName,
									id:id
								}
						    }).then(function mySucces(response) {
						        if(response.data.code==0){
						            $scope.areaName = '';
						            //初始化区域信息
				    				initAreaData($http,$scope);
								    $scope.areaAddShow = false;
					    			$scope.areaShow = true;
						        	alert('修改成功!');
						        }else{
						        	$scope.loadingShow = false;
						        	alert('修改失败!');
						        }
						    }, function myError(response) {
						        alert("updArea.do访问错误出错!");
						        console.log(response.statusText);
						    });
			         	}
			        }
			    };
			    //删除区域信息
			    $scope.delArea = function(id) {
			    	if (window.confirm("是否删除选中项?")) {
			    		$scope.loadingShow = true;
						$http({
					        method : "POST",
					        url : "<%=basePath%>school/delArea.do",
					        params: {
								id:id
							}
					    }).then(function mySucces(response) {
					        if(response.data.code==0){
					            $scope.areaName = '';
					            //初始化区域信息
				    			initAreaData($http,$scope);
					        	alert('删除成功!');
					        }else{
					        	$scope.loadingShow = false;
					        	alert('删除失败!');
					        }
					    }, function myError(response) {
					        alert("delArea.do访问错误出错!");
					        console.log(response.statusText);
					    });
					}
			    };
			    //显示修改区域信息
			    $scope.showUpdArea = function(id,name) {
			    	$scope.areaAddShow = true;
				    $scope.areaShow = false;
				    $scope.areaId = id;
				    $scope.areaName = name;
			    };
			});
		</script>
	</body>
</html>

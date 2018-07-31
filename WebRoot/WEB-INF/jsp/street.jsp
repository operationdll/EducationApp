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
		
		.dropdown-menu{
			display:block;
		}
	</style>
	</head>
	<body ng-app="myApp" ng-controller="myCtrl">
		<div class="content" ng-show="listShow">
			<div class="content">
				<div class="module">
					<div class="module-head">
						<h3>
							街道信息
						</h3>
					</div>
					<div class="module-body table">
						<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper"
							role="grid">
							<div class="dataTables_length">
								<label>
									区域:
									<select size="1" name="DataTables_Table_0_length"
										style="width:auto;" ng-options="v.id as v.name for v in selectitems" ng-change="areaChange()" ng-model="searchP1">
										<option value="">
											--请选择--
										</option>
									</select>
									学校:
									<select size="1" name="DataTables_Table_0_length"
										style="width:auto;" ng-options="v.id as v.name for v in schoolOptions" ng-model="searchP2">
										<option value="">
											--请选择--
										</option>
									</select>
								</label>
								</br>
								街道:<input type="input" style="width:180px" ng-model="searchP3"/><a class="btn btn-success" ng-click="search()">搜索</a>
								</br></br>
								<a class="btn btn-success" ng-click="addItem()">添加</a>
							</div>
							<table class="table table-striped table-bordered table-condensed">
								<thead>
									<tr>
										<th>
											ID
										</th>
										<th>
											区域
										</th>
										<th>
											学校名称
										</th>
										<th>
											街道
										</th>
										<th>
											操作
										</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="item in items">
										<td>
											{{ item.id }}
										</td>
										<td>
											{{ item.aName }}
										</td>
										<td>
											{{ item.sName }}
										</td>
										<td>
											{{ item.name }}
										</td>
										<td>
											<a class="btn btn-primary"
												ng-click="showUpdItem(item.id,item.name,item.aid,item.aName,item.sid,item.sName)">修改</a>
											<a class="btn btn-danger" ng-click="delItem(item.id)">删除</a>
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
		<div class="content" ng-show="addShow">
			<div class="module">
				<div class="module-head">
					<h3>
						街道
					</h3>
				</div>
				<div class="module-body">
					<div class="alert alert-error" ng-show="addError">
						<strong>错误:</strong> {{errms}}
					</div>
					<form class="form-horizontal row-fluid">
						<div class="control-group">
							<label class="control-label" for="basicinput">
								区域
							</label>
							<div class="controls">
								<div class="dropdown">
									<input type="hidden" ng-model="selectId"/>
									<a class="dropdown-toggle btn" href="javascript:;" ng-click="selectItem()">
										{{selectName}}<i class="icon-caret-down"></i>
									</a>
									<ul class="dropdown-menu" ng-show="selectItemShow">
										<li ng-repeat="item in selectitems">
											<a href="javascript:;" ng-click="selectedItem(item.id,item.name)">{{item.name}}</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="basicinput">
								学校
							</label>
							<div class="controls">
								<div class="dropdown">
									<input type="hidden" ng-model="selectSchoolId"/>
									<a class="dropdown-toggle btn" href="javascript:;" ng-click="selectSchoolItem()">
										{{selectSchoolName}}<i class="icon-caret-down"></i>
									</a>
									<ul class="dropdown-menu" ng-show="selectSchoolItemShow">
										<li ng-repeat="item in schoolItems">
											<a href="javascript:;" ng-click="selectedSchoolItem(item.id,item.name)">{{item.name}}</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="basicinput">
								街道名称
							</label>
							<div class="controls">
								<textarea class="span8" rows="5" ng-model="itemName" placeholder="请填写街道名称"></textarea>
								<input type="hidden" ng-model="itemId">
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button class="btn" type="submit" ng-click="addItemSub()">
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
			//初始化List信息
			function initListData($http,$scope){
			    $http({
			        method : "GET",
			        url : "<%=basePath%>street/getStreetList.do"
			    }).then(function mySucces(response) {
			    	$scope.loadingShow = false;
			        $scope.items = response.data.datas;
			    }, function myError(response) {
			    	$scope.loadingShow = false;
			        alert("Street->initListData.do访问错误出错!");
			        console.log(response.statusText);
			    });
			}
			
			//学校下拉框变化
			function schoolOptions($http,$scope){
				$scope.loadingShow = true;
				var aid = $scope.selectId;
				$http({
			        method : "GET",
			        url : "<%=basePath%>street/getSchools.do",
			        params: {
						aid:aid
					}
			    }).then(function mySucces(response) {
			    	$scope.loadingShow = false;
			        $scope.schoolItems = response.data.datas;
			        $scope.selectSchoolId = 0;
			        $scope.selectSchoolName = '';
			        if(response.data.datas!=null&&response.data.datas.length>0){
			        	$scope.selectSchoolId = response.data.datas[0].id;
			        	$scope.selectSchoolName = response.data.datas[0].name;
			        }
			    }, function myError(response) {
			    	$scope.loadingShow = false;
			        alert("Street->getSchools.do访问错误出错!");
			        console.log(response.statusText);
			    });
			}
			
			var app = angular.module('myApp', []);
			app.controller('myCtrl', function($scope,$http) {
				//初始化区域信息
			    $http({
			        method : "GET",
			        url : "<%=basePath%>school/getAreaList.do"
			    }).then(function mySucces(response) {
			        $scope.selectitems = response.data.datas;
			        $scope.selectId = response.data.datas[0].id;
			        $scope.selectName = response.data.datas[0].name;
			        //学校信息
			        schoolOptions($http,$scope);
			    }, function myError(response) {
			    	$scope.loadingShow = false;
			        alert("Street->getAreaList.do访问错误出错!");
			        console.log(response.statusText);
			    });
			    //隐藏加载框
				$scope.loadingShow = true;
				//是否显示下拉框
				$scope.selectItemShow = false;
				//是否显示学校下拉框
				$scope.selectSchoolItemShow = false;
				$scope.selectSchoolId = 0;
				$scope.selectSchoolName = '';
				//区域信息
			    $scope.listShow = true;
			    $scope.addShow = false;
			    $scope.addError = false;
			    $scope.itemName = '';
			    //初始化区域信息
			    initListData($http,$scope);
			    //添加区域信息
			    $scope.addItem = function() {
			        $scope.addShow = true;
				    $scope.listShow = false;
				    $scope.itemId="";
			    };
			    //添加区域提交
			    $scope.addItemSub = function() {
			        if($scope.selectSchoolId==0){
			        	$scope.errms = '请填选择学校';
			        	$scope.addError = true;
			        }else if($scope.itemName == ''){
			        	$scope.errms = '请填写街道名称';
			        	$scope.addError = true;
			        }else{
			        	$scope.addError = false;
			        	$scope.loadingShow = true;
			        	var itemName = $scope.itemName;
			        	itemName = encodeURI(itemName);
			        	var sid = $scope.selectSchoolId;
			         	if($scope.itemId==""){
			         		//增加区域信息
						    $http({
						        method : "POST",
						        url : "<%=basePath%>street/addItem.do",
						        params: {
									name:itemName,
									sid:sid
								}
						    }).then(function mySucces(response) {
						        if(response.data.code==0){
						            $scope.itemName = '';
						            //初始化区域信息
				    				initListData($http,$scope);
								    $scope.addShow = false;
					    			$scope.listShow = true;
						        	alert('添加成功!');
						        }else{
						        	$scope.loadingShow = false;
						        	alert('添加失败!');
						        }
						    }, function myError(response) {
						        alert("Street->addItemSub.do访问错误出错!");
						        console.log(response.statusText);
						    });
			         	}else{
			         		var id = $scope.itemId;
			         		//修改区域信息
						    $http({
						        method : "POST",
						        url : "<%=basePath%>street/updItem.do",
						        params: {
									name:itemName,
									id:id,
									sid:sid
								}
						    }).then(function mySucces(response) {
						        if(response.data.code==0){
						            $scope.itemName = '';
						            //初始化信息
				    				initListData($http,$scope);
								    $scope.addShow = false;
					    			$scope.listShow = true;
						        	alert('修改成功!');
						        }else{
						        	$scope.loadingShow = false;
						        	alert('修改失败!');
						        }
						    }, function myError(response) {
						        alert("Street->updItem.do访问错误出错!");
						        console.log(response.statusText);
						    });
			         	}
			        }
			    };
			    //删除区域信息
			    $scope.delItem = function(id) {
			    	if (window.confirm("是否删除选中项?")) {
			    		$scope.loadingShow = true;
						$http({
					        method : "POST",
					        url : "<%=basePath%>street/delItem.do",
					        params: {
								id:id
							}
					    }).then(function mySucces(response) {
					        if(response.data.code==0){
					            $scope.itemName = '';
					            //初始化信息
				    			initListData($http,$scope);
					        	alert('删除成功!');
					        }else{
					        	$scope.loadingShow = false;
					        	alert('删除失败!');
					        }
					    }, function myError(response) {
					        alert("Street->delItem.do访问错误出错!");
					        console.log(response.statusText);
					    });
					}
			    };
			    //显示修改区域信息
			    $scope.showUpdItem = function(id,name,aid,aName,sid,sname) {
				    $scope.loadingShow = true;
					var aid = $scope.selectId;
					$http({
				        method : "GET",
				        url : "<%=basePath%>street/getSchools.do",
				        params: {
							aid:aid
						}
				    }).then(function mySucces(response) {
				    	$scope.loadingShow = false;
				        $scope.schoolItems = response.data.datas;
				        $scope.selectSchoolId = 0;
				        $scope.selectSchoolName = '';
				        if(response.data.datas!=null&&response.data.datas.length>0){
				        	$scope.selectSchoolId = sid;
				        	$scope.selectSchoolName = sname;
				        }
				        $scope.addShow = true;
					    $scope.listShow = false;
					    $scope.itemId = id;
					    $scope.itemName = name;
					    $scope.selectId = aid;
				        $scope.selectName = aName;
				    }, function myError(response) {
				    	$scope.loadingShow = false;
				        alert("Street->getSchools.do访问错误出错!");
				        console.log(response.statusText);
				    });
			    };
			    //显示下拉框
			    $scope.selectItem = function() {
			    	$scope.selectItemShow = !$scope.selectItemShow;
			    	$scope.selectSchoolItemShow = false;
			    };
			    //选择
			    $scope.selectedItem = function(id,name) {
			    	$scope.selectItemShow = false;
			    	$scope.selectId = id;
			    	$scope.selectName = name;
			    	//学校信息
			        schoolOptions($http,$scope);
			    };
			    //学校下拉选择
			    $scope.selectedSchoolItem = function(id,name) {
			    	$scope.selectSchoolItemShow = false;
			    	$scope.selectSchoolId = id;
			    	$scope.selectSchoolName = name;
			    };
			    //显示学校下拉框
			    $scope.selectSchoolItem = function() {
			    	$scope.selectSchoolItemShow = !$scope.selectSchoolItemShow;
			    };
			    //搜索区域变化
			    $scope.schoolOptions = [];
			    $scope.areaChange = function() {
			    	var searchP1 = "";
			    	if($scope.searchP1!=undefined&&$scope.searchP1!=""){
			    		searchP1 = $scope.searchP1;
			    	}
			    	if(searchP1==""){
			    	
			    	}else{
			    		$scope.loadingShow = true;
						$http({
					        method : "GET",
					        url : "<%=basePath%>street/getSchools.do",
					        params: {
								aid:searchP1
							}
					    }).then(function mySucces(response) {
					    	$scope.loadingShow = false;
					        $scope.schoolOptions = response.data.datas;
					    }, function myError(response) {
					    	$scope.loadingShow = false;
					        alert("Street->getSchools.do访问错误出错!");
					        console.log(response.statusText);
					    });
			    	};
			    };
			    //搜索方法
			    $scope.search = function() {
			    	var searchP1 = 0;
			    	if($scope.searchP1!=undefined&&$scope.searchP1!=""){
			    		searchP1 = $scope.searchP1;
			    	}
			    	var searchP2 = 0;
			    	if($scope.searchP2!=undefined&&$scope.searchP2!=""){
			    		searchP2 = $scope.searchP2;
			    	}
			    	var searchP3 = "";
			    	if($scope.searchP3!=undefined&&$scope.searchP3!=""){
			    		searchP3 = $scope.searchP3;
			    		searchP3 = encodeURI(searchP3);
			    	}
			    	$scope.loadingShow = true;
					$http({
				        method : "GET",
				        url : "<%=basePath%>street/search.do",
				        params: {
							aid:searchP1,
							sid:searchP2,
							name:searchP3
						}
				    }).then(function mySucces(response) {
				    	$scope.loadingShow = false;
				        $scope.items = response.data.datas;
				    }, function myError(response) {
				    	$scope.loadingShow = false;
				        alert("Street->getSchools.do访问错误出错!");
				        console.log(response.statusText);
				    });
			    };
			});
		</script>
	</body>
</html>

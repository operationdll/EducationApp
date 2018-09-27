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
		.wrapper {
			background-color: white;
		}
		
		@media (max-width: 979px) {
		  .span3{display:none;}
		}
		
		@media (min-width: 980px) {
		  .span3{display:block;}
		}
		</style>
	</head>

	<body ng-app="myApp" ng-controller="myCtrl">
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar"> <i
						class="icon-reorder shaded"></i> </a>
					<a class="brand" ng-click="bgPage()">教育系统后台</a>
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
						<iframe src="/html/bg.html" id="contentFrame"
							style="width: 100%; height: 60%; border: 0px;"></iframe>
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
		<script src="<%=basePath%>js/angular1.4.8.min.js"
			type="text/javascript"></script>
		<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript">
			//点击后隐藏菜单
			function hideMemu(){
				if($(window).width()<=979){
					$( ".span3" ).animate({
			          height: "0px",
			          overflow: "hidden"
			        }, 1000 ,function(){
			        	$(".span3").hide();
			        });
				}
			}
			
			var app = angular.module('myApp', []);
			app.controller('myCtrl', function($scope,$http) {
				$scope.bgPage = function() {
			        $("#contentFrame").attr("src","/EducationApp/html/bg.html");
			        hideMemu();
			    };
			    $scope.magArea = function() {
			        $("#contentFrame").attr("src","<%=basePath%>school/areaPage.do");
			        hideMemu();
			    };
			    $scope.magSchool = function() {
			        $("#contentFrame").attr("src","<%=basePath%>myschool/init.do");
			        hideMemu();
			    };
			    $scope.magStreet = function() {
			        $("#contentFrame").attr("src","<%=basePath%>street/init.do");
			        hideMemu();
			    };
			});
			
			$(".btn-navbar").click(function(){
				var isShow = $(".span3").is(":visible");
				if(isShow){
					$( ".span3" ).animate({
			          height: "0px",
			          overflow: "hidden"
			        }, 1000 ,function(){
			        	$(".span3").hide();
			        });
				}else{
					$(".span3").show();
					$( ".span3" ).animate({
			          height: "222px",
			          overflow: "hidden"
			        }, 1000);
				}
			});
			
			window.onresize = function(obj){
				if($(window).width()>979){
					$(".span3").show();
					$(".span3").css({overflow: "hidden",height:"222px"});
				}else{
					$(".span3").hide();
					$(".span3").css({overflow: "hidden",height:"0px"});
				}
			}
			
			window.onload = function(obj){
				if($(window).width()>979){
					$(".span3").show();
					$(".span3").css({overflow: "hidden",height:"222px"});
				}else{
					$(".span3").hide();
					$(".span3").css({overflow: "hidden",height:"0px"});
				}
			}
		</script>
	</body>
</html>

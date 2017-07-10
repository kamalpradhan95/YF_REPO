<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.xml.rpc.ServiceException,java.rmi.RemoteException" %>
<%@ page import="com.hof.mi.web.service.*" %>

<%@ page import="java.util.regex.*" %>


<%!
String Token="";

	public  String gen() throws RemoteException, ServiceException {

		AdministrationServiceResponse rs = null;
		AdministrationServiceRequest rsr = new AdministrationServiceRequest();
		AdministrationServiceService ts = new AdministrationServiceServiceLocator("52.230.20.46", 8080,
				"/services/AdministrationService", false);
		AdministrationServiceSoapBindingStub rssbs = (AdministrationServiceSoapBindingStub) ts
				.getAdministrationService();
		rsr.setLoginId("ganga@aptusdatalabs.com");
		rsr.setPassword("ganga");
		rsr.setOrgId(new Integer(1));
		rsr.setFunction("LOGINUSER");
		AdministrationPerson ap = new AdministrationPerson();
		ap.setUserId("ganga@aptusdatalabs.com");
		ap.setPassword("ganga");
		rsr.setPerson(ap);
		rs = rssbs.remoteAdministrationCall(rsr);
		
		if ("SUCCESS".equals(rs.getStatusCode())) {
			Token=rs.getLoginSessionId();
			System.out.println(rs.getLoginSessionId());
			
		} else {
			System.out.println("error");
		}
		return Token;
	}
	

%>
<%
/*
String token=gen();
out.println("Token:"+token);
/*redirect
String site = new String("./dashboard.jsp?token="+token);
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site); 

*/

%>


<%
String user="";
String src="";
String token="";
user=request.getParameter("user");
if(token.length()<10)
	token=gen();

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yellowfin Embedding Chart</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

<script src="js/jquery-3.0.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- Custom CSS -->
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/font-awesome.min.css">
<script src="js/script.js"></script>
<script src="js/ajax.js"></script>

 </head>
<body>
<nav class="navbar navbar-default  navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" style="background:#4169e1;color:white;">Product & Services</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#" style="background:#4169e1;color:white;">Help</a></li>
	  <li class="active"><a href="#" style="background:#b9c8f4;color:white;">Customer Care</a></li>
      <li><a href="#" style="background:#4169e1;color:white;">Interest Rates</a></li>
	  <!--li><a href="#" style="background:#4169e1;color:white;">What's New</a></li-->
	  <li><a href="#" style="background:#4169e1;color:Yellow;">Margin FAQ</a></li>
      <li><a href="#" style="background:#4169e1;color:white;">Logout</a></li>
    </ul>
	  </div>
	 
   <div class="navbar-header">
      <a class="navbar-brand" href="#"></a>
       <ul class="nav navbar-nav">
      <li class="active"><a href="#" style="color:#1F907D";><b> My Accounts</b></a></li>
	  <li><a href="#" style="color:black";>Payments/Transfers</a></li>
      <li><a href="#" style="color:black";>Bill Payments</a></li>
	  <li><a href="#" style="color:black";>Enquiries</a></li>
	  <li><a href="#" style="color:black";>Profile</a></li>
      <li><a href="#" style="color:black";>e-FD</a></li>
	  <li><a href="#" style="color:black";>e-Tax</a></li>
	  <li><a href="#" style="color:black";>e-Services</a></li>
	  <li><a href="#" style="color:black";>e-Cards</a></li>
	  <!--li><a href="#" style="color:black";>Site Map</a></li-->
    </ul>
  </div>
  </div>
</nav>
  <div class="col-lg-12" style="margin-top:50px;">

	 </div>

 
<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%;">

	  <p class="active"><b style="color:#1F907D";>You are here:</b><b style="color:black";> My Accounts ></b></p>
	   <input type="text" placeholder="Select.." id="myInput" onkeyup="filterFunction()">
	   <button type="button" onclick="alert('Hello world!')">Go</button>
	   
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">Account Summary</a>
  <a href="#" onclick="show();" class="w3-bar-item w3-button" style="color:#00008B;background:#ACCEE6;line-height: 0.5em;">Spend Analyzer</a>
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">Pending Statement</a>
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">View Income Tax Statement</a>
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">Reprint Challan</a>
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">Change Login Password</a>
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">Print e-Receipt For PPF</a>
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">Login to e-Filing</a>
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">Link your Aadhaar Number</a>
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">Link your LPG Customer ID</a>
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">Windows App registration</a>
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">Social Security Schemes</a>
  <a href="#" onclick="hide();" class="w3-bar-item w3-button" style="color:blue;line-height: 0.5em;">e-Statement</a>
  <a href="#" class="w3-bar-item w3-button" style="line-height:0.5em;">-------------------------------------</a>
</div>

<!-- Page Content -->
<div style="margin-left:25%">

<div class="mymargintop">
  <h1>Yellowfin Embedded Demo</h1>
<div align="center" name="piechart" id="piechart">


<!--script type="text/javascript" src="http://localhost:8081/JsAPI?dashUUID=f19e63f5-7175-4c57-897d-ed865aba8972"&width=600&height=500-->

<!--script type="text/javascript" src="http://localhost:8081/JsAPI?dashUUID=f19e63f5-7175-4c57-897d-ed865aba8972&primaryOrg=1&clientOrg=1"&width=600&height=500-->


<%
if(src.length()<50 || token.length()<5){
	src="<script type=\"text/javascript\" src=\"http://52.230.20.46:8080/JsAPI?reportUUID=3415e71d-6ec5-4bca-9502-2b8a0f2137d3&yfFilterf6d944c3-241a-4382-8632-d77c08ee9afa="+user+"&token="+token+"\"></script>";
	out.print(src);
}else{
	
	out.println(src);
}
%>


</div>

<form>
 <fieldset>
  <legend>Details:</legend>
  User: <input type="text" value= "<%out.println(user);%>"><br>
  Token: <input type="text" value= "<%out.println(token);%>"><br>
 </fieldset>
</form>

</div>

</div>

</div>


</body>
</html>

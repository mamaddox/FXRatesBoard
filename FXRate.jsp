
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<html>
<head>
<style>
body {
	font-family: 'FoXE',Arial,Helvetica,sans-serif;
	background-color: #94C33D;
	background-image: url("https://www.smbcgroup.com/SMBC/media/SMBC/SMBC-Global_Map_2.jpg");
}
table#t01 {
    width: 80%; 
	border-collapse: collapse;
	border-color: #d2d5db;
}
table#t01 tr:nth-child(even) {
    background-color: #F0F0F0;
	border-bottom: 1px solid black;
	border-color: #d2d5db;
}
table#t01 tr:nth-child(odd) {
   background-color:#F0F0F0;
   border-bottom: 1px solid black;
   border-color: #d2d5db;
}
table#t01 th {
    background-color: #F0F0F0;
    color: #2E86C1;
	padding: 5px;
}
table#t01 td {
    padding: 5px;
	text-align: center;
	color: black;
}

</style>
</head>
<body>

<%
Map<String, BigDecimal> rates = (Map<String, BigDecimal>) request.getAttribute("rates");
String baseCurrency = (String) request.getAttribute("baseCurrency");
%>

<%
for(String currency: rates.keySet()){
	%>
	<h3><%=currency%>: <%=rates.get(currency) %></h3>
	<%
}
%>


<from method="GET" action="FXRate">
					<select name="baseCurrency">
						<option value="USD" <% if("USD".equals(baseCurrency)) { %>selected<% } %>>USD</option>
						<option value="EUR" <% if("EUR".equals(baseCurrency)) { %>selected<% } %>>EUR</option>
						<option value="CAD" <% if("CAD".equals(baseCurrency)) { %>selected<% } %>>CAD</option>
					</select>
					<input type="submit" value="Refresh" />
</from>

<table style="width=100%" id="t01" align= "center">
	<caption style="text-align:left">FX Rates 2017/07/18</caption>
	<thead>
		<tr>
			<th></th>
			<th><img src=http://fla.fg-a.com/American/1-lg-american-flag.jpg style="width:18.2px;height:14px;"><br>USD</th>
			<th><img src=http://www.clker.com/cliparts/e/c/7/9/11949890211029228051eu_flag_hash_0x8a0ab9c__01.svg.med.png style="width:18.2px;height:14px;"><br>EUR</th>
			<th><img src=https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/1200px-Flag_of_the_United_Kingdom.svg.png style="width:18.2px;height:14px;"><br>GBP</th>
			<th><img src=https://s-media-cache-ak0.pinimg.com/564x/1c/50/5f/1c505fe9b39698142c243607e06236f5.jpg style="width:18.2px;height:14px;"><br>INR</th>
			<th><img src=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAT4AAACfCAMAAABX0UX9AAAA2FBMVEUAJ3b////gADTfACsAAGveABj65ujpcH8AInTfACLysbjfAC3W2uW/xNUAE2+fp8HeABEAAGgpP4IAJHXmVWoAHnP529/panwxRYSRGVnlADHqAC3wn6oAGHHfACUAEG8ACm20us5WZJb29/qTm7nc3+jp6
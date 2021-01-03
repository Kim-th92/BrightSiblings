<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">

	function selectCheck(form) {
		form.submit();
	}
	
	function monthDown(form) {
		if (form.month.value > 1) {
			form.month.value--;
		} else {
			form.month.value = 12;
			form.year.value--;
		}
		form.submit();
	}
	
	function monthUp(form) {
		if (form.month.value < 12) {
			form.month.value++;
		} else {
			form.month.value = 1;
			form.year.value++;
		}
		form.submit();
	}
	
</script>


<body>

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="mypage_middle.jsp"></jsp:include>

<%

	//현재 날짜 정보
	Calendar cal = Calendar.getInstance();

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	
	//오늘 날짜
	String today = year + "." + (month + 1) + "." + date;
	
	//선택한 연도, 월
	String input_year = request.getParameter("year");
	String input_month = request.getParameter("month");
	
	if (input_month != null) {
		month = Integer.parseInt(input_month) - 1;
	}
	
	if (input_year != null) {
		year = Integer.parseInt(input_year);
	}
	
	// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
	cal.set(year, month, 1);
	
	// 셋팅한 날짜로 부터 아래 내용을 구함
	// 해당 월의 첫날를 구함
	int startDate = cal.getMinimum(Calendar.DATE);
	
	// 해당 월의 마지막 날을 구함
	int endDate = cal.getActualMaximum(Calendar.DATE);
	
	// 1일의 요일을 구함
	int startDay = cal.get(Calendar.DAY_OF_WEEK);
	
	int count = 0;
	
%>
	<form method="post" action="mypage_main.do" name="change">
		<table width="400" cellpadding="2" cellspacing="0" border="0" align="center">
		
			<tr>
			
			<td width="140" align="right"><input type="button" value="◁" onClick="monthDown(this.form)"></td>
			
			<td width="120" align="center">
			<select name="year" onchange="selectCheck(this.form)">
				<%
					for (int i = year - 10; i < year + 10; i++) {
					String selected = (i == year) ? "selected" : "";
					String color = (i == year) ? "#CCCCCC" : "#FFFFFF";
					out.print("<option value=" + i + " " + selected + " style=background:" + color + ">" + i + "</option>");
				}
				%>
			</select>
			
			<select name="month" onchange="selectCheck(this.form)">
					<%
						for (int i = 1; i <= 12; i++) {
						String selected = (i == month + 1) ? "selected" : "";
						String color = (i == month + 1) ? "#CCCCCC" : "#FFFFFF";
						out.print("<option value=" + i + " " + selected + " style=background:" + color + ">" + i + "</option>");
					}
					%>
			</select>
			</td>
			
			<td width="140"><input type="button" value="▷" onClick="monthUp(this.form)"></td>
			
			</tr>
			
			<tr>
				<td align="right" colspan="3">
					<a href="mypage_main.do"><font size="2">오늘 : <%=today%></font></a>
				</td>
			</tr>
			
		</table>
	</form>
	<table width="400" cellpadding="2" cellspacing="0" border="1"
		align="center">
		<tr height="30">
			<td><font size="2">일</font></td>
			<td><font size="2">월</font></td>
			<td><font size="2">화</font></td>
			<td><font size="2">수</font></td>
			<td><font size="2">목</font></td>
			<td><font size="2">금</font></td>
			<td><font size="2">토</font></td>
		</tr>
		<tr height="30">
			<%
				for (int i = 1; i < startDay; i++) {
				count++;
			%>
			<td>&nbsp;</td>
			<%
				}
			for (int i = startDate; i <= endDate; i++) {
			String bgcolor = (today.equals(year + ":" + (month + 1) + ":" + i)) ? "#CCCCCC" : "#FFFFFF";
			String color = (count % 7 == 0 || count % 7 == 6) ? "red" : "black";
			count++;
			%>
			<td bgcolor="<%=bgcolor%>"><font size="2" color=<%=color%>><%=i%></font></td>
			<%
				if (count % 7 == 0 && i < endDate) {
			%>
		</tr>
		<tr height="30">
			<%
				}
			}
			while (count % 7 != 0) {
			%>
			<td>&nbsp;</td>
			<%
				count++;
			}
			%>
		</tr>
	</table>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />



</body>
</html>
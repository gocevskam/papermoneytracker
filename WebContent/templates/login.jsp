<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@taglib prefix="s" uri="/struts-tags" %>

<s:if test="#session.get(\"user\") != null">
	<form action="/papermoneytracker/logout.action" method="post">
		<table id="logout_table">
		<tr id="logoutRow">
			<td id="logoutText">
				<s:text name="Logged in as: " />
				<a href="UserProfile.jsp"><s:property value="#session.get(\"user\").username" /></a>
			</td>
      	  	<td>
        		<input id="logoutUser" type="submit" value="Logout" >
        	</td>
    	</tr>
    	</table>
	</form>
</s:if>
<s:else>
<form action="/papermoneytracker/login.action" method="post">
<table id="login_table">
    <tr>
        <th class="right">
            Username:
        </th>
        <th class="left">
            Password:
        </th>
    </tr>
    <tr>
        <td>
            <input type="text" name="username">
        </td>
        <td >
            <input type="password" name="password">
        </td>
        <td>
        	<input id="loginUser" type="submit" value="Login" >
        </td>
    </tr>
	<tr>
		<td><p>Don't have an account?</p></td>
		<td><a href="register.jsp">Register here</a></td>
	</tr>


</table>
<s:if test="hasActionErrors() || hasFieldErrors()">
	<div class="errors">
		<s:actionerror/>
		<s:fielderror />
	</div>
</s:if>
</form>
</s:else>



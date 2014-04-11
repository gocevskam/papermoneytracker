<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="search_bill">
<s:form action="showTrail.action" method="post">
	<tr>
		<td>
			<img src="images/serial-num.png" />
		</td>
	</tr>
	<tr>
		<td>Enter your bill's serial number:</td>
	</tr>
	<tr>
        <td>
            <input id="serialTextField" type="text" name="billSerial">
        </td>
    </tr>
    <tr>
    	<td id="flagStuffIndex"><img id="flagIndex" /><label id="flagLabelIndex" for="flagIndex"></label></td>
    </tr>
    <tr>
    	<td id="inDBtext"></td>
    </tr>
    <tr>
    	<td><label id="trackedOrNot"></label></td>
    </tr>
    <tr>
        <td>
    		<s:submit id="showTraill" method="execute" key="label.show" />
        </td>
    </tr>
    <tr>
        <td>
			<s:submit id="addBill" key="label.add" name="buttonName" />
	    </td>
    </tr>
    <tr>
        <td>
			<s:submit id="addLocation" key="label.addLoc" name="buttonName" />
	    </td>
    </tr>
	<s:if test="#session.get(\"user\") == null">
		<script>
			/**
			 * Disables the add buttons when not logged in.
			 */
			function hideAddButtons() {
				var addB = document.getElementById("addBill");
				addB.title = "Login required.";
				var addL = document.getElementById("addLocation");
				addL.title = "Login required.";
			}	

			hideAddButtons();
		</script>
	</s:if>
	
</s:form>
</div>

<script src="js/searchBill.js">
</script>
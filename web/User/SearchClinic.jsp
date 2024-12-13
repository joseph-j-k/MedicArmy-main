<%-- 
    Document   : SearchHospital
    Created on : 5 Oct, 2024, 1:39:20 PM
    Author     : deepa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Head.jsp" %>
<!DOCTYPE html>

<style>
    .table-responsive {
    display: flex;
    /* width: 100%; */
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
    flex-direction: row;
    flex-wrap: wrap;
    align-content: space-around;
    justify-content: space-around;
}
</style>
 
        
        
 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Clinic</title>
    </head>
    <body onload="fetchClinic()">
        <div class="container">
            <div class="card">
        <form>
            <h1 align="center" class="card-text"><u> Search Clinic</u></h1>
            <div class="card-body" >
            <table align="center" class="table table-responsive table-bordered "> 
                <tr>
                    <td>District</td>
                    <td><select name="seldistrict" id="seldistrict" onchange="getPlace(this.value),fetchClinic()">
                            <option value="">...select...</option>
                                    
                                    
                                    
                                    <%
                                        String selQry="select * from tbl_district";
                                        ResultSet rs=con.selectCommand(selQry);
                                        while(rs.next())
                                        {
                                    %>
                                    
                                    <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                    <%
                                        }
                                    %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><select name="sel_place" id="sel_place" onchange="fetchClinic()">
                            <option value="">--select--</option>
                       
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td><select name="seltype" id="seltype" onchange="fetchClinic()">
                            <option value="">...select...</option>
                                    
                                    
                                    
                                    <%
                                        String selQry3="select * from tbl_type";
                                        ResultSet rs3=con.selectCommand(selQry3);
                                        while(rs3.next())
                                        {
                                    %>
                                    
                                    <option value="<%=rs3.getString("type_id")%>"><%=rs3.getString("type_name")%></option>
                                    <%
                                        }
                                    %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" id="btnsubmit"value="Search"></td>
                </tr>
            </table>
                </div>
        </form>
            <br>
            <br>
                
                
                
                
                
                
           
            <div id="result"> &nbsp;
               
            </div>
            </div>
        </div>
    </body>
                
                
                <script src="../Assets/JQ/jQuery.js"></script>
                        <script>

                                        function getPlace(cid)
                                        {
                                            $.ajax({
                                                url: "../Assets/AjaxPages/AjaxPlace.jsp?cid=" + cid,
                                                success: function(result) {
                                                    $("#sel_place").html(result);

                                                }
                                            });
                                        }
                                        
                                        function fetchClinic(){
                                            var did = document.getElementById("seldistrict").value;
                                            var pid = document.getElementById("sel_place").value;
                                            var cid = document.getElementById("seltype").value;
                                            $.ajax({
                                                url: "../Assets/AjaxPages/AjaxSearchClinic.jsp?did=" + did + "&pid=" + pid + "&cid=" + cid,
                                                success: function(result) {
                                                    console.log(result);
                                                    $("#result").html(result);

                                                }
                                            });
                                        }
                        </script>
    
    
    
</html>

<%@include file="Foot.jsp" %>


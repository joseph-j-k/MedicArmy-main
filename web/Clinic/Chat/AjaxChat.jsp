<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String insQry="insert into tbl_chat(chat_fromdid,chat_touid,chat_content,chat_datetime) values('"+session.getAttribute("cid") +"','"+request.getParameter("uid") +"','"+request.getParameter("chat") +"',DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'))";
    if(con.executeCommand(insQry))
    {
        out.println("sended");
    }
    else
    {
        out.println("failed");
        System.out.println(insQry);
    }
    
%>
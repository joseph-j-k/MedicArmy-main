<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String insQry="insert into tbl_chat(chat_fromuid,chat_todid,chat_content,chat_datetime) values('"+session.getAttribute("uid") +"','"+request.getParameter("cid") +"','"+request.getParameter("chat") +"',DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'))";
    out.print(insQry);
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
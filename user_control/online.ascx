﻿<%@ Control Language="VB" ClassName="online" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub





</script><%= "Online: " & Application("OnlineUsers").ToString()%>
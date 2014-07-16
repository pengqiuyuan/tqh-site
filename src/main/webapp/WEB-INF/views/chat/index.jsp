<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>
            chatofpomelo
        </title>
        <link rel="stylesheet" href="${ctx}/static/chat/css/style.css" type="text/css" />
        <script src="${ctx}/static/chat/js/jquery-1.8.0.min.js">
         		
        </script>
        <script src="${ctx}/static/chat/js/socket.io.js">
                		
        </script>
        <script src="${ctx}/static/chat/js/pomeloclient.js">
                		
        </script>
        <script src="${ctx}/static/chat/js/client.js">
                		
        </script>
        <script src="${ctx}/static/chat/js/pop.js">
                		
        </script>
    </head>

 <body>
        <div id="app"> 
        	<input type="hidden" id="nickName" name="nickName" value="${member.nickName}" >
        	<input type="hidden" id="channelName" name="channelName" value="${channelName}" >       
        	<input type="hidden" id="avatar" name="avatar" value="${member.avatar}" > 
        	<input type="hidden" id="avatarMoRen" name="avatarMoRen" value="${ctx}/static/images/avatar.png" >               
            <div id="loginError">
            </div>
            
            <div id="chatHistory">
            </div>
            <div id="toolbar">
                <ul id="status">
                    <li>
                        users:
                        <select name="users" id="usersList">
                            <option value="*">
                                all
                            </option>
                        </select>
                    </li>
                    <li>
                        name:
                        <span id="name">
                        </span>
                    </li>
                    <li>
                        room:
                        <span id="room">
                        </span>
                    </li>
                    <li>
                        avatar:
                        <img id="avatarimg" src="" style="width: 60px; height: 60px;">
                        </img>
                    </li>
<!--                    <li>
                        button:
                        <input id="history" type="button" value="histroy" style="height:20px;width:100px;" />
                    </li>
                    <li>
                        button:
                        <input id="onLineUsers" type="button" value="onLineUsers" style="height:20px;width:100px;" />
                    </li>
                    <li>
                        button:
                        <input id="isReadMessage" type="button" value="isReadMessage" style="height:20px;width:100px;" />
                    </li>
                    <li>
                        button:
                        <input id="defMessage" type="button" value="defMessage" style="height:20px;width:100px;" />
                    </li>-->
                </ul>
                <input tabindex="1" type="text" id="entry" />
            </div>
        </div>
        <div id="pop">
            <div id="popHead">
                <a id="popClose" title="close">Close</a>
                <h2>
                    Tip
                </h2>
            </div>
            <div id="popContent">
                <dl>
                    <dd id="popIntro">
                    </dd>
                </dl>
                <p id="popMore">
                    No Tip Again
                </p>
            </div>
        </div>
    </body>
</html>

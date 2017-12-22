    <%-- //[START all]--%>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ page import="com.google.appengine.api.users.User" %>
        <%@ page import="com.google.appengine.api.users.UserService" %>
        <%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

        <%-- //[START imports]--%>
        <%@ page import="com.example.guestbook.GroupRegistration" %>
        <%@ page import="com.example.guestbook.Group" %>
        <%@ page import="com.example.guestbook.Guestbook" %>
        <%@ page import="com.googlecode.objectify.Key" %>
        <%@ page import="com.googlecode.objectify.ObjectifyService" %>
        <%-- //[END imports]--%>

        <%@ page import="java.util.List" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

        <html>
            <head>
                <link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
            </head>
        <body><%

                    UserService userService = UserServiceFactory.getUserService();
                    User user = userService.getCurrentUser();
                    if (user != null) {
                        pageContext.setAttribute("user", user);
        %>

        <p>Hello, ${fn:escapeXml(user.nickname)}! (You can
        <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
            <%
    } else {
%>
        <p>Hello!
        <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
        to access the Attendance Tracking System.</p>
      <%
    }
%>

<%-- //[Show currently registered group or the groups to register to]--%>
<%
 
    // Run a query to check of a registration of the current user in a group
    
      List<GroupRegistration> registrations = ObjectifyService.ofy()
          .load()
          .type(GroupRegistration.class)
          .list();

     if (registrations.isEmpty()) {
      //Creating few groups to be able to present them.

     // here we should get all available groups
      List<Group> groups = ObjectifyService.ofy()
          .load()
          .type(Group.class)
          .list();


%>


            <p>Please choose one of the groups below to register:</p>
                    <%
                     String groupName;
                 for (Group group : groups) {
                         groupName = group.name;
                         System.out.println(groupName);
                         pageContext.setAttribute("next_group", groupName);
                 %>

                         <p>${fn:escapeXml(next_group)}</p>
                    <%
                 }
    } else {
                        Group group = registrations.get(0).group;

                        pageContext.setAttribute("registeredGroup", group.name);


%>
            <p>Registered for a group already. ${fn:escapeXml(registeredGroup)}</p>
                    <%
    }
%>
        <a href="availableGroups.jsp">Available Groups</a>

        <p>Create a group</p>
        <form action="/createGroup" method="post">
         <div><textarea name="groupName" rows="1" cols="25"></textarea></div>
         <div><input type="submit" value="Create Group"/></div>
        </form>

        <p>Type an existing group to register to:</p>
        <form action="/registerToGroup" method="post">
        <div><textarea name="groupName" rows="1" cols="25"></textarea></div>
        <div><input type="submit" value="Register for Group"/></div>
        </form>



        </body>
        </html>
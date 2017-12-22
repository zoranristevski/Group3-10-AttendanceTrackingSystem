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
        <body>

        <%-- //[Show currently registered group or the groups to register to]--%>
            <%

      // Run a query to get all available groups
      List<Group> groups = ObjectifyService.ofy()
          .load()
          .type(Group.class)
          .list();


%>

        <p>Available groups:</p>
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
                    %>
        </body>
        </html>
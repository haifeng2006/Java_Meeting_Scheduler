<!DOCTYPE html>
<html lang = "en">
    <head>
	    <meta charset = "utf-8"/>
	    <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
            <link rel="stylesheet" href="../styles/styles.css"/>
            <link rel="stylesheet" href="../styles/menu.css"/>
            <link rel="stylesheet" href="../styles/normalize.css"/>	
            <link rel="stylesheet" href="../styles/example.css">
            <link rel="stylesheet" href="../styles/font-awesome.min.css">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Un-enroll</title>
    </head>
    
    <body>
        <a id="skiplink" href="#main">Skip to main content</a>
	<a id="user" href="#"></a>
        
        <div id="wrapper">
	<header>
	</header>
        
        <%
            if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
        %>
        You are not logged in<br/>
        <a href="..\Login\Login.jsp">Please Login</a>
        <%
            } else {
        %>
                
        <nav>
	    <ul>
                <li><a href="#">Home</a></li>
                <li> <a href="..\Enroll\enroll.html">Enroll/Un-enroll</a></li>
            </ul>
	</nav>
	
        <div id = "main">
	    <section class = "content">
               <h1>Enroll</h1>

                <%@page import="teamproject.college.Module"%>
                <%@page import="teamproject.user.people.Student"%>
                <%@page contentType="text/html" pageEncoding="UTF-8"%>


                <jsp:useBean id="unenroll" class="teamproject.user.people.Student" scope="session">
                </jsp:useBean>


                <% 
                    String email = (String) session.getAttribute("email");
                    
                    if (unenroll.unEnrollToModule(request.getParameter("module"), email)) {
                        out.print("You have been successfully unenrolled from " + request.getParameter("module"));
                    } else {
                        out.print("Sorry, you have failed to unenroll from " + request.getParameter("module"));
                    }
                           
                %>
                <p>
                    <a href="..\Enroll\enroll.html">Go back.</a>
                </p>
            </section>
        </div>
        <%
            }
        %>
         
        <p class = "status"></p>
        </div>
        <footer>
            <p>
            </p>
        </footer>       
    </body>
</html>

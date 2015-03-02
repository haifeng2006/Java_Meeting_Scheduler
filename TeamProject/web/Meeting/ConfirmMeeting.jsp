<%-- 
    Document   : ConfirmMeeting
    Created on : 28-Feb-2015, 15:07:05
    Author     : drgex_000
--%>


            
         
 



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="teamproject.system.Register"%>
<%@page import="teamproject.system.Email" %>

<jsp:useBean id = "register" class="teamproject.system.Register" scope="request"/>
<jsp:useBean id = "emailClass" class="teamproject.system.Email" scope="request"/>


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
            <title>Register Account</title>
    </head>
    
    <body>
        <a id="skiplink" href="#main">Skip to main content</a>
	<a id="user" href="#"></a>
        
        <div id="wrapper">
	<header>
            <img src="../Resources/logo.gif" alt="UCC Logo">
	</header>
            
        <nav>
	    <ul>
                <li><a href="..\TimeTable\TimeTable.jsp">Home</a></li>
                            <li><a href="..\Meeting\SetMeeting.jsp">Set Meeting</a></li>
                            <li><a href="..\Enroll\EnrollModule.jsp">Enroll in Module</a></li>
                            
                            <li><a href="..\Enroll\Unenroll.jsp">Unenroll in Module</a></li>
                            <li><a href="..\TimeTable\SemesterView.jsp">Semester View</a></li>
                            <li><a href="..\UserSettings\Settings.jsp">Settings</a></li>
                            <li><a href="..\LogOut\LogOutAccount.jsp">Sign Out</a></li>
            </ul>
	</nav>
	
        <div id = "main">
	    <section class = "content">
               <h1>You have Registered</h1>
               <form name = "input" action="RegisterAccountAuthentication.jsp" method="POST">
                   <fieldset>
                       
                        <div>
                            <label>First Name:</label>
                            <jsp:getProperty name = "register" property = "firstName"/>
                        </div>
                               
                        <div>   
                            <label>Last Name:</label>
                            <jsp:getProperty name = "register" property = "lastName"/>
                        </div>
         
        
                        <div>
                            <label>Student Number:</label>
                            <jsp:getProperty name = "register" property = "studentNumber"/>
                        </div>
         
                        <div>
                            <label>Email:</label>
                            <jsp:getProperty name = "register" property = "email"/>
                        </div>
        

                        <div>
                            <% 
//                                String registeredResult="";
//                                boolean emailResult;
//                                boolean setConfirmed;
//                                String emailSent="";
//                                
//                                if(register.registerDetailsWithDb() && emailClass.updateDb(register.getEmail())) {
//                                    String email = request.getParameter("email");
//                                    session.setAttribute("email", email );
//                                    registeredResult= "You have registered. ";
//                                  
//                                   
//                                   emailResult = emailClass.sendEmail("UCC TimeTable Registration","Thank you for signing up for UCC TimeTable",email);
//                                   if(emailResult){
//                                      emailSent = "A confirmation email has been sent to you. ";
//                                   }else{
//                                      emailSent ="The email confirmation wasn't sent due to an error. ";
                                 //  }
                                       
                            %>   
                            <%
                               // }else {
                            %>
                                  
                            <% 
                               // }
                            %>
                            <% 
                                   
                                String dateString = request.getParameter("dates");
                                teamproject.meeting.Meeting meeting = (teamproject.meeting.Meeting)session.getAttribute("meeting");
                                out.print("<p>" + meeting + "</p>");
                                boolean success = teamproject.meeting.Meeting.insertMeeting(meeting,dateString);
                                out.print("<p>" + success + "</p>");
           
                                 //out.println(registeredResult+ emailSent);
                            %>  
                            
                        </div>
     
                    </fieldset>
               </form>
            </section>
        </div>
        <p class = "status"></p>
        
        <footer>
            <p>
            
            </p>
        </footer>
    </div>    
    </body>
</html>


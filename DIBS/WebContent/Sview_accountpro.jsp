<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*"%>
    <%@ page import ="oracle.jdbc.driver.*"%>
    <%@ page import="java.util.Random"%>
<%!
    public int generateRandomNumber(int start, int end ){
        Random random = new Random();
        long fraction = (long) ((end - start + 1 ) * random.nextDouble());
        return ((int)(fraction + start));
    }
%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
fieldset {
height:700px;
width:600px;
}
body {
    font-size: 160%;
}
</style>
</head>
<body style="color:blue" background="C:\Users\HP\workspace\College7\WebContent\imagess\Blur.jpeg" >

<% 
            Connection con = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");

            Statement st = con.createStatement();

            String s1 = request.getParameter("password");  
            //String s2 = request.getParameter("semester");
            //String s3 = request.getParameter("branch");
               
             
            
            

           ResultSet rs = 
                st.executeQuery("select * from newaccount1 where password = '" + s1 + "'") ; 

            if(!rs.next()) {
                out.println("Sorry, could not find student information. ");
            } 
            else 
            {
        %>

<br><br><br><br>
         <center><TABLE BORDER="1">
            <TR>
           <TH>Account No.</TH>
               <TH>UserName</TH>
                <TH>Password</TH>
               <TH>Repassword</TH>
               <TH>Amount</TH>
               <TH>Account Type</TH>
               <TH>Gender</TH>
               <TH>Address</TH>
               <TH>Phone</TH>
               <TH>Email</TH>
           </TR>
           <form action="accountregpro.jsp" method="post">
           <TR>
                <TD> <input type="text" name="accountno" value="<%=generateRandomNumber(1000,8888)%>"> </TD>
               <TD> <input type="text" name="username"value="<%= rs.getString(1) %>"> </TD>
               <TD> <input type="text" name="password"value="<%= rs.getString(2) %>"> </TD>
               <TD> <input type="text" name="repassword"value="<%= rs.getString(3) %>"> </TD>
               <TD> <input type="text" name="amount"value="<%= rs.getString(4) %>"> </TD>
               <TD> <input type="text" name="account_type"value="<%= rs.getString(5) %>"> </TD>
               <TD> <input type="text" name="gender"value="<%= rs.getString(6) %>"> </TD>
               <TD> <input type="text" name="address"value="<%= rs.getString(7) %>"> </TD>
               <TD> <input type="text" name="phone"value="<%= rs.getString(8) %>"> </TD>
                <TD> <input type="text" name="email"value="<%= rs.getString(9) %>"> </TD>
           </TR>
            <input type="submit" value="Submit">
           </form>
       </TABLE></center>
       <BR>
       <% 
           } 
       %>
        <center><h2>Please Note Down Your Account No For Future Services .</h2></center>
       <center><h3><a href="index.html">Back To Home Page.</a></h3></center>
        <div id="footer_copyright" >
 
    	    <center><img  alt="Business"  width="196" height="106"></center><br>
		   <center> <p>Digitalization in the banking industry essentially means making banking smooth and Seamless for customers</p>
	  
  © Copyright 2017  <a href="https://clichetox.wordpress.com/">ClicheTox</a> WE MAKE YOUR LIFE SIMPLE....   </div></center>
</div>
       </body></html>
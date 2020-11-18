<%@page import="java.sql.*" %> 
 
<%
     
        Connection connection;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
        //Parameters
        String id = request.getParameter("id");
       
        PreparedStatement ps = connection.prepareStatement("delete from todo  where tid = ?");
        ps.setString(1,id);
        ps.executeUpdate();
        
        %>
            <script>   
                alert("Task Deleted Successfully");     
            </script> 
            
            <h4><a href="index.jsp">Back to Home</a></h4>

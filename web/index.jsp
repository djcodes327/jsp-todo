<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<%
    if(request.getParameter("submit")!= null) {
        //Database URL
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
        //Parameters
        String name = request.getParameter("task");
        
        PreparedStatement ps = con.prepareStatement("insert into todo(tname)values(?)");
        ps.setString(1,name);
        ps.executeUpdate();
    
        
        %>
            <script>   
                alert("Task Addded Successfully");     
            </script> 
    
        <%
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ToDo</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
        <style>
             a { color: #FFFFFF !important; } /* CSS link color */
    </style>
    </head>
    <body>
        
        <h1>ToDo List</h1>
        <br>
        <div class="row container">
            
            <!-- form-->

            <div class="col-sm-4">
                <form action="#" method="POST" >
                    
                    <div align="left">
                        <label class="form-label">Add Task</label>
                        <input type="text" class="form-control" placeholder="Task Name" name="task" required >
                     </div>
                         
                         </br>
                         
                     <div align="left">
                         <input type="submit" id="submit" value="Add Task" name="submit" class="btn btn-info">
                     </div>  
                         
                </form>
                <br><br>
            </div>
            
            
            <!-- Task List-->

            <div class="col-sm-12">
                
                <div class="panel-body">
                    
                    <table width="100%" id="tb1-student" class="table table-bordered" cellspacing="0" cellpadding="0">
                        
                        <thead class="thead-dark">
                            <!--Table Heading-->
                            <tr>
                                <th>Task</th>
                                <th>Status</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            <!--Getting Records-->
                            <%
                                //Database URL
                                Connection connection;
                                Class.forName("com.mysql.jdbc.Driver");
                                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
                                Statement st = connection.createStatement();
                                ResultSet rs = st.executeQuery("select * from todo");
                                
                                while(rs.next()) {
                                    String id = rs.getString("tid");
                                    int val = Integer.parseInt(rs.getString("tstatus").toString());
                                    boolean bool = (val == 1);
                                    if(bool) {
                            %>
                            <tr>
                                <td><%=rs.getString("tname")%></td>
                                <td><button type="button" class="btn btn-dark"><a href="incomplete.jsp?id=<%=id%>" style="font-color: #fff">Not Completed</a></td></button>
                                <td><button type="button" class="btn btn-warning"><a href="update.jsp?id=<%=id%>">Edit</a></button></td>
                                <td><button type="button" class="btn btn-danger"><a href="delete.jsp?id=<%=id%>">Delete</a></button></td>
                            </tr>
                            
                            <% }//if end 
                            
                                else {
                            %>
                                <tr>
                                <td><%=rs.getString("tname")%></td>
                                <td><button type="button" class="btn btn-success"><a href="completed.jsp?id=<%=id%>">Completed</a></td></button>
                                <td><button type="button" class="btn btn-warning"><a href="update.jsp?id=<%=id%>">Edit</a></button></td>
                                <td><button type="button" class="btn btn-danger"><a href="delete.jsp?id=<%=id%>">Delete</a></button></td>
                            </tr>
                            <%} //else end 
                            }//while end 
                            
                            %>
                            
                        </thead>
                    </table>
                    
                </div>
                
            </div>
        
        
        </div>
        
    </body>
</html>

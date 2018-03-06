<%@ page import="java.sql.*" contentType="text/html; ISO-8859-1" pageEncoding="utf-8" %>>

<%!
    Connection conn ;
    PreparedStatement ps ;

    public void jspInit(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:6603/mydb", "root", "mypassword");
            ps = conn.prepareStatement("INSERT INTO account VALUE (?,?,?,?)");
        } catch (Exception e){
            e.printStackTrace();
        }
    }


    public void jspDestroy(){
        try {
            ps.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
%>

<%
    int accountNo = Integer.parseInt(request.getParameter("accno"));
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    int balance = Integer.parseInt(request.getParameter("bal"));

    try {
        ps.setInt(1, accountNo);
        ps.setString(2, lastName);
        ps.setString(3, firstName);
        ps.setInt(4, balance);
        ps.executeUpdate();
    } catch (Exception e){
        e.printStackTrace();
    }
%>

<%@include file="openaccount.html"%>

package main.java;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.sql.*;

public class UserResultHandler extends TagSupport{

   private Connection conn;
   private PreparedStatement ps;

    public UserResultHandler() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


        try {
           conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:6603/mydb", "root", "mypassword");
           ps = conn.prepareStatement("SELECT * FROM user where email=?");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int doStartTag() throws JspException {

        ServletRequest rs = pageContext.getRequest();
        String email  = rs.getParameter("email");
        JspWriter writer = null;

        try {
            ps.setString(1,email);
            ResultSet resultSet = ps.executeQuery();
            writer = pageContext.getOut();
            if(resultSet.next()){
                writer.print("User details are: <br/> First name:");
                writer.print(resultSet.getString(1));
                writer.print("<br/>Last name:");
                writer.print(resultSet.getString(2));
            } else {
                writer.print("User email not found");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return TagSupport.SKIP_BODY;
    }

    @Override
    public void release() {
        try{
            ps.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}

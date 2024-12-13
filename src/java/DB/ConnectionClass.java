/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DB;

import java.sql.*;

/**
 *
 * @author Nandu
 */
public class ConnectionClass {
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    public ConnectionClass() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_clinicappointment", "root",null);

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }



    public boolean executeCommand(String str) { //INSERT,DELETE,UPDATE
        boolean bol = false;
        try {

            st = con.createStatement();
            st.executeUpdate(str);
            bol = true;

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return bol;
    }


    public ResultSet selectCommand(String selQry) {//SELECT
        try {
            st = con.createStatement();
            rs = st.executeQuery(selQry);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return rs;
    }
}
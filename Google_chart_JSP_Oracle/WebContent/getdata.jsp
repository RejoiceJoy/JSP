  <%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@page import="org.json.JSONObject" %>

<%
    Connection con= null;
	String url="jdbc:oracle:thin:@127.0.0.1:1521/xepdb1";
	String uid="scott";
	String pwd="tiger";
	String driver="oracle.jdbc.driver.OracleDriver";
 	try{
  		Class.forName(driver).newInstance();
		con =      
		DriverManager.getConnection(url,uid,pwd);

      ResultSet rs = null;
      List empdetails = new LinkedList();
      JSONObject responseObj = new JSONObject();

       String query = "SELECT id,name from employee2";
       PreparedStatement pstm= con.prepareStatement(query);

       rs = pstm.executeQuery();
       JSONObject empObj = null;

        while (rs.next()) {
            String name = rs.getString("name");
            int empid = rs.getInt("id");
            empObj = new JSONObject();
            empObj.put("name", name);
            empObj.put("empid", empid);
            empdetails.add(empObj);
        }
        responseObj.put("empdetails", empdetails);
    out.print(responseObj.toString());
    }
    catch(Exception e){
        e.printStackTrace();
    }
 %>
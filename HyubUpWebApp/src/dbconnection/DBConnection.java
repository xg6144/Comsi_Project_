package dbconnection;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	public static Connection getConnection() throws SQLException, NamingException,
	ClassNotFoundException{
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/HyupUpWebApp");
		Connection conn = ds.getConnection();
		return conn;
	}
}


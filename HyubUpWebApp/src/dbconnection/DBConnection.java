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
		InitialContext initContext = new InitialContext();
		Context context = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) context.lookup("jdbc/collabos");
		Connection conn = ds.getConnection();
		return conn;
	}
}

